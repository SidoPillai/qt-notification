#include "QtIosNotifier.h"

#include <QVariant>

#import <UserNotifications/UserNotifications.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//@interface NotificationDelegate : UIResponder <UIApplicationDelegate>
//@end

@interface NotificationDelegate : UIResponder <UIApplicationDelegate, UNUserNotificationCenterDelegate>
{
    QtIosNotifier *g_IosNotifier;
}
@end

@implementation NotificationDelegate

- (id) initWithObject:(QtIosNotifier *)localNotification
{
    self = [super init];
    if (self) {
        g_IosNotifier = localNotification;
    }
    return self;
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center
        willPresentNotification:(UNNotification *)notification
            withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
    Q_UNUSED(center)
    long var = [[notification.request.content.userInfo objectForKey:@"ID"] longValue];

    completionHandler(UNNotificationPresentationOptionAlert);
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center
         didReceiveNotificationResponse:(UNNotificationResponse *)response
            withCompletionHandler:(void(^)())completionHandler
{
    Q_UNUSED(center)
    Q_UNUSED(response)
    completionHandler();
}
@end
    
//------------------------------------------------------------------------------

QtIosNotifier::QtIosNotifier()
{
    m_Delegate = [[NotificationDelegate alloc] initWithObject:this];
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error)
    {
        Q_UNUSED(granted);
        if (!error)
        {
            [[UIApplication sharedApplication] registerForRemoteNotifications];
        }
    }];
}

//------------------------------------------------------------------------------

bool QtIosNotifier::show(const QVariant &notificationParameters)
{
    QVariantMap parameters  = notificationParameters.toMap();
    QString caption         = parameters.value("caption", "").toString();
    QString title           = parameters.value("title", "").toString();
    QString identifier      = "identifier";//parameters.value("id", 0).toString();

    // create content
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = title.toNSString();
    content.body = caption.toNSString();
    content.sound = [UNNotificationSound defaultSound];
    content.badge = @([[UIApplication sharedApplication] applicationIconBadgeNumber] + 1);

    // create trigger time
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];

    // unique identifier
    NSString* identifierNSString = identifier.toNSString();

    // create notification request
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifierNSString
            content:content trigger:trigger];

    // add request
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = id(m_Delegate);

    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Local Notification failed");
        }
    }];

    return true;
}

//------------------------------------------------------------------------------

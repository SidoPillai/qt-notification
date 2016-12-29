#include "QtIosNotifier.h"
#include <QVariant>

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NotificationDelegate : UIResponder <UIApplicationDelegate>
@end

@implementation NotificationDelegate
        
- (void)showNotification:(NSString*)title
                          message:(NSString*)msg;
{
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    localNotification.alertBody = msg;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

@end
    
//------------------------------------------------------------------------
QtIosNotifier::QtIosNotifier()
{

}

//------------------------------------------------------------------------
bool QtIosNotifier::show(const QVariant &notificationParameters)
{
    NotificationDelegate *mn = [[[NotificationDelegate alloc] init] autorelease];
    QVariantMap parameters = notificationParameters.toMap();
    QString caption = parameters.value("caption", "").toString();
    QString title = parameters.value("title", "").toString();
    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.alertBody = caption.toNSString();
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    [mn showNotification:title.toNSString() message:caption.toNSString()];
    return true;
}
//------------------------------------------------------------------------

#include "QtMacOsNotifier.h"
#include <QVariant>

#import <Foundation/Foundation.h>
#import <Foundation/NSUserNotification.h>


@interface NotificationDelegate : NSObject <NSUserNotificationCenterDelegate>
@end

@implementation NotificationDelegate

- (BOOL)userNotificationCenter:(NSUserNotificationCenter*)center shouldPresentNotification:(NSUserNotification*)notification;
{
   return YES;
}

- (void)showNotification:(NSString*)title
                          message:(NSString*)msg;
{
  NSUserNotification *notif = [[[NSUserNotification alloc] init] autorelease];
  notif.title = title;
  notif.informativeText = msg;
  notif.soundName = NSUserNotificationDefaultSoundName;
  NSUserNotificationCenter *center = [NSUserNotificationCenter defaultUserNotificationCenter];
  center.delegate = self;
  [center deliverNotification:notif];
}

@end


//-----------------------------------------------------------------------------
QtMacOsNotifier::QtMacOsNotifier()
{

}

//-----------------------------------------------------------------------------
bool QtMacOsNotifier::show(const QVariant &notificationParameters)
{
    NotificationDelegate *mn = [[[NotificationDelegate alloc] init] autorelease];
    QVariantMap parameters = notificationParameters.toMap();
    QString caption = parameters.value("caption", "").toString();
    QString title   = parameters.value("title", "").toString();
    [mn showNotification:title.toNSString() message:caption.toNSString()];
    return true;
}

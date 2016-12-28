#include "QtIosNotifier.h"
#include <QVariant>

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//------------------------------------------------------------------------
QtIosNotifier::QtIosNotifier()
{
    UIUserNotificationType types = UIUserNotificationTypeBadge |
                 UIUserNotificationTypeSound | UIUserNotificationTypeAlert;

    UIUserNotificationSettings *mySettings =
                [UIUserNotificationSettings settingsForTypes:types categories:nil];

    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];

}

//------------------------------------------------------------------------
bool QtIosNotifier::show(const QVariant &notificationParameters)
{
    QVariantMap parameters = notificationParameters.toMap();
    QString caption = parameters.value("caption", "").toString();

    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    localNotification.alertBody = caption.toNSString();
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    return true;
}
//------------------------------------------------------------------------

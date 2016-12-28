#include "QtAndroidNotifier.h"

#include <QVariant>
#include <QtAndroid>

//----------------------------------------------------------------------
bool QtAndroidNotifier::show(const QVariant &notificationParameters)
{
    QVariantMap parameters = notificationParameters.toMap();
    QString caption = parameters.value("caption", "").toString();
    QString title   = parameters.value("title", "").toString();
    int id          = parameters.value("id", 0).toInt();

    QAndroidJniObject jni_caption = QAndroidJniObject::fromString(caption);
    QAndroidJniObject jni_title   = QAndroidJniObject::fromString(title);

    QAndroidJniObject::callStaticMethod<void>("ru/notifications/javalib/QtAndroidNotifications",
                                              "show",
                                              "(Ljava/lang/String;Ljava/lang/String;I)V",
                                              jni_title.object<jstring>(),
                                              jni_caption.object<jstring>(),
                                              (jint) id);
    return true;
}
//----------------------------------------------------------------------
bool QtAndroidNotifier::hide(const QVariant &notificationParameters)
{
    int id = 0;
    if (notificationParameters.type() == QVariant::Int) {
        id = notificationParameters.toInt();
    }
    QAndroidJniObject::callStaticMethod<void>("ru/notifications/javalib/QtAndroidNotifications",
                                              "show",
                                              "(I)V",
                                              (jint) id);
    return true;
}
//----------------------------------------------------------------------
bool QtAndroidNotifier::hideAll()
{
    QAndroidJniObject::callStaticMethod<void>("ru/notifications/javalib/QtAndroidNotifications",
                                              "hideAll",
                                              "()V");
    return true;
}

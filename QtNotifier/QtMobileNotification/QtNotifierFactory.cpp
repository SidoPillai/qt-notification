#include "QtNotifierFactory.h"
#include <QDebug>

#if defined (Q_OS_ANDROID)
    #include "QtAndroidNotifier.h"
#elif defined (Q_OS_IOS)
    #include "QtIosNotifier.h"
#elif defined(Q_OS_MACOS)
    #include "QtMacOsNotifier.h"
#endif


QtAbstractNotifier *QtNotifierFactory::GetPlatformDependencyNotifier()
{
    qDebug() << "Inside";

#if defined Q_OS_ANDROID
    return new QtAndroidNotifier();
#elif defined Q_OS_IOS
    return new QtIosNotifier();
#elif defined(Q_OS_MACOS)
    qDebug() << "Mac OS";
    return new QtMacOsNotifier();
#endif
    qWarning("QtNotifierFactory: doesn't support your platform");
    return NULL;
}

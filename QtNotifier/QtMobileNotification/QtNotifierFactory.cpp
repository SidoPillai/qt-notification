#include "QtNotifierFactory.h"

#include <QDebug>

#if defined (Q_OS_ANDROID)
    #include "QtAndroidNotifier.h"
#elif defined (Q_OS_IOS)
    #include "QtIosNotifier.h"
#endif

//------------------------------------------------------------------------------

QtAbstractNotifier *QtNotifierFactory::GetPlatformDependencyNotifier()
{
#if defined Q_OS_ANDROID
    return new QtAndroidNotifier();
#elif defined Q_OS_IOS
    return new QtIosNotifier();
#endif
    qWarning("QtNotifierFactory: doesn't support your platform");
    return nullptr;
}

//------------------------------------------------------------------------------

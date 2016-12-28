#include "QtNotification.h"
#include "QtNotifierFactory.h"

QtNotification::QtNotification(QObject *parent)
    : QObject(parent)
    , _Notifier(NULL)
{
    _Notifier = QtNotifierFactory::GetPlatformDependencyNotifier();
}

//-----------------------------------------------------------------------------
QtNotification::~QtNotification()
{
    if (_Notifier != NULL) {
        delete _Notifier;
    }
}

//-----------------------------------------------------------------------------
bool QtNotification::show(const QVariant &notificationParameters)
{
    return _Notifier == NULL
            ? false
            : _Notifier->show(notificationParameters);
}

//-----------------------------------------------------------------------------
bool QtNotification::hide(const QVariant &notificationParameters)
{
    return _Notifier == NULL
            ? false
            : _Notifier->hide(notificationParameters);
}

//-----------------------------------------------------------------------------
bool QtNotification::hideAll()
{
    return _Notifier == NULL
            ? false
            : _Notifier->hideAll();
}

//-----------------------------------------------------------------------------
void QtNotification::declareQML()
{
    qmlRegisterType<QtNotification>("QtNotification", 1, 0, "Notification");
}

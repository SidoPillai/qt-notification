#ifndef QTDESKTOPNOTIFIER_H
#define QTDESKTOPNOTIFIER_H

#include "QtAbstractNotifier.h"

#include <QSystemTrayIcon>

class QtDesktopNotifier : public QtAbstractNotifier
{
public:
    QtDesktopNotifier();

public:
    bool show(const QVariant &notificationParameters);

private:
    QSystemTrayIcon* m_SystemTrayIcon;
};
#endif // QTDESKTOPNOTIFIER_H

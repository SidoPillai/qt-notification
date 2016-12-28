#ifndef QTMACOSNOTIFIER_H
#define QTMACOSNOTIFIER_H

#include <QObject>
#include "QtAbstractNotifier.h"

class QtMacOsNotifier : public QtAbstractNotifier
{

    public:
        explicit QtMacOsNotifier();
        bool show(const QVariant &notificationParameters);
};

#endif // QTMACOSNOTIFIER_H

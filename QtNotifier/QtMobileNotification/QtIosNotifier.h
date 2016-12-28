#ifndef QTIOSNotifier_H
#define QTIOSNotifier_H

#include "QtAbstractNotifier.h"

class QtIosNotifier : public QtAbstractNotifier
{
    public:
        QtIosNotifier();
        bool show(const QVariant &notificationParameters);
};

#endif // QTIOSNotifier_H

#ifndef QTANDROIDNotifier_H
#define QTANDROIDNotifier_H

#include "QtAbstractNotifier.h"

class QtAndroidNotifier : public QtAbstractNotifier
{
    public:
        QtAndroidNotifier() {}

        bool show(const QVariant &notificationParameters);
        bool hide(const QVariant &notificationParameters);
        bool hideAll();
};

#endif // QTANDROIDNotifier_H

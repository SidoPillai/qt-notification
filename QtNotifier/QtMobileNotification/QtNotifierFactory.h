#ifndef QTNotifierFACTORY_H
#define QTNotifierFACTORY_H

#include "QtAbstractNotifier.h"

class QtNotifierFactory
{
    public:
    /// set the Notification class based on operaying system
    static QtAbstractNotifier *GetPlatformDependencyNotifier();
};

#endif // QTNotifierFACTORY_H

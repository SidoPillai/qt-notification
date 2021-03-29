#ifndef QTNOTIFIERFACTORY_H
#define QTNOTIFIERFACTORY_H

#include "QtAbstractNotifier.h"

class QtNotifierFactory
{
    public:
    /// set the Notification class based on operaying system
    static QtAbstractNotifier *GetPlatformDependencyNotifier();
};

#endif // QTNOTIFIERFACTORY_H

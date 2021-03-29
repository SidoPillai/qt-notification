#ifndef QTIOSNOTIFIER_H
#define QTIOSNOTIFIER_H

#include "QtAbstractNotifier.h"

class QtIosNotifier : public QtAbstractNotifier
{
public:
    QtIosNotifier();

public:
    bool show(const QVariant &notificationParameters);

private:
    void                *m_Delegate;
};

#endif // QTIOSNOTIFIER_H

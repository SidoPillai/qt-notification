#ifndef QTNOTIFICATION_H
#define QTNOTIFICATION_H

#include <QObject>
#include "QtAbstractNotifier.h"
#include <qqml.h>

/**
 * @brief The generic notification wrapper common for all platform
 */
class QtNotification : public QObject
{
    Q_OBJECT
    public:
        explicit QtNotification(QObject *parent = 0);
        ~QtNotification();

    /// @see QtAbstractNotifier
    Q_INVOKABLE bool show(const QVariant &notificationParameters);

    /// @see QtAbstractNotifier
    Q_INVOKABLE bool hide(const QVariant &notificationParameters);

    /// @see QtAbstractNotifier
    Q_INVOKABLE bool hideAll();

    ///! @brief The registry for QML object notification
    static void declareQML() ;

    private:
        /// \brief The notifier object which maps to the notification methods for
        /// the respective platforms
        QtAbstractNotifier *_Notifier;
};

#endif // QTNOTIFICATION_H

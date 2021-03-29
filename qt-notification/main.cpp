#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "QtNotification.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<QtNotification>("QtNotification", 1, 0, "Notification");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

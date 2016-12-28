#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "QtNotification.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QtNotification::declareQML();

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}


INCLUDEPATH += $$PWD

# cross platform components
HEADERS += \
    $$PWD/QtNotification.h \
    $$PWD/QtAbstractNotifier.h \    
    $$PWD/QtNotifierFactory.h \
    $$PWD/QtMacOsNotifier.h

SOURCES += \
    $$PWD/QtNotification.cpp \    
    $$PWD/QtNotifierFactory.cpp

android {
    #android-components

    QT += androidextras

    HEADERS += $$PWD/QtAndroidNotifier.h
    SOURCES += $$PWD/QtAndroidNotifier.cpp
    DISTFILES += \
        $$PWD/QtMobileNotificationAndroid/src/ru/notifications/javalib/*.java \
        $$PWD/QtMobileNotificationAndroid/*.gradle
}

ios {
    LIBS += -framework Foundation

    #ios-components
    HEADERS += $$PWD/QtIosNotifier.h
    OBJECTIVE_SOURCES += $$PWD/QtIosNotifier.mm
}

macx {
    LIBS += -framework Foundation

    # macx-components
    HEADERS += $$PWD/QtMacOsNotifier.h
    OBJECTIVE_SOURCES += $$PWD/QtMacOsNotifier.mm
}


INCLUDEPATH += $$PWD

# cross platform components
HEADERS += \
    $$PWD/QtNotification.h \
    $$PWD/QtAbstractNotifier.h \    
    $$PWD/QtNotifierFactory.h

SOURCES += \
    $$PWD/QtNotification.cpp \    
    $$PWD/QtNotifierFactory.cpp

android {
    #android-components

    QT += androidextras

    HEADERS += $$PWD/QtAndroidNotifier.h
    SOURCES += $$PWD/QtAndroidNotifier.cpp

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

}

ios {
    LIBS += -framework UIKit
    LIBS += -framework Foundation
    LIBS += -framework UserNotifications

    #ios-components
    HEADERS += $$PWD/QtIosNotifier.h
    OBJECTIVE_SOURCES += $$PWD/QtIosNotifier.mm
}

DISTFILES += \
    $$PWD/../android/src/ru/notifications/javalib/QtAndroidNotifications.java

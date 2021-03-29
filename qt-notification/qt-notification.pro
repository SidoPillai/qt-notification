QT += qml quick
CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
    QtAbstractNotifier.h \
    QtNotification.h \
    QtNotifierFactory.h

SOURCES += \
    QtNotification.cpp \
    QtNotifierFactory.cpp \
    main.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

android {
QT += androidextras
HEADERS += QtAndroidNotifier.h
SOURCES += QtAndroidNotifier.cpp

DISTFILES += \
    android/AndroidManifest.xml \
    android/build.gradle \
    android/gradle.properties \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew \
    android/gradlew.bat \
    android/res/drawable-hdpi/icon.png \
    android/res/drawable-ldpi/icon.png \
    android/res/drawable-mdpi/icon.png \
    android/res/values/libs.xml \
    android/src/com/notification/javalib/QtAndroidNotification.java

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

ANDROID_ABIS = armeabi-v7a
}

ios {
LIBS += -framework UIKit
LIBS += -framework Foundation
LIBS += -framework UserNotifications

HEADERS += QtIOSNotifier.h
OBJECTIVE_SOURCES += QtIOSNotifier.mm
}

!android:!ios {
QT += widgets
HEADERS += QtDesktopNotifier.h
SOURCES += QtDesktopNotifier.cpp
}

RESOURCES += \
    qml.qrc


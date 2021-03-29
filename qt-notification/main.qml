import QtQuick 2.12
import QtQuick.Window 2.12

import QtNotification 1.0

Window {
    visible: true

    Notification {
        id: notification
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            // every notification must have a unique id
            // hint try random integer
            notification.show({
                              caption: "hello",
                              title  : "notification",
                              id     : 0
                          });
        }
    }

    Text {
        text: qsTr("Tap at me")
        anchors.centerIn: parent
    }
}


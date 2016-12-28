import QtQuick 2.5
import QtQuick.Window 2.2

import QtNotification 1.0

Window {
    visible: true

    Notification {
        id: notification
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("clicked")

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


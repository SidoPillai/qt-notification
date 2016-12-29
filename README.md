# qt-notification-cross-platform
Trigger Local Notifications via qml for mac, iOS and Android. 

Developed on Qt Version: Qt 5.8 (beta) <br>
Platform Supported: Mac, Android and iOS

## Usage
```
notification.show({
                      caption: "hello",
                      title  : "notification",
                      id     : 0
                  });
```

### Note
Local Notifications for iOS are triggered when the app is running in background


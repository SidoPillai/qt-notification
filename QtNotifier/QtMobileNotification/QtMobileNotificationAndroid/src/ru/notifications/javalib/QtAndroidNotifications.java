package ru.notifications.javalib;

// Qt
import org.qtproject.qt5.android.QtNative;

// android
import android.content.Intent;
import android.content.Context;
import android.app.PendingIntent;
import android.app.NotificationManager;

// java
import java.lang.String;

class QtAndroidNotifications {

    public static void show(String title, String caption, int id) {
        System.out.println("show");

        Context context = QtNative.activity();

        NotificationManager notificationManager = getManager();
        Notification.Builder builder =
                new Notification.Builder(context)
                .setSmallIcon(android.R.drawable.ic_delete) // id_delete - первая попавшаяся иконка
                .setContentTitle(title)
                .setContentText(caption)
                .setAutoCancel(true);

        String packageName = context.getApplicationContext().getPackageName();
        Intent resultIntent = context.getPackageManager().getLaunchIntentForPackage(packageName);
        resultIntent.setFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);

        PendingIntent resultPendingIntent =
            PendingIntent.getActivity(
            context, 0,
            resultIntent, PendingIntent.FLAG_UPDATE_CURRENT
        );

        builder.setContentIntent(resultPendingIntent);
        notificationManager.notify(id, builder.build());
    }

    /* Скрывает уведомление по id */
    public static void hide(int id) {
        getManager().cancel(id);
    }

    /* Скрывает все уведомления */
    public static void hideAll() {
        getManager().cancelAll();
    }

    private static NotificationManager getManager() {
        Context context = QtNative.activity();
        return (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
    }
}


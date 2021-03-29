package com.notification.javalib;

import org.qtproject.qt5.android.QtNative;

import android.app.PendingIntent;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.NotificationChannel;
import android.content.Intent;
import android.content.Context;
import android.graphics.Color;
import android.graphics.BitmapFactory;
import android.os.Build;

import java.lang.String;

import org.qtproject.example.R;

public class QtAndroidNotification
{
    private static String channelId = "QtAndroidNotification";
    private static String channelName = "General";

    public static void show(String title, String messageBody, int id)
    {
        Context context = QtNative.activity();
        NotificationManager notificationManager = getManager();
        Notification.Builder builder = null;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
        {
            NotificationChannel notificationChannel = new NotificationChannel(channelId, channelName,
                                                        NotificationManager.IMPORTANCE_DEFAULT);
            notificationChannel.enableLights(true);
            notificationChannel.enableVibration(true);
            notificationChannel.setLightColor(Color.GREEN);
            notificationChannel.setVibrationPattern(new long[]{500,500,500,500,500});
            notificationChannel.setLockscreenVisibility( Notification.VISIBILITY_PUBLIC);
            notificationManager.createNotificationChannel(notificationChannel);
            builder = new Notification.Builder(context, channelId);
        }
        else
        {
            builder = new Notification.Builder(context);
        }

        builder.setSmallIcon(R.drawable.icon);
        builder.setContentTitle(title);
        builder.setContentText(messageBody);
        builder.setAutoCancel(true);
        builder.setLargeIcon(BitmapFactory.decodeResource(context.getResources(),R.drawable.icon));
        String packageName = context.getApplicationContext().getPackageName();
        Intent resultIntent = context.getPackageManager().getLaunchIntentForPackage(packageName);
        resultIntent.setFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
        PendingIntent resultPendingIntent = PendingIntent.getActivity(context, 0,
            resultIntent, PendingIntent.FLAG_UPDATE_CURRENT);
        builder.setContentIntent(resultPendingIntent);
        notificationManager.notify(id, builder.build());
    }

    private static NotificationManager getManager()
    {
        Context context = QtNative.activity();
        return (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
    }
}

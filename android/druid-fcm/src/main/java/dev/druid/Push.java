package dev.druid;

import com.google.firebase.messaging.FirebaseMessaging;

/**
 * Firebase Cloud Messaging for the Nim side's `push()`. The token and the
 * messages are "push" events: ("token", token), ("message", from, id, title,
 * body, key, value, ...), ("error", why).
 */
public final class Push {
    private Push() {}

    /** Present: this module is in the app. */
    public static boolean isAvailable() { return true; }

    public static void requestToken() {
        FirebaseMessaging.getInstance().getToken().addOnCompleteListener(t -> {
            if (t.isSuccessful()) Druid.post("push", "token", t.getResult());
            else Druid.post("push", "error", String.valueOf(t.getException()));
        });
    }

    public static void deleteToken() { FirebaseMessaging.getInstance().deleteToken(); }

    public static void subscribe(String topic) {
        FirebaseMessaging.getInstance().subscribeToTopic(topic).addOnFailureListener(
            e -> Druid.post("push", "error", "subscribe " + topic + ": " + e));
    }

    public static void unsubscribe(String topic) {
        FirebaseMessaging.getInstance().unsubscribeFromTopic(topic).addOnFailureListener(
            e -> Druid.post("push", "error", "unsubscribe " + topic + ": " + e));
    }
}

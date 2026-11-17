package dev.druid;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;
import java.util.ArrayList;
import java.util.Map;

/** Firebase's messages and tokens as "push" events, kept until the app polls. */
public class DruidMessagingService extends FirebaseMessagingService {
    @Override public void onNewToken(String token) {
        Druid.init(this);
        Druid.postDurable(this, "push", "token", token);
    }

    @Override public void onMessageReceived(RemoteMessage m) {
        Druid.init(this);
        Druid.postDurable(this, "push", fields(m));
    }

    static Object[] fields(RemoteMessage m) {
        ArrayList<Object> f = new ArrayList<>();
        RemoteMessage.Notification n = m.getNotification();
        f.add("message");
        f.add(m.getFrom());
        f.add(m.getMessageId());
        f.add(n == null ? "" : n.getTitle());
        f.add(n == null ? "" : n.getBody());
        for (Map.Entry<String, String> e : m.getData().entrySet()) {
            f.add(e.getKey());
            f.add(e.getValue());
        }
        return f.toArray();
    }
}

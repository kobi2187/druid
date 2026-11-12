package dev.druid.sample;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * Shows what Druid reports about the device, from Nim (libdruidsample.so),
 * and asks for the camera permission through Druid when the button is pressed.
 */
public class MainActivity extends Activity {
    static { System.loadLibrary("druidsample"); }

    native void nativeStart(Activity activity);
    native String nativeReport();
    native void nativeAskCamera();
    native String nativePoll();

    TextView report;
    TextView log;

    @Override protected void onCreate(Bundle saved) {
        super.onCreate(saved);
        nativeStart(this);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        int pad = (int) (16 * getResources().getDisplayMetrics().density);
        root.setPadding(pad, pad, pad, pad);
        report = new TextView(this);
        Button ask = new Button(this);
        ask.setText("Ask for the camera");
        ask.setOnClickListener(v -> nativeAskCamera());
        log = new TextView(this);
        root.addView(report);
        root.addView(ask);
        root.addView(log);
        setContentView(root);
    }

    @Override protected void onResume() {
        super.onResume();
        refresh();
    }

    /** Re-reads the report and appends what happened since the last call. */
    void refresh() {
        report.setText(nativeReport());
        String events = nativePoll();
        if (!events.isEmpty()) log.append(events + "\n");
    }
}

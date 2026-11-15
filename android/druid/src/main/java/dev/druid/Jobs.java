package dev.druid;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;

/**
 * Background work scheduled with the system's JobScheduler, which runs it when
 * its conditions hold (a network, charging), the app running or not. Each run
 * is a "job" event (id, time ms), kept until the app reads it: what the app does
 * then (sync, clean up) it does the next time its Nim code runs.
 */
public final class Jobs {
    private Jobs() {}

    private static JobScheduler js() {
        return (JobScheduler) Druid.context().getSystemService(Context.JOB_SCHEDULER_SERVICE);
    }

    /**
     * Schedules job {@code id}, replacing one with the same id.
     *
     * @param periodMinutes 0 for once; else every so many minutes (Android's minimum is 15)
     * @param delayMs       once-only: not before this long from now
     * @param network       0 any, 1 any network, 2 unmetered (Wi-Fi)
     * @param charging      only while charging
     * @param persisted     kept across reboots (the druid library declares RECEIVE_BOOT_COMPLETED)
     */
    public static boolean schedule(int id, long periodMinutes, long delayMs, int network,
                                   boolean charging, boolean persisted) {
        JobInfo.Builder b = new JobInfo.Builder(id, new ComponentName(Druid.context(), DruidJobService.class));
        if (periodMinutes > 0) b.setPeriodic(Math.max(15, periodMinutes) * 60_000L);
        else if (delayMs > 0) b.setMinimumLatency(delayMs);
        if (network == 1) b.setRequiredNetworkType(JobInfo.NETWORK_TYPE_ANY);
        else if (network == 2) b.setRequiredNetworkType(JobInfo.NETWORK_TYPE_UNMETERED);
        if (charging) b.setRequiresCharging(true);
        if (persisted) b.setPersisted(true);
        // A one-off job must have some condition (Android 7-9 refuse one without): run it soon.
        if (periodMinutes <= 0 && delayMs <= 0 && network == 0 && !charging) b.setOverrideDeadline(0);
        return js().schedule(b.build()) == JobScheduler.RESULT_SUCCESS;
    }

    public static void cancel(int id) { js().cancel(id); }
    public static void cancelAll() { js().cancelAll(); }

    /** Ids of the scheduled jobs. */
    public static int[] scheduled() {
        java.util.List<JobInfo> all = js().getAllPendingJobs();
        int[] ids = new int[all.size()];
        for (int k = 0; k < ids.length; k++) ids[k] = all.get(k).getId();
        java.util.Arrays.sort(ids);
        return ids;
    }

    /** It ran: reported. */
    static void ran(Context c, int id) {
        Druid.postDurable(c, "job", id, System.currentTimeMillis());
    }
}

package dev.druid;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.Context;
import java.util.List;
import org.junit.Test;
import org.robolectric.Robolectric;

public class JobsTest extends DruidTestBase {
    private JobScheduler js() { return (JobScheduler) app.getSystemService(Context.JOB_SCHEDULER_SERVICE); }

    private JobInfo job(int id) {
        for (JobInfo j : js().getAllPendingJobs()) if (j.getId() == id) return j;
        throw new AssertionError("no job " + id);
    }

    @Test public void schedulesWithItsConditions() {
        assertTrue(Jobs.schedule(1, 60, 0, 2, true, true));
        JobInfo j = job(1);
        assertTrue(j.isPeriodic());
        assertEquals(60 * 60_000L, j.getIntervalMillis());
        assertEquals(JobInfo.NETWORK_TYPE_UNMETERED, j.getNetworkType());
        assertTrue(j.isRequireCharging());
        assertTrue(j.isPersisted());
        assertTrue(Jobs.schedule(2, 0, 5000, 1, false, false));
        assertFalse(job(2).isPeriodic());
        assertEquals(5000, job(2).getMinLatencyMillis());
        assertEquals(JobInfo.NETWORK_TYPE_ANY, job(2).getNetworkType());
        assertArrayEquals(new int[] { 1, 2 }, Jobs.scheduled());
    }

    @Test public void periodsAreAtLeastFifteenMinutes() {
        Jobs.schedule(3, 5, 0, 0, false, false);
        assertEquals(15 * 60_000L, job(3).getIntervalMillis());
    }

    @Test public void cancel() {
        Jobs.schedule(4, 0, 0, 0, false, false);
        Jobs.schedule(5, 0, 0, 0, false, false);
        Jobs.cancel(4);
        assertArrayEquals(new int[] { 5 }, Jobs.scheduled());
        Jobs.cancelAll();
        assertEquals(0, Jobs.scheduled().length);
    }

    @Test public void aRunIsAnEvent() {
        DruidJobService service = Robolectric.setupService(DruidJobService.class);
        long before = System.currentTimeMillis();
        service.ran(7);
        List<String[]> ev = events("job");
        assertEquals(1, ev.size());
        assertEquals("7", ev.get(0)[1]);
        assertTrue(Long.parseLong(ev.get(0)[2]) >= before);
    }
}

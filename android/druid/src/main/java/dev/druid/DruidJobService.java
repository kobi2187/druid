package dev.druid;

import android.app.job.JobParameters;
import android.app.job.JobService;

/** Runs a Jobs job: reports it (a "job" event) and is done at once. */
public class DruidJobService extends JobService {
    @Override public boolean onStartJob(JobParameters params) {
        ran(params.getJobId());
        return false;          // nothing left running
    }

    void ran(int id) {
        Druid.init(this);
        Jobs.ran(this, id);
    }

    @Override public boolean onStopJob(JobParameters params) { return false; }
}

/* stdout and stderr into logcat. Android discards both, so without this a
 * Nim program's `echo`, its unhandled-exception trace and anything a library
 * prints vanish. A pipe per stream and a thread that writes each line to
 * logcat, under the tags "stdout" and "stderr". */
#include <android/log.h>
#include <fcntl.h>
#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

struct druid_stream {
  int fd; const char *tag; int prio;
  pthread_mutex_t lock;            /* the reader thread and the atexit flush */
  char line[1024]; size_t used;
};

static void druid_feed(struct druid_stream *s, const char *buf, ssize_t n) {
  for (ssize_t i = 0; i < n; i++) {
    if (buf[i] == '\n' || s->used == sizeof s->line - 1) {
      s->line[s->used] = 0;
      __android_log_write(s->prio, s->tag, s->line);
      s->used = 0;
      if (buf[i] == '\n') continue;
    }
    s->line[s->used++] = buf[i];
  }
}

static void *druid_pump(void *arg) {
  struct druid_stream *s = (struct druid_stream *)arg;
  char buf[1024];
  ssize_t n;
  while ((n = read(s->fd, buf, sizeof buf)) > 0) {
    pthread_mutex_lock(&s->lock);
    druid_feed(s, buf, n);
    pthread_mutex_unlock(&s->lock);
  }
  return NULL;
}

/* exit() ends the reader threads before they read the last lines -- and the
 * last lines are the ones that say why (raylib's fatal TraceLog exits with 1,
 * Nim's unhandled exception too). Read what is left, here, before the end. */
static struct druid_stream druid_out, druid_err;
static void druid_drain(struct druid_stream *s) {
  char buf[1024];
  ssize_t n;
  if (s->fd <= 0) return;
  pthread_mutex_lock(&s->lock);
  fcntl(s->fd, F_SETFL, fcntl(s->fd, F_GETFL) | O_NONBLOCK);
  while ((n = read(s->fd, buf, sizeof buf)) > 0) druid_feed(s, buf, n);
  if (s->used > 0) druid_feed(s, "\n", 1);
  pthread_mutex_unlock(&s->lock);
}
static void druid_flush_at_exit(void) {
  fflush(stdout);
  fflush(stderr);
  druid_drain(&druid_out);
  druid_drain(&druid_err);
}

static int druid_redirect(int target, const char *tag, int prio, struct druid_stream *s) {
  int p[2];
  pthread_t t;
  if (pipe(p) != 0) return 0;
  if (dup2(p[1], target) < 0) { close(p[0]); close(p[1]); return 0; }
  close(p[1]);
  s->fd = p[0]; s->tag = tag; s->prio = prio; s->used = 0;
  pthread_mutex_init(&s->lock, NULL);
  if (pthread_create(&t, NULL, druid_pump, s) != 0) return 0;
  pthread_detach(t);
  return 1;
}

/* Idempotent; returns 1 when both streams go to logcat. */
int druid_stdio_to_logcat(void) {
  static int done = 0;
  if (done) return done;
  /* Another library in this process (RUI) may have done it already. */
  if (getenv("NIM_STDIO_LOGCAT")) return done = 1;
  setvbuf(stdout, NULL, _IOLBF, 0);
  setvbuf(stderr, NULL, _IONBF, 0);
  done = druid_redirect(1, "stdout", ANDROID_LOG_INFO, &druid_out) &
         druid_redirect(2, "stderr", ANDROID_LOG_WARN, &druid_err);
  atexit(druid_flush_at_exit);
  if (done) setenv("NIM_STDIO_LOGCAT", "1", 1);
  return done;
}

/* At load time, before any Nim module initializes: an exception raised by a
 * module's initializer is written to stderr and ends the process, and that
 * message must reach logcat too. -d:druidKeepStdio defines DRUID_KEEP_STDIO. */
#ifndef DRUID_KEEP_STDIO
__attribute__((constructor)) static void druid_stdio_at_load(void) { druid_stdio_to_logcat(); }
#endif

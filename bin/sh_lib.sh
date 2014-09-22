#!/bin/bash
#
# the shared shell lib

DAY=`date +"%Y%m%d"`
TIME=`date +"%Y%m%d-%H%M"`

jt_test_fn() {
  echo "suffix: $FLAGS_suffix"
  echo "cmd: $FLAGS_cmd"
}

jt_wait_for_server_up() {
  if [ -z "$FLAGS_suffix" ]; then
    if [ "$FLAGS_job" == "baseline.*" ]; then
      /home/build/google3/experimental/jthu/bin/waitok.pl \
        0.baseline.frontend.gws.$USER.ij-q.borg.google.com
    elif [ "$FLAGS_job" == "test.*" ]; then
      /home/build/google3/experimental/jthu/bin/waitok.pl \
        0.test.frontend.gws.$USER.ij-q.borg.google.com
    else
      /home/build/google3/experimental/jthu/bin/waitok.pl \
        0.test.frontend.gws.$USER.ij-q.borg.google.com \
        0.baseline.frontend.gws.$USER.ij-q.borg.google.com
    fi
  else
    if [ "$FLAGS_job" == "baseline.*" ]; then
      /home/build/google3/experimental/jthu/bin/waitok.pl \
        0.baseline_${FLAGS_suffix}.frontend.gws.$USER.ij-q.borg.google.com
    elif [ "$FLAGS_job" == "test.*" ]; then
      /home/build/google3/experimental/jthu/bin/waitok.pl \
        0.test_${FLAGS_suffix}.frontend.gws.$USER.ij-q.borg.google.com
    else
      /home/build/google3/experimental/jthu/bin/waitok.pl \
        0.test_${FLAGS_suffix}.frontend.gws.$USER.ij-q.borg.google.com \
        0.baseline_${FLAGS_suffix}.frontend.gws.$USER.ij-q.borg.google.com
    fi
  fi
}

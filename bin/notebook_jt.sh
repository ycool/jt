#!/bin/bash

set -x

blaze build -c opt experimental/jthu/tools/notebook || exit


# ipython profile create foo   # create the profile foo
# ipython --profile=foo        # start IPython using the new profile
# profile config: /usr/local/google/home/jthu/.config/ipython/profile_tdi/ipython_config.py

G3=`pwd`
ln -s /home/jthu/notebook .
cd notebook
${G3}/blaze-bin/experimental/jthu/tools/notebook --alsologtostderr

# runs at active.mtv.corp.google.com:9999

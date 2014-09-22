#!/bin/bash

set -x

# blaze build -c opt --python_cpu=k8 --copt=-DPYTHON_PROTO2_CPP_IMPL_V2 \
#  quality/ranklab/main/tools/notebook

# config: ~/.iranklabrc_notebook

rabbit build -c opt --python_cpu=k8 --copt=-DPYTHON_PROTO2_CPP_IMPL_V2 \
  quality/ranklab/projects/synonyms/notebook.par

cp -f blaze-bin/quality/ranklab/projects/synonyms/notebook.par ~/notebook/notebook_syns.par
cd ~/notebook/

~/notebook/notebook_syns.par --alsologtostderr

# profile config: /usr/local/google/home/jthu/.config/ipython/profile_jt/ipython_config.py
# /google/data/ro/projects/users/jthu/syns_notebook.par --profile=jt

# runs at active.mtv.corp.google.com:9999

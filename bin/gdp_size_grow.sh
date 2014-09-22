#!/bin/bash

# set -x

MPM_PKG=pkg_name


for version in `mpm pi $MPM_PKG 2> /dev/null | grep "Built on" | cut -d' ' -f1`
do
#  echo $version
  size=`mpm pi -v $version -c $MPM_PKG 2> /dev/null | grep "Size:"`
  echo "$size"
done

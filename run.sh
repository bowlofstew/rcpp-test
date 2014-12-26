#!/bin/bash -e

set -x

./clean.sh

mkdir library

R CMD build .
R CMD INSTALL -l library foopack_0.0.1.tar.gz
R CMD BATCH mytest.R || echo "mytest failed"

echo "============ mytest.Rout ==============="
cat mytest.Rout

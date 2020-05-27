#!/bin/sh

set -e
# Rscript -e "testthat::test_dir('tests', stop_on_failure=T)"
Rscript -e "devtools::check()"

#!/bin/sh

set -e

Rscript -e "testthat::test_dir('tests')"

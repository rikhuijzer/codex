#!/bin/sh

set -e
Rscript -e "devtools::check()"

#!/bin/bash
for f in *ppm; do convert -quality 100 $f 'basename $f ppm'jpg; done
mencoder "mf://*.jpg" -mf fps=30 -o $l -ovc lavc -lavcopts vcodec=msmpeg4v2 rate=800

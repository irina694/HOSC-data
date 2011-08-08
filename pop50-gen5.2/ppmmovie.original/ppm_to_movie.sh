#!/bin/bash
for f in *ppm; do convert -quality 100 $f 'basename $f ppm'jpg; done
mencoder "mf://*.jpg" -mf fps=30 -o $1 -ovc lavc -lavcopts vcodec=msmpeg4v2:vbit rate=800

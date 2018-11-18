#!/bin/bash -x

find osv-sample-data/2018-06-05/ballot-scans -name '*.pdf' | while read line; do
	b=$(basename -s .pdf $line)
	convert -rotate '-90' -density 150 $line $b.png
done

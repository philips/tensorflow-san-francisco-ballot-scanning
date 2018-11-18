#!/bin/bash -x

find osv-sample-data -name '*.pdf' | while read line; do
	b=$(basename -s .pdf $line)
	convert -density 150 $line $b.png
done

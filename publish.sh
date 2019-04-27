#!/bin/sh

tsc
find . -name '*.map' -delete
rsync -av dist/ .
rm -r dist
npm publish

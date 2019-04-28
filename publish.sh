#!/bin/sh

find . -name '*.js' -delete
tsc
npm publish

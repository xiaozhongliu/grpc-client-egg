tsc
rm -r **/*.map
rsync dist/ .
rm -r dist
npm publishl

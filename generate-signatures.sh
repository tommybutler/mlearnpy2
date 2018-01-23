#!/bin/bash
/bin/rm -f sha256sums.txt sha256sums.txt.asc
/usr/bin/sha256sum *.xz* 2>/dev/null > sha256sums.txt
/usr/bin/gpg --armor --detach-sig sha256sums.txt

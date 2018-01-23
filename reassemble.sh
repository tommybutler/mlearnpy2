#!/bin/bash

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/sbin:/usr/sbin:/sbin"

echo 'About to re-assemble home--tommy--mypy by piecing together the split bigfiles, and extacting them'

if read -t 10 -p 'OK to proceed? (N/y) ' prompt
then
   if [[ "$prompt" == 'y' || "$prompt" == 'Y' ]]
   then
      echo OK...
   elif  [[ "$prompt" != '' && "$prompt" != 'n' && "$prompt" != 'N' ]]
   then
      echo 'Specify "y" or "n"'
      exit 255
   else
      echo ABORT
      exit
   fi
else
   echo ABORT
   exit
fi

cat bigfiles.tar.xz.splitfile-* > bigfiles.tar.xz

if ! gpg --verify sha256sums.txt.asc sha256sums.txt
then
   echo 'GPG signature verification failed.  Will not proceed!'
   rm -f bigfiles.tar.xz
   exit 255
else
   echo 'GPG signature OK'
fi

if ! sha256sum.exe -c sha256sums.txt
then
   echo 'SHA256 checksum verification failed.  Will not proceed!'
   rm -f bigfiles.tar.xz
   exit 255
else
   echo 'SHA256 checksums OK'
fi

xz -d -T0 -vv bigfiles.tar.xz

if tar tf bigfiles.tar > /dev/null
then
   echo tar xvf bigfiles.tar
else
   echo 'Failed to extract bigfiles.tar -- looks like file is corrupt'
   exit 255
fi

echo 'home--tommy--mypy has been reassembled.  Copy it to your home directory and rename it "mypy"'

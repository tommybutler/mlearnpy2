#!/bin/bash

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/sbin:/usr/sbin:/sbin"

filect=$( find home--tommy--mypy/ -size +$((50*1024)) | wc -l )

if (( $filect == 0 ))
then
   echo '**WARNING!! Zero large files found in ./home--tommy--mypy/'
   echo '**WARNING!! YOU PROBABLY SHOULD NOT PROCEED!'
   echo
fi

echo "About to truncate bigfiles.tar and move $filect large files from home--tommy-mypy/ to bigfiles.tar..."

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

tar -cvf bigfiles.tar $( find home--tommy--mypy/ -size +$((50*1024)) | xargs ) && \
   find home--tommy--mypy/ -size +$((50*1024)) -delete -print

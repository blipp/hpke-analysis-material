#!/bin/bash
set -e

# Usage: ./run [true/false]

sourcefile=dhkem.m4.cv
pattern=dhkem
libraryfile=../../default

CRYPTOVERIFDIR=../..

# Please update the next lines to correspond to the location
# of a timing program and of CryptoVerif on your computer.

if [ -x $CRYPTOVERIFDIR/xtime ]
then
    TIME=$CRYPTOVERIFDIR/xtime
else
    TIME=
fi
CV="$CRYPTOVERIFDIR/cryptoverif -lib $libraryfile"

function file_exists_or_abort()
{
    filename=$1
    if [ ! -f $filename ]
    then
	echo "File '$filename' not found. Did you execute this script in the directory in which it's stored?"
	exit 2
    fi
}

# The argument of analyze is
# $1 = file name (without .cv)

function analyze()
{
  echo $1
#  echo "$TIME $CV -oproof $1.cvres $1.cv > $1.out"
  file_exists_or_abort $1.cv
  mkdir -p $1
  $TIME $CV -oproof $1/$1.cvres -o $1 $1.cv > $1/$1.out
  tail -n 2 $1/$1.out
}

file_exists_or_abort $sourcefile
file_exists_or_abort $libraryfile.cvl
file_exists_or_abort $TIME
file_exists_or_abort $CRYPTOVERIFDIR/cryptoverif

for auth in noauth auth
do
  for curve in curveprime # curve25519 # curve448
  do
    filename=$pattern.$curve.$auth
    m4 --define="m4_name=$filename" -Dm4_${auth} -Dm4_${curve} $sourcefile > $filename.cv
    if [ "$1" == "false" ]; then echo "Skip analysis"; else analyze $filename; fi
  done
done

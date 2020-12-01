#!/bin/bash
LOCK=/tmp/myapp.lock

function get_lock
{
  MYPID=$1
  DELAY=2
  while [ -f "$LOCK" ]
  do
    sleep $DELAY
  done
  echo $MYPID > $LOCK
}

function release_lock
{
  rm -f $LOCK
}

echo "I am process $$"
get_lock $$
echo "$$: `date`" > /tmp/keyfile.txt
sleep 5
release_lock
cat /tmp/keyfile.txt

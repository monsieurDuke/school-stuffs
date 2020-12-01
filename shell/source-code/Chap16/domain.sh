#!/bin/bash

# LOCK is a global variable. For this usage, lock.myapp.$$ is not suitable.
# /var/run is suitable for root-owned processes; others may use /tmp or /var/tmp
# or their home directory or application filesystem.
# LOCK=/var/run/lock.myapp
LOCK=/tmp/lock.myapp
KEYFILE=/tmp/domains.txt
MYDOMAIN=$1
mydom=/tmp/${MYDOMAIN}.$$

# See kill(1) for the different signals and what they are intended to do.
trap cleanup 1 2 3 6

function release_lock
{
  MYPID=$1
  echo "Releasing lock."
  sed -i "/^${MYPID}$/d" $LOCK
}

function get_lock
{
  DELAY=2
  GOT_LOCK=0
  MYPID=$1

  while [ "$GOT_LOCK" -ne "1" ]
  do
    PID=
    while [ -s "$LOCK" ]
    do
      PID=`cat $LOCK 2>/dev/null`
      name=`ps -o comm= -p "$PID" 2>/dev/null`
      if [ -z "$name" ]; then
        echo "Process $PID has claimed the lock, but is not running."
        release_lock $PID
      else
        echo "Process $PID ($name) has already taken the lock:"
        ps -fp $PID | sed -e 1d
        date
        echo
        sleep $DELAY
        let DELAY="$DELAY + 1"
      fi
    done
  
    # Store my PID in the lock file
    echo $MYPID >> $LOCK
    
    # If another instance also wrote to the lock, it will contain
    # more than just $$ 
    grep -vw $MYPID $LOCK > /dev/null 2>&1
    if [ "$?" -eq "0" ]; then
      # If $? is 0, then grep successfully found something else in the file.
      echo "An error occurred. Another process has taken the lock:"
      ps -fp `grep -vw $MYPID $LOCK`
      # The other process can take care of itself. 
      # Relinquish access to the lock.
      # sed -i can do this atomically. 
      # Back off by sleeping a random amount of time.
      release_lock $MYPID
      sleep $((RANDOM % 5))
    else
      GOT_LOCK=1
      # Claim exclusive access to the lock
      echo $MYPID > $LOCK
    fi
  done
}

function cleanup
{
  echo "$$: Caught signal: Exiting"
  release_lock
  exit 0
}

# Main Script goes here.
# You may want to do stuff without the lock here.

# Then get the lock for the exclusive work
get_lock $$

############
# Do stuff #
############
echo "$MYDOMAIN Creation Date:" | tee -a $KEYFILE
sleep 2
whois $MYDOMAIN | grep -i created | cut -d":" -f2- | tee -a $KEYFILE
sleep 2
echo "$MYDOMAIN Expiration Date:" | tee -a $KEYFILE
sleep 2
whois $MYDOMAIN | grep "Expiration Date:" | cut -d":" -f2- | tee -a $KEYFILE
sleep 2
echo "$MYDOMAIN DNS Servers:" | tee -a $KEYFILE
sleep 2
whois $MYDOMAIN | grep "Name Server:" | cut -d":" -f2- | \
        grep -v "^$" | tee -a $KEYFILE
sleep 2
echo "... end of $MYDOMAIN information ..." | tee -a $KEYFILE
echo >> $KEYFILE

# Then release the lock when you are done.
release_lock $$

# Again, there may be stuff that you will want to do after the lock is released
# Then cleanly exit.
exit 0
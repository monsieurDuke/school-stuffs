#!/bin/bash

# service is the name of the init script
# as well as the name of the application.
if [ "$1" == "-a" ]; then
  autostart=yes
  service=$2
else
  autostart=no
  service=$1
fi
distro=unknown
init_dir=unknown
rc_dir=/etc/rc.d

# Step 1: Determine the Distribution
if [ -f /etc/redhat-release ]; then
  # Also true for variants of Fedora or RHEL
  distro=redhat
elif [ -f /etc/debian_version ]; then
  # Also true for Ubuntu etc
  distro=debian
elif [ -f /etc/SuSE-brand ] || [ -f /etc/SuSE-release ]; then
  distro=suse
elif [ -f /etc/slackware-version ]; then
  distro=slackware
else
  distro=unknown
fi

# Step 2: Install into the appropriate init directory
case $distro in
  redhat|debian|suse)
    # /etc/rc.d/ is a link to /etc/init.d
    # SuSE and RedHat don't need rc_dir.
    init_dir=/etc/init.d
    rc_dir=/etc
    ;;
  slackware) 
    init_dir=/etc/rc.d
    rc_dir=/etc/rc.d
    ;;
  *)
    echo -n "Unknown distribution; guessing init directory... "
    for init_dir in /etc/rc.d/init.d /etc/init.d unknown
    do
      [ -d ${init_dir} ] && break
    done
    if [ "$init_dir" == "unknown" ]; then
      echo "Failed"
    else
      echo "Found ${init_dir}."
      for rc_dir in /etc /etc/rc.d /etc/init.d /etc/init.d/rc.d
      do
        [ -d ${rc_dir}/rc0.d  ] && break
      done
    fi
esac

if [ $init_dir != unknown ]; then
  cp $service ${init_dir}
else
  echo "Error: Can not determine init.d directory."
  echo "Initialization script has not been copied."
  exit 1
fi

# Step 3: Register the service
case $distro in
  suse|redhat)
    chkconfig --add $service
    ;;
  *)
    if [ ! -d $rc_dir ]; then
      echo "Error: rc directory $rc_dir does not exist."
      echo "This distribution is $distro."
      exit 1
    fi
    ln -sf ${init_dir}/$service ${rc_dir}/rc2.d/S90$service
    ln -sf ${init_dir}/$service ${rc_dir}/rc3.d/S90$service
    ln -sf ${init_dir}/$service ${rc_dir}/rc0.d/K10$service
    ln -sf ${init_dir}/$service ${rc_dir}/rc6.d/K10$service
    ;;
esac

# Step 4: Start the Service
[ $autostart == yes ] && case $distro in
  suse|redhat)
    chkconfig $service on
    ;;
  unknown)
    echo "Unknown distribution; attempting to start up..."
    ${init_dir}/$service start
    ;;
  *)
    # Debian, Slackware
    ${init_dir}/$service start
    ;;
esac

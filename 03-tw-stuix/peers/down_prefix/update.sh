#!/bin/bash
cd /etc/bird/peers/down_prefix
update_prefix () { 
  if bgpq4 -6 -b -R 48 -l prefix_$1 $2 > $1.conf.tmp; then
    echo -n "define " > $1.conf
    cat $1.conf.tmp >> $1.conf
    rm $1.conf.tmp
  else
    echo "$1 update failed"
  fi
}


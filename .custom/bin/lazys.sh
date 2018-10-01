#!/bin/bash

configFile=~/.lazyssh

if [ "$1" == "--help" ]; then
  echo "Call with 'create \$key \$x@y \$port (opt)' to create a new entry.
Call with copy 'from' 'to' to copy from server to here. Call with copyto 'to' 'from' to to copy from here to server."
  exit 1
elif [ "$1" == "create" ]; then
  key=$2
  spli=(${3/@/ })
  name=${spli[0]}
  server=${spli[1]}
  if [ "$#" == 4 ]; then
    port=$4
  else
    port="22"
  fi
  if [ ! -f $configFile ]; then
    touch $configFile
    echo -e "declare -A ips\ndeclare -A names\ndeclare -A ports\n" > $configFile
  fi
  echo -e "\nnames[$key]=\"$name\"" >> $configFile
  echo -e "ips[$key]=\"$server\"" >> $configFile
  echo -e "ports[$key]=\"$port\"" >> $configFile
  echo "The new key was created."
  exit 1
else
  if [ -f $configFile ]; then
    source $configFile
  fi

  if [ ${#ips[@]} -eq 0 ]; then
    echo "No configuration found so far. Start creating configuration settings by running this command using 'lazys.sh create \$connectionKey \$name@\$server \$port'"
    exit 1
  fi
 
  echo "Enter one of ${!ips[@]}"
fi

read choice

if [ ! ${ips[$choice]+exists} ]; then
  echo "The key $choice does not exist. Exiting."
  exit 1
fi

ip=${ips[$choice]}
name=${names[$choice]}
port=${ports[$choice]}

if [ "$1" == "cp" ]; then
  echo "Will do: scp -P$port -r $name@$ip:$2 $3"
  scp -P$port -r $name@$ip:$2 $3
elif [ "$1" == "cpto" ]; then
  echo "Will do: scp -P$port -r $2 $name@$ip:$3"
  scp -P$port -r $2 $name@$ip:$3
else
  echo "Will do: ssh -p$port $name@$ip"
  ssh -p$port $name@$ip
fi


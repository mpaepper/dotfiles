#!/bin/bash

configFile=~/.lazyssh

if [ "$1" == "--help" ]; then
    echo "Call with 'create \$key \$x@y \$port (opt) \$privatekey (opt)' to create a new entry.
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
  if [ "$#" == 5 ]; then
    private=$5
  else
    private="id_rsa"
  fi
  if [ ! -f $configFile ]; then
    touch $configFile
    echo -e "declare -A ips\ndeclare -A names\ndeclare -A ports\n" > $configFile
  fi
  echo -e "\nnames[$key]=\"$name\"" >> $configFile
  echo -e "ips[$key]=\"$server\"" >> $configFile
  echo -e "ports[$key]=\"$port\"" >> $configFile
  echo -e "keys[$key]=\"$private\"" >> $configFile
  echo "The new key was created."
  exit 1
else
  if [ -f $configFile ]; then
    source $configFile
  fi

  if [ ${#ips[@]} -eq 0 ]; then
    echo "No configuration found so far. Start creating configuration settings by running this command using 'lazys.sh create \$connectionKey \$name@\$server \$port \$privatekey'"
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
key=${keys[$choice]}

if [ "$1" == "cp" ]; then
  if [ -n "$key" ]; then
      echo "Will do: scp -ip ~/.ssh/$key -P$port -r $name@$ip:$2 $3"
      scp -p -i ~/.ssh/$key -P$port -r $name@$ip:$2 $3
  else
      echo "Will do: scp -p -P$port -r $name@$ip:$2 $3"
      scp -p -P$port -r $name@$ip:$2 $3
  fi
elif [ "$1" == "cpto" ]; then
  if [ -n "$key" ]; then
      echo "Will do: scp -ip ~/.ssh/$key -P$port -r $2 $name@$ip:$3"
      scp -p -i ~/.ssh/$key -P$port -r $2 $name@$ip:$3
  else
      echo "Will do: scp -P$port -r $2 $name@$ip:$3"
      scp -p -P$port -r $2 $name@$ip:$3
  fi
else
  if [ -n "$key" ]; then
      echo "Will do: ssh -i ~/.ssh/$key -P$port $name@$ip"
      ssh -i ~/.ssh/$key -p$port $name@$ip
  else
      echo "Will do: ssh -p$port $name@$ip"
      ssh -p$port $name@$ip
  fi
fi


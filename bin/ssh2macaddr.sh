#!/bin/bash

#for i in `seq ${2} ${3}`
#    do
#        ping -c 1 ${1}.${i} > /dev/null 2>&1
#        if [ $? -eq 0 ]; then
#            echo "${1}.${i} responded."
#        else
#            echo "${1}.${i} did not respond."
#        fi
#    done

for i in `seq 1 254`
    do
#        echo pinging 10.0.0.$i ...
        ping -c 1 -W 1 10.0.0.$i > /dev/null 2>&1 &
    done
echo pinging 10.0.0.* Please wait for 5 sec ...
sleep 5
arp.exe -a

ssh -X -l viv $(arp.exe -a|grep "00-71-c2-0a-ca-0c"|tr -s ' ' | cut -d ' ' -f 2)

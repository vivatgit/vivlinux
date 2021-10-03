#!/bin/bash

ssh -X -l viv $(arp.exe -a|grep "00-71-c2-0a-ca-0c"|tr -s ' ' | cut -d ' ' -f 2)

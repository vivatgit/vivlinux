#runung xterm on remote linux machine:
#
#PS C:\Users\i_vel> arp -a | select-string "00-71-c2-0a-ca-0c" |% { $_.ToString().Trim().Split(" ")[0] }
#10.0.0.18
#PS C:\Users\i_vel>
#
#PS C:\Users\i_vel> ssh -x -l viv @(arp -a | select-string "00-71-c2-0a-ca-0c" |% { $_.ToString().Trim().Split(" ")[0] })
#
#  137  env|grep DISP
#  138  export DISPLAY=localhost:10.0
#  139  env|grep DISP
#  140  xterm
#  141  history
#
#viv@hpec:~$ exit

ssh -x -l viv @(arp -a | select-string "00-71-c2-0a-ca-0c" |% { $_.ToString().Trim().Split(" ")[0] })



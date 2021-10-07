# Setting up windows 10 enviroment tips

### Setting up doccer on windows 10 + WSL 2 ###
https://docs.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers

# Changing WSL version from 1 to 2
PS C:\Users\i_vel> wsl -l -v
  NAME      STATE           VERSION

* Ubuntu    Running         1
  PS C:\Users\i_vel> wsl --set-default-version 2
  Please enable the Virtual Machine Platform Windows feature and ensure virtualization is enabled in the BIOS.
  For information please visit https://aka.ms/wsl2-install
  PS C:\Users\i_vel> wsl -l -v
    NAME      STATE           VERSION
    * Ubuntu    Running         1
  PS C:\Users\i_vel>

 Checked BIOS ( Accer Predator PC - F2 / Del on reboot) - was not an issue there!
 Just need to go to Windows features and enable Virtual Machine Platform:

Then got another issue:

PS C:\Users\i_vel> wsl --set-version Ubuntu 2
Conversion in progress, this may take a few minutes...
For information on key differences with WSL 2 please visit https://aka.ms/wsl2
The requested operation could not be completed due to a virtual disk system limitation.  Virtual hard disk files must be uncompressed and unencrypted and must not be sparse.

    Solution:
    https://github.com/microsoft/WSL/issues/4103

    Okay, after some lucky guesses I've confirmed it and I have an addendum to the workaround (cc @caffme in case this works for you as well) - 
    go to the Ubuntu directory in your profile folder (something like %USERPROFILE%\AppData\Local\Packages\CanonicalGroupLimited...), 
    right click on "LocalState", Properties, Advanced, deselect "Compress contents" (and I suppose "Encrypt contents" as well if that's checked). 
    When it asks whether you want to apply to just this folder or to all subfolders and files, you can say "just this folder", 
    because all you're doing is clearing that "compress" flag. After that the wsl --set-version command should work.
    
 PS C:\Users\i_vel> wsl --set-version Ubuntu 2
    Conversion in progress, this may take a few minutes...
    For information on key differences with WSL 2 please visit https://aka.ms/wsl2
    Conversion complete.

## Next issue ##
   lost network 
ping 127.0.01 - does not work
Tried tons of advices - no luck
* Solution:
* https://github.com/microsoft/WSL/issues/5437
* Finaly solution was simple - in windows create file 
```
%userprofile%\.wslconfig
```
and put:
```
[wsl2]
swap=0
```
viv@Lev:~/git/vivlinux$ ip address show eth0
4: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 00:15:5d:42:9a:d6 brd ff:ff:ff:ff:ff:ff
    inet 172.22.136.77/20 brd 172.22.143.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::215:5dff:fe42:9ad6/64 scope link
       valid_lft forever preferred_lft forever
```



# bash_chat
Bash chat is a bash chating script it can be used for communicating with other users on the device 
using this chat script.	
## downloading the executable
use these commands to download it once. (select a good directory for it) 
### download for auto starter
pros:up to date  
cons:uses 1 kb of internet on start  
```
wget -q -O .chat.sh https://raw.githubusercontent.com/gitdev-bash/bash_chat/master/chat.sh 2>/dev/null || curl --silent https://raw.githubusercontent.com/gitdev-bash/bash_chat/master/chat.sh > .chat.sh && chmod +x chat.sh
```
### downloading the no update version
pros:no internet usage  
cons:manual update  
```
wget -q -O client_latest.sh https://raw.githubusercontent.com/gitdev-bash/bash_chat/master/client_latest.sh 2>/dev/null || curl --silent https://raw.githubusercontent.com/gitdev-bash/bash_chat/master/client_latest.sh > client_latest.sh && chmod +x client_latest.sh
```
## running the program
!run in directory you specified earlier!
### the autostart version
```
./chat.sh
```
### the no update version
```
./client_latest.sh
```
## functions 
```
/exit
```
will close the chat
### have fun!

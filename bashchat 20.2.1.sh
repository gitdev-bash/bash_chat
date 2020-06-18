#!/bin/bash
clear
echo -e "        ░░░┌─┐░░░░░░░░░░░░░░░░░░░
        ░░░│▒└┐░░░░░░░░░░░░░░░░░░
        ░░░│▒▒└───────────┐░░░░░░
        ░░░└┐▒▒▒▒▒▒▒▒▒▒▒▒▒│░░░░░░
        ░░░░└┐▒▒▄▒▒▄▒▒▒▄▒▒│░░░░░░
        ░░░░░│▒▒█▌▒█▌▒▐█▒▒│░░░░░░
        ░░░░░│▒▒▒▒▒▒▒▒▒▒▒▒│░░░░░░
        ░░░░░│▒▒▒▒▒▒▒▒▒▒▒▒│░░░░░░
        ░░░░░└────────────┘░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░░░░
        ░░░░░░░░░░░░░░░░░░░░░░░░░
         Welcome to chat $USER
              LOADING..."
#gets appdata
appdata=$(wget -qO- https://raw.githubusercontent.com/gitdev-bash/bash_chat/master/.appdata 2>/dev/null || curl --silent https://raw.githubusercontent.com/gitdev-bash/bash_chat/master/.appdata)
#checks for updates
ver=$(echo "$appdata" | sed "1q;d")
if [[ "$ver" == "v20.2.1" ]]
then
  echo "You are up to date"
else
  update () { mkdir ".update"; wget -qO .update/bashchat.sh https://raw.githubusercontent.com/gitdev-bash/bash_chat/$ver/bashchat.sh 2>/dev/null || curl --silent https://raw.githubusercontent.com/gitdev-bash/bash_chat/$ver/bashchat.sh > .update/bashchat.sh; trap "rm bashchat; mv .update/bashchat.sh bashchat.sh; rmdir .update" EXIT; }
  echo "There is an update available would you like to update [y/N]"
  read up
  [[ "y" == "$up" ]] && update || [[ "y" == "$up" ]] && update
fi
if [[ ! -p /tmp/chat ]]
then
  touch /tmp/chat
  chmod 666 /tmp/chat
fi
echo "$USER has joined the chat" >> /tmp/chat
sleep 1
clear
tail -n 5 -f /tmp/chat &
inpid="$!"
trap 'kill -15 "$inpid"; echo "$USER has left" >> /tmp/chat' EXIT
while true
do
  read -r msg
  check=$(echo "$msg" | cut -c 1)
  if [ "$check" == "/" ]
  then
    if [ "$msg" == "/exit" ]
    then
      exit
    fi
  else
      time=$(date +"%T")
      tmsg="$USER @ $time : $msg"
      echo "$tmsg" >> /tmp/chat
  fi
done
exit
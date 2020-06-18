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

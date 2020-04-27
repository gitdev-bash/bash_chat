#!/bin/bash
if [[ ! -p /tmp/chat ]]
then
touch /tmp/chat
chmod 666 /tmp/chat
fi
echo "Welcome to chat $USER"
tail -n 5 -f /tmp/chat &
inpid="$!"
trap "kill -15 $inpid; echo '$USER has left' >> /tmp/chat" EXIT
echo "$USER has joined the chat" >> /tmp/chat
while [ 1 ]
do
read msg
check=$(echo $msg | cut -c 1)
if [ "$check" == "/" ]
then
if [ "$msg" == "/exit" ]
then
exit
fi
else
time=$(date +"%T")
tmsg="$USER @ $time : $msg"
echo $tmsg >> /tmp/chat
fi
done
exit

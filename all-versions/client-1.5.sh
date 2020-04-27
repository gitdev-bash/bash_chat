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
time=$(date +"%T")
tmsg="$USER : $msg _ $time"
echo $tmsg >> /tmp/chat
done
exit

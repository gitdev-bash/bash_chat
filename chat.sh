#!/bin/bash
wget -q -O .client.sh https://raw.githubusercontent.com/gitdev-bash/bash_chat/master/client_latest.sh 2>/dev/null || curl -O .client.sh --silent https://raw.githubusercontent.com/gitdev-bash/bash_chat/master/client_latest.sh
trap "rm .client.sh" EXIT
bash .client.sh
exit

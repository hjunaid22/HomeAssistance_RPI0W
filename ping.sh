#!/bin/bash
date
echo "Runing Ping Command"

cat /home/junaid/host | while read server
do

ping -c 1 "$server" > /dev/null

if [ $? -eq 0 ]; then
echo "That Machine $server Is Alive"
else
echo "That Machine $server is not Alive"
fi
done



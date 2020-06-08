#!/bin/bash

if [ -e "server.pay" ]; then
    rm server.pay
fi

cat server | tail -n+2 | tr -s " " | cut -d " " -f 3 > server.time #parte da seconda riga
cat server | tail -n+2 | tr -s " " | cut -d " " -f 8 > server.seqn #parte da seconda riga
cat server | tail -n+2 | grep Ack  | tr -s " " | cut -d "=" -f 3| cut -d " " -f 1 > server.ack #parte da seconda riga 
cat server | tail -n+2 | tr -s " " | cut -d "=" -f 4| cut -d " " -f 1 > server.win #parte da seconda riga

cat server | tail -n+2 | tr -s " " | cut -d " " -f 7 > tmp
cat tmp | while read line; do
    let x=line-20-32-14 #4 byte vengono scartati a livello ethernet
    echo $x >>server.pay
done

rm tmp

paste server.time server.seqn server.ack server.win server.pay| tr -s " "  > server.dat

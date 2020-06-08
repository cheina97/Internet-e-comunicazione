#!/bin/bash

#notare nel calcolo del payload un if in quanto si è osservato 
#che non tutti i pacchetti hanno stesso numero di byte dedicati alle opzioni.

if [ -e "client.pay" ]; then
    rm client.pay
fi

echo 0 > client.ack #aggiunge Ack alla seconda riga
cat client | tail -n+2 | head -1 | tr -s " " | cut -d "=" -f 3| cut -d " " -f 1 > client.win #prende Win da seconda riga


cat client | tail -n+2 | tr -s " " | cut -d " " -f 3 > client.time #parte da seconda riga
cat client | tail -n+2 | tr -s " " | cut -d " " -f 8 > client.seqn #parte da seconda riga
cat client | tail -n+2 | grep Ack  | tr -s " " | cut -d "=" -f 3| cut -d " " -f 1 >> client.ack #parte da terza riga 
cat client | tail -n+3 | tr -s " " | cut -d "=" -f 4| cut -d " " -f 1 >> client.win #parte da terza riga
cat client | tail -n+2 | tr -s " " | cut -d " " -f 7 > tmp
cat tmp | while read line; do
    if [ $line -eq 78 ]; then #nel caso in cui i pacchetti TCP abbiano 24 byte di opzioni
        let x=line-20-44-14 # 4 byte vengono già scartati a livello ethernet
    else #nel caso in cui i pacchetti TCP abbiano 12 byte di opzioni
        let x=line-20-32-14 # 4 byte vengono già scartati a livello ethernet
    fi
    echo $x >>client.pay
done
rm tmp

paste client.time client.seqn client.ack client.win client.pay| tr -s " "  > client.dat

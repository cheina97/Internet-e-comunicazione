set autoscale
unset log
unset label
set xtic auto
set ytic auto
set title "Client PAY"
set xlabel "Seconds"
set ylabel "Payload"
unset key
set xr [0.0:52.0]
plot "../client.dat" using 1:5 title "Payload(s)"
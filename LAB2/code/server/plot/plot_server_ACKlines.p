set autoscale
unset log
unset label
set xtic auto
set ytic auto
set title "Server ACK"
set xlabel "Seconds"
set ylabel "Ack"
unset key
set xr [0.0:52.0]
plot "../server.dat" using 1:3 title "Ack(s)" with lines
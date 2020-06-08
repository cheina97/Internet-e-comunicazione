set autoscale
unset log
unset label
set xtic auto
set ytic auto
set title "Client ACK"
set xlabel "Seconds"
set ylabel "Ack"
unset key
set xr [0.0:52.0]
plot "../client.dat" using 1:3 title "Ack(s)" with lines

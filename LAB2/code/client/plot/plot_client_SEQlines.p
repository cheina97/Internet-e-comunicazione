set autoscale
unset log
unset label
set xtic auto
set ytic auto
set title "Client SEQ"
set xlabel "Seconds"
set ylabel "Seq"
unset key
set xr [0.0:52.0]
plot "../client.dat" using 1:2 title "Ack(s)" with lines
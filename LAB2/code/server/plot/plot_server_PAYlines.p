set autoscale
unset log
unset label
set xtic auto
set ytic auto
set title "Server PAY"
set xlabel "Seconds"
set ylabel "Payload"
unset key
set xr [0.0:52.0]
plot "../server.dat" using 1:5 title "Payload(s)" with lines
set autoscale
unset log
unset label
set xtic auto
set ytic auto
set title "Server SEQ"
set xlabel "Seconds"
set ylabel "Seq"
unset key
set xr [0.0:52.0]
plot "../server.dat" using 1:2 title "Seq(s)" with lines

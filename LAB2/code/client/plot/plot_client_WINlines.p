set autoscale
unset log
unset label
set xtic auto
set ytic auto
set title "Client WIN"
set xlabel "Seconds"
set ylabel "Win size"
unset key
set xr [0.0:52.0]
plot "../client.dat" using 1:4 title "Win(s)" with lines
set xrange [0:843]
set autoscale y
set ytics font "Helvetica,14"
set tics out
#set xtics 1000
#set format x ''
#set xtics rotate
unset xtics 
set xlabel 'Experiment' font "Helvetica,18"
set ylabel 'Executed Test Steps' font "Helvetica,18"
set key box
#set pointsize 0.01
set nokey
plot 'cluster-id-vs-steps-P14.dat' u 1:3:4:xtic(2) with points pt 7 ps 0.3

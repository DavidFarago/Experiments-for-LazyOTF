# set title "Benchmark: RSML, maxPortion=100, Bound=5"
# set terminal png size 800,600
# set output 'cbm-times.png'
set xrange [0:130]
set yrange [150:195]
set xtics 8.0
set tics out
set xlabel 'Number of Concurrent Experiments'
set ylabel 'Mean CPU or WC Time (s)'
set key at graph 0.3, 0.37 spacing 0.8 samplen 2 width -0.5 title "Measurements for o_{RSML}" box left 
#set boxwidth 0.4 absolute
set key invert
# set key bottom
plot '< sort -g cbm-times-16nodes.dat' using 1:2 title 'WC Time, 16 nodes' lc rgb 'brown' with linespoints,\
'' using 1:3 title 'CPU Time, 16 nodes' lc rgb 'orange' with linespoints,\
'< sort -g cbm-times-4nodes-cr.dat' using 1:2 title 'WC Time, 4 nodes' lc rgb 'blue' with linespoints,\
'' using 1:3 title 'CPU Time, 4 nodes' lc rgb 'cyan' with linespoints,\
'< sort -g cbm-times-1node-cr.dat' using 1:2 title 'WC Time, 1 node' lc rgb 'grey20' with linespoints,\
'' using 1:3 title 'CPU Time, 1 node' lc rgb 'grey60' with linespoints

#set term tikz standalone color solid size 5in,3in
#set output "TS_NonFancyRSMLvsJTorXRSML.tex"
set xrange [1:16.1]
set yrange [20:105]
set xtics 1.0
set tics out
set xlabel 'degree of parallelization'
set ylabel 'Hazelcast setup and cleanup in WC time (s)'

set key at graph 0.01, 0.99 title "Hazelcast overhead for liccov" box left

# opaque, maxrows 3: nur bei neuerer gnuplot version

#  'key-vs-cputime-only-min-cputime-in-cluster.dat' using 1:(CPUTIME/$7) title 'min cpu time' lc rgb 'blue' with linespoints,\
#     '< cat key-vs-cputime-1.dat key-vs-cputime.dat' using 1:(CPUTIME/$7) title 'avg cpu time' lc rgb 'cyan' with linespoints,\
#	      '< cat key-vs-cputime-1.dat key-vs-cputime-only-max-cputime-in-cluster.dat' using 1:(CPUTIME/$7) title 'max cpu time' lc rgb 'navy' with linespoints,\

#      '< cat key-vs-test-wallclocktime-1.dat ' using 1:(TESTWCTIME/$2) title 'min test wc time' lc rgb 'magenta' with linespoints,\
#	'< cat key-vs-test-wallclocktime-1.dat key-vs-test-wallclocktime-only-max-test-wallclock-time-in-cluster.dat' using 1:(TESTWCTIME/$2) title 'max test wc time' lc rgb 'pink' with linespoints,\


plot 	'< paste key-vs-wallclocktime-only-max-wallclock-time-in-cluster.dat key-vs-test-wallclocktime-only-max-test-wallclock-time-in-cluster.dat' using 1:($2-$9) title 'max over nodes' lc rgb 'grey60' with linespoints,\
   '< paste key-vs-wallclocktime.dat key-vs-test-wallclocktime.dat' using 1:($2-$9) title 'avg over nodes' lc rgb 'grey40' with linespoints,\
           '< paste key-vs-wallclocktime-only-min-wallclock-time-in-cluster.dat key-vs-test-wallclocktime-only-min-test-wallclock-time-in-cluster.dat' using 1:($2-$9) title 'min over nodes' lc rgb 'grey20' with linespoints



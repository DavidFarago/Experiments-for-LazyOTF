#(TODO: testWCTime sequentiell?) 

#set term tikz standalone color solid size 5in,3in
#set output "TS_NonFancyRSMLvsJTorXRSML.tex"
set object 42 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"#d0d0d0" behind 
set xrange [0:16.1]
set yrange [0:17.6]
set xtics 5.0
set ytics 5.0
set xlabel 'degree of parallelization'
set ylabel 'performance of parallelization'

set tics out
set mxtics 
set mytics 
set style line 43 lc rgb '#ffffff' lt 1 lw 1.5
set style line 44 lc rgb '#ffffff' lt 1 lw 0.5
set grid xtics mxtics ytics mytics back ls 43, ls 44

set key at graph 0.01, 0.99 spacing 0.8 samplen 2 width -3.4 title "speedups for liccov" box left
# opaque, maxrows 3: nur bei neuerer gnuplot version

WCTIME= "`head -1 key-vs-wallclocktime-1.dat | awk '{print $3}'`"
TESTWCTIME= "`head -1 key-vs-test-wallclocktime-1.dat | awk '{print $3}'`"
CPUTIME= "`head -1 key-vs-cputime-1.dat | awk '{print $3}'`"
TESTSTEPS= "`head -1 key-vs-max-teststeps-in-cluster-id-1.dat | awk '{print $3}'`"
INTERNALTOS= "`head -1 key-vs-internallydischargedtos-1.dat | awk '{print $3}'`"
# without approxincomplete:14:17.3953627823306;16:17.028721630978332

set label "(" tc rgb 'olive' at 15.74,10.95
   set label ")" tc rgb 'olive' at 16.1,10.95
   set label "(" tc rgb 'green' at 15.74,3.1
      set label ")" tc rgb 'green' at 16.1,3.1
show label


plot    '< cat key-vs-max-teststeps-in-cluster-id-1.dat key-vs-min-teststeps-in-cluster-id.dat' using 1:(TESTSTEPS/$2) title 'min test steps' lc rgb 'brown' with linespoints,\
       '< cat key-vs-max-teststeps-in-cluster-id-1.dat key-vs-steps.dat' using 1:(TESTSTEPS/$2) title 'avg test steps' lc rgb 'orange' with linespoints,\
       '< cat key-vs-max-teststeps-in-cluster-id-1.dat key-vs-max-teststeps-in-cluster-id.dat' using 1:(TESTSTEPS/$2) title 'max test steps' lc rgb 'red' with linespoints,\
	  '< cat key-vs-cputime-1.dat key-vs-cputime-only-min-cputime-in-cluster.dat' using 1:(CPUTIME/$7) title 'min cpu time' lc rgb 'blue' with linespoints,\
     '< cat key-vs-cputime-1.dat key-vs-cputime.dat' using 1:(CPUTIME/$7) title 'avg cpu time' lc rgb 'cyan' with linespoints,\
	      '< cat key-vs-cputime-1.dat key-vs-cputime-only-max-cputime-in-cluster.dat' using 1:(CPUTIME/$7) title 'max cpu time' lc rgb 'navy' with linespoints,\
        '< cat key-vs-wallclocktime-1.dat key-vs-wallclocktime-only-min-wallclock-time-in-cluster.dat' using 1:(WCTIME/$2) title 'min all wc time' lc rgb 'grey20' with linespoints,\
	   '< cat key-vs-wallclocktime-1.dat key-vs-wallclocktime.dat' using 1:(WCTIME/$2) title 'avg all wc time' lc rgb 'grey40' with linespoints,\
		'< cat key-vs-wallclocktime-1.dat key-vs-wallclocktime-only-max-wallclock-time-in-cluster.dat' using 1:(WCTIME/$2) title 'max all wc time' lc rgb 'grey60' with linespoints,\
      '< cat key-vs-test-wallclocktime-1.dat key-vs-test-wallclocktime-only-min-test-wallclock-time-in-cluster.dat' using 1:(TESTWCTIME/$2) title 'min test wc time' lc rgb 'magenta' with linespoints,\
     '< cat key-vs-test-wallclocktime-1.dat key-vs-test-wallclocktime.dat' using 1:(TESTWCTIME/$2) title 'avg test wc time' lc rgb 'purple' with linespoints,\
	'< cat key-vs-test-wallclocktime-1.dat key-vs-test-wallclocktime-only-max-test-wallclock-time-in-cluster.dat' using 1:(TESTWCTIME/$2) title 'max test wc time' lc rgb 'pink' with linespoints,\
	            '< cat key-vs-internallydischargedtos-1.dat key-vs-internallydischargedtos-only-min-internal-discharges-in-cluster.dat' using 1:(INTERNALTOS/$2) title 'min intern discharge' lc rgb 'greenyellow' with linespoints,\
		   '< cat key-vs-internallydischargedtos-1.dat key-vs-internallydischargedtos.dat' using 1:(INTERNALTOS/$2) title 'avg intern discharge' lc rgb 'olive' with linespoints,\
         '< cat key-vs-internallydischargedtos-1.dat key-vs-internallydischargedtos-only-max-internal-discharges-in-cluster.dat' using 1:(INTERNALTOS/$2) title 'max intern discharge' lc rgb 'green' with linespoints

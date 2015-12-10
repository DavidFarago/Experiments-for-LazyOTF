# Data columns: key avg min max median stdDev rsem
set xrange [0:10.4]
set yrange [0:0.64]
set xtics 1.0
set xlabel 'MaxPortion Model Parameter'
set ylabel 'Mean CPU time per test step (s)'
set key at graph 0.4, 0.95 title "Statistics for o_{NFRSML}" box left

plot 'nonfancyBound5key-vs-cputime-per-step.dat' using 1:2:6 title 'mean value (with deviation)' with yerrorbars,\
'nonfancyBound5key-vs-cputime-per-step.dat' using 1:3 title 'min value',\
'nonfancyBound5key-vs-cputime-per-step.dat' using 1:4 title 'max value',\
'nonfancyBound5key-vs-cputime-per-step.dat' using 1:5 title 'median value'

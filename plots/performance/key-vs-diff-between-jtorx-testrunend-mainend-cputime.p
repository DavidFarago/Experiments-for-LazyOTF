set xrange [0:17]
set yrange [0:2]
set xtics 1.0
set xlabel 'Degree of Parallelization'
set ylabel 'JTorX cputime diff between test run end and end of main (s)'
set key box
plot 'key-vs-diff-between-jtorx-testrunend-mainend-cputime.dat' using 1:2 title 'me-lotf-liccov-allPW.sh/ Mean'

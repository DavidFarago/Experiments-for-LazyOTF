set xrange [-1:10]
set yrange [0:30]
set xtics 5.0
set xlabel 'Exact bound b'
set ylabel 'Mean CPU time (s)'
set key box
set key invert
set style data histogram
set style histogram rowstacked
set style fill solid
set boxwidth 0.4 absolute
set grid
set style fill solid border -1
set style fill pattern 2
set key left
plot '< sort -g key-vs-cputime.dat' using ($5/1000) title 'Adapter´s treeSolver',\
'' using ($4/1000) title 'Adapter',\
'' using ($6/1000):xtic(1) title 'JTorX',\
'' using ($3/1000) title 'LazyOTF´s treeSolver',\
'' using ($2/1000) title 'LazyOTF'

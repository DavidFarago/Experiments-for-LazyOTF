set xrange [0:10.3]
set yrange [1:10000000]
set xtics 1.0
set tics out
set xlabel 'MAXPRT Model Parameter'
set ylabel 'Mean Executed Test Steps ~{~{t_{curr}}{0.1^{max}}}{1.5\_\_\_\_}'
set key at graph 0.5, 0.3 title "test objective o" box left height +1 maxrows 3
set logscale y
plot 'me-lotf-liccov-Max-steps.dat' using 1:2 title 'ö_{S_{isol}}' lc rgb 'brown' with linespoints,\
 'me-lotf-nonfancyrsml-Max-b5-steps.dat' using 1:2 title 'o_{NFRSML} (b=5)' lc rgb 'black' with linespoints,\
'me-lotf-nonfancyrsml-Max-steps.dat' using 1:2 title 'o_{NFRSML} (b=10)' lc rgb 'grey70' with linespoints

set xrange [0:10.3]
set yrange [1:200]
set xtics 1.0
set tics out
set xlabel 'MAXPRT Model Parameter'
set ylabel 'Mean Executed Test Steps ~{~{t_{curr}}{0.1^{max}}}{1.5\_\_\_\_}'
set key title "test objective o" box left maxrows 3
#set logscale y
plot 'me-lotf-rsml-cov-dec-steps.dat' using 1:2 title '\{o_{RSML},ö_{cov},o_{dec}\}' lc rgb 'cyan' with linespoints,\
'me-lotf-rsml-dec-steps.dat' using 1:2 title '\{o_{RSML},o_{dec}\}' lc rgb 'red' with linespoints,\
'me-lotf-dec-steps.dat' using 1:2 title 'o_{dec}' lc rgb 'blue' with linespoints,\
'me-lotf-rsml-cov-steps.dat' using 1:2 title '\{o_{RSML},ö_{cov}\}' lc rgb 'green' with linespoints,\
'me-lotf-rsml-steps.dat' using 1:2 title 'o_{RSML}' lc rgb 'purple' with linespoints,\
'me-lotf-cov-steps.dat' using 1:2 title 'ö_{cov}' lc rgb 'yellow4' with linespoints
      






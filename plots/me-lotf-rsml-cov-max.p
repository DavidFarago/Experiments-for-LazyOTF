set xrange [0:10.3]
set yrange [1:200]
set xtics 1.0
set tics out
set xlabel 'MAXPRT Model Parameter'
set ylabel 'Mean Executed Test Steps ~{~{t_{curr}}{0.1^{max}}}{1.5\_\_\_\_}'
set key title "test objective o" box left maxrows 3
#set logscale y
plot 'me-lotf-rsml-cov-Max-steps.dat' using 1:2 title '\{o_{RSML},ö_{cov}\}' with linespoints pointtype 4 linecolor rgb 'green',\
'me-lotf-rsml-Max-steps.dat' using 1:2 title 'o_{RSML}' with linespoints pointtype 5 linecolor rgb 'purple',\
   'me-lotf-cov-Max-steps.dat' using 1:2 title 'ö_{cov}' with linespoints pointtype 6 linecolor rgb 'yellow4'

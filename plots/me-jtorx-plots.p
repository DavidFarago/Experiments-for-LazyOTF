#set term tikz standalone color solid size 5in,3in
#set output "TS_NonFancyRSMLvsJTorXRSML.tex"
set xrange [0:10.3]
set yrange [1:10000000]
set xtics 1.0
set tics out
set xlabel 'MAXPRT Model Parameter'
set ylabel 'Mean Executed Test Steps ~{~{t_{curr}}{0.1^{max}}}{1.5\_\_\_\_}'
set key at graph 0.1, 0.25 title "test objective o" box left maxrows 3
set logscale y
plot    'me-jtorx-rsml-cov-dec-steps.dat' using 1:2 title '\{o_{RSML},ö_{cov},o_{dec}\}' lc rgb 'cyan' with linespoints,\
'me-jtorx-rsml-dec-steps.dat' using 1:2 title '\{o_{RSML},o_{dec}\}' lc rgb 'red' with linespoints,\
   'me-jtorx-dec-steps.dat' using 1:2 title 'o_{dec}' lc rgb 'blue' with linespoints,\
'me-jtorx-rsml-cov-steps.dat' using 1:2 title '\{o_{RSML},ö_{cov}\}' lc rgb 'green' with linespoints,\
'me-jtorx-rsml-steps.dat' using 1:2 title 'o_{RSML}' lc rgb 'purple' with linespoints,\
'me-jtorx-cov-steps.dat' using 1:2 title 'ö_{cov}' lc rgb 'yellow4' with linespoints






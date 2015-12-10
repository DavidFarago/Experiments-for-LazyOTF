set xrange [0:10.3]
set yrange [1:10000000]
set xtics 1.0
set tics out
set xlabel 'MAXPRT Model Parameter'
set ylabel 'Mean Executed Test Steps ~{~{t_{curr}}{0.1^{max}}}{1.5\_\_\_\_}'
set key at graph 0.5, 0.3 width +2 title "test objective o" box left height +1 maxrows 3
set logscale y
#set label "(" at 6.85,2220000
#set label ")" at 7.05,2220000
#show label

   plot 'me-jtorx-liccov-steps.dat' using 1:2 title 'ö_{S_{isol}}' with linespoints lc rgb 'brown' pt 1,\
      'me-jtorx-rsml-steps.dat' using 1:2 title 'o_{RSML}=o_{NFRSML}' with linespoints lc rgb 'purple' pt 5
#	 "<echo '6.9 2213021'" pt "(" notitle,\
#    "<echo '7.1 2213021'" pt ")" notitle

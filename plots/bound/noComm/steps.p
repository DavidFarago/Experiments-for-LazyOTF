# set object 42 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"#d0d0d0" behind 
set xrange [0:10.1]
set yrange [10000:2000000]
set xlabel 'Bound b'
set ylabel 'Mean Executed Test Steps ~{~{t_{curr}}{0.1^{max}}}{1.5\_\_\_\_}'
set xtics 1.0
set ytics 
set tics out
set logscale y

set key at graph 0.05, 0.35 title "ö_{S_{isol}}, maxPort10, noComm" box left
# opaque, maxrows 3: nur bei neuerer gnuplot version

plot 'key-vs-steps-einsBis.dat' using 1:2 title '1uptoBound' lc rgb 'blue' with linespoints,\
    'key-vs-steps-vierBis.dat' using 1:2 title '4uptoBound' lc rgb 'red'  with linespoints,\
    'key-vs-steps-fuenfBis.dat' using 1:2 title '5uptoBound' lc rgb 'green' with linespoints,\
	 'key-vs-steps-einzeln.dat' using 1:2 title 'exactBound' lc rgb 'grey40' with linespoints

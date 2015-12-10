# set object 42 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"#d0d0d0" behind 
set xrange [0:10.1]
set yrange [1000:300000]
set xlabel 'Bound b'
set ylabel 'Mean CPU Time (s)'
set xtics 1.0
set ytics 
set tics out
set logscale y

set key at graph 0.05, 0.95 title "ö_{S_{isol}}, maxPort10, noComm" box left
# opaque, maxrows 3: nur bei neuerer gnuplot version

plot  'key-vs-cputime-einsBis.dat' using 1:7 title '1uptoBound' lc rgb 'blue' with linespoints,\
    'key-vs-cputime-vierBis.dat' using 1:7 title '4uptoBound' lc rgb 'red'  with linespoints,\
   'key-vs-cputime-fuenfBis.dat' using 1:7 title '5uptoBound' lc rgb 'green' with linespoints,\
     'key-vs-cputime-einzeln.dat' using 1:7 title 'exactBound' lc rgb 'grey40' with linespoints

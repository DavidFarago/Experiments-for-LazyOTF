# /Times-Italic und co funktioniert fuer pdf nicht :( Deswegen falls noch zeit am ende ueber acrobad professional machen
#set y2range [0.9:50]
#set y2label 'Mean WC Time (sec)' 
#set y2tics
#set logscale y2

set xrange [0:10.3]
set yrange [0.9:40000]
set xlabel 'MAXPRT Model Parameter'
set ylabel 'Mean WC Time (s); ~{~{t_{curr}}{0.1^{max}}}{1.5\_\_\_\_}'
set xtics 1.0
set tics out
set logscale y
set key at graph 0.01, 0.99 spacing 0.88 samplen 2 width -1.5  height +.3 title "Measurements for o_{NFRSML}" box left 
set label "(" at 9.85,900
set label ")" at 10.05,900
set label "(" at 9.85,8500
set label ")" at 10.05,8500
set label "(" at 9.85,14000
set label ")" at 10.05,14000
set label "(" at 9.85,19000
set label ")" at 10.05,19000
show label

#  "< paste key-vs-wallclocktime-nonfancyrsml.dat key-vs-sut-wallclocktime-nonfancyrsml.dat" using 1:($2/1000-$9) title 'wc without S_{LC} for o_{NFRSML}' with linespoints pointtype  11 linecolor rgb 'yellow',\
#   "< paste key-vs-lotf-steps-rsml.dat key-vs-sut-steps-rsml.dat" using 1:($2/$9) title 'steps S_{LC} div S_{sim S} for o_{RSML}' with linespoints pointtype  12 linecolor rgb 'red'
#    'key-vs-lotf-wallclocktime-nonfancyrsml.dat' using 1:($2/1000) title 'wc all on S_{sim S} for o_{NFRSML}' with linespoints pointtype 7 linecolor rgb 'grey60',\
#  'key-vs-lotf-wallclocktime-rsml.dat' using 1:($2/1000) title 'wc all on S_{sim S} for o_{RSML}' with linespoints pointtype 8 linecolor rgb 'violet',\

plot  'key-vs-lotf-steps-nonfancyrsml.dat' using 1:2 title 'steps on S_{sim S}' with linespoints pointtype 2 linecolor rgb 'black',\
    'key-vs-wallclocktime-nonfancyrsml.dat' using 1:($2/1000) title 'all wc on S_{LC}' with linespoints pointtype 3 linecolor rgb 'grey40',\
    'key-vs-sut-steps-nonfancyrsml.dat' using 1:2 title 'steps on S_{LC}' with linespoints pointtype 9 linecolor rgb 'grey20',\
    'key-vs-sut-wallclocktime-nonfancyrsml.dat' using 1:2 title 'test wc of S_{LC}' with linespoints pointtype 1 linecolor rgb 'grey80'

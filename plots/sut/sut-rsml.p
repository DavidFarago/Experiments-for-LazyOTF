# /Times-Italic und co funktioniert fuer pdf nicht :( Deswegen falls noch zeit am ende ueber acrobad professional machen
#set y2range [0.9:50]
#set y2label 'Mean WC Time (sec)' 
#set y2tics
#set logscale y2

set xrange [0:10.3]
set yrange [0.9:50]
set xlabel 'MAXPRT Model Parameter'
set ylabel 'Mean WC Time (s); ~{~{t_{curr}}{0.1^{max}}}{1.5\_\_\_\_}'
set xtics 1.0
set tics out
# set logscale y
set key at graph 0.01, 0.99 spacing 0.88 samplen 2 width -2  height +.3 title "Measurements for o_{RSML}" box left 

#  "< paste key-vs-wallclocktime-nonfancyrsml.dat key-vs-sut-wallclocktime-nonfancyrsml.dat" using 1:($2/1000-$9) title 'wc without S_{LC} for o_{NFRSML}' with linespoints pointtype  11 linecolor rgb 'yellow',\
#   "< paste key-vs-lotf-steps-rsml.dat key-vs-sut-steps-rsml.dat" using 1:($2/$9) title 'steps S_{LC} div S_{sim S} for o_{RSML}' with linespoints pointtype  12 linecolor rgb 'red'
#    'key-vs-lotf-wallclocktime-nonfancyrsml.dat' using 1:($2/1000) title 'wc all on S_{sim S} for o_{NFRSML}' with linespoints pointtype 7 linecolor rgb 'grey60',\
#  'key-vs-lotf-wallclocktime-rsml.dat' using 1:($2/1000) title 'wc all on S_{sim S} for o_{RSML}' with linespoints pointtype 8 linecolor rgb 'violet',\


#  'key-vs-lotf-steps-nonfancyrsml.dat' using 1:2 title 'steps on S_{sim S}# fo#r o_{NFRSML}' with linespoints pointtype 2 linecolor rgb 'black',\
#    'key-vs-wallclocktime-nonfancyrsml.dat' using 1:($2/1000) title 'all wc on# S_{LC} for o_{NFRSML}' with linespoints pointtype 3 linecolor rgb 'grey40',\
#    'key-vs-sut-steps-nonfancyrsml.dat' using 1:2 title 'steps on S_{LC} for o#_{NFRSML}' with linespoints pointtype 9 linecolor rgb 'grey20',\
#    'key-vs-sut-wallclocktime-nonfancyrsml.dat' using 1:2 title 'test wc of S_#{LC} for o_{NFRSML}' with linespoints pointtype 1 linecolor rgb 'grey80',\

plot    'key-vs-lotf-steps-rsml.dat' using 1:2 title 'steps on S_{sim S}' with linespoints pointtype 5 linecolor rgb 'purple',\
 'key-vs-wallclocktime-rsml.dat' using 1:($2/1000) title 'all wc on S_{LC}' with linespoints pointtype 6 linecolor rgb 'blue',\
    'key-vs-sut-steps-rsml.dat' using 1:2 title 'steps on S_{LC}' with linespoints pointtype 10 linecolor rgb 'light-blue',\
'key-vs-sut-wallclocktime-rsml.dat' using 1:2 title 'test wc of S_{LC}'  with linespoints pointtype 4 linecolor rgb 'dark-blue'

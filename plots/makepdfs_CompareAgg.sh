export GNUTERM=pdf

# auf i11pc5*!

GNUPLOTOPTIONS="set terminal pdf enhanced font \"Helvetica,12\" size 11cm,8cm"
plot() {
    gnuplot -e "$GNUPLOTOPTIONS" $1.p > $1.pdf
}

plot me-lotf-liccov-nonfancyrsml-max
plot me-lotf-liccov-nonfancyrsml-maxmax

plot me-lotf-rsml-cov-max
plot me-lotf-rsml-cov-maxmax

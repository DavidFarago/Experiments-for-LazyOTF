export GNUTERM=pdf

# auf i11pc54!

GNUPLOTOPTIONS="set terminal pdf enhanced font \"Helvetica,12\" size 11cm,8cm"
plot() {
    gnuplot -e "$GNUPLOTOPTIONS" $1.p > $1.pdf
}

plot me-lotf-liccov-nonfancyrsml
plot me-lotf-rsml-dec-cov
plot me-jtorx-plots
plot me-jtorx-liccov

#plot comp-nonfancyvsjtorx
#plot me-lotf-plots
#plot me-lotf-plots-2
#plot me-jtorx-plots
#plot me-jtorx-plots-2
#plot me-lotf-exponential-plot

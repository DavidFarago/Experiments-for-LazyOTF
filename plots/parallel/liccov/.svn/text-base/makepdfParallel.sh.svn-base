export GNUTERM=pdf

# auf i11pc54!

GNUPLOTOPTIONS="set terminal pdf enhanced font \"Helvetica,12\" size 11cm,8cm"
plot() {
    gnuplot -e "$GNUPLOTOPTIONS" $1.p > $1.pdf
}

plot parallelLiccov

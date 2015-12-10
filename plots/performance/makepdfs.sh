export GNUTERM=pdf

# auf i11pc5*!

GNUPLOTOPTIONS="set terminal pdf enhanced font \"Helvetica,12\" size 11cm,8cm"
plot() {
    gnuplot -e "$GNUPLOTOPTIONS" $1.p > $1.pdf
}

plot cbm-times
plot parallelOverhead
plot nonfancyBound5key-vs-cputime-per-step
plot liccov_bound_communication_key-vs-memory
plot cluster-id-vs-steps-P14

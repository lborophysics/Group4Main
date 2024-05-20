# Set terminal to gif animation with delay
set terminal gif animate delay 22

# Set output file name
set output '/Users/phfr/Documents/animation.gif'

set xlabel "xnodes"

set ylabel " YNnodes"

set xrange [0:100]
set yrange [0:80]

# Loop through the snapshot files and plot them
do for [i=0:49] {
    # Generate the file name dynamically and plot the data
    plot sprintf('/Users/phfr/Documents/snapshot.%d', i) using 1:2:($3 < -3 ? -3 : $3) with image notitle
}

# Reset the output to close the file
set output
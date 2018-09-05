#!/bin/bash

# This script is designed to run the QR Serial Creator script then to add all the images to a single "page" for printing the QR codes

# Run Python script to create the QR codes
python3 qr_gen.py

# Append all images together assume 100 for now
for i in {0..9};
do
	top=$((($i*10)+9))
	bottom=$(($i*10))
	imgs=$(seq -s '.png ' $bottom $top).png
	# This uses Image Magick to convert the first 10 images into "rows"
	convert  $imgs +append output$i.png
done

# This uses Image Magick to convert the rows into vertically stacked rows
convert output[0-9].png -append finalout.png

# Clean up images in directory
for i in {0..99};
do
	rm $i.png
done

for i in {0..9};
do
	rm output$i.png
done
echo "Thank's for using my software! This has been a huge success. Anyway, we did this for science, you monster."

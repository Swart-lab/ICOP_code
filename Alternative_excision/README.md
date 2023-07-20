# Alternative excision analysis

### lib-size.sh
This script extracts the read number of properly paired and mapped reads from the parties map output for downsampling factor calculation

### run-milord.sh
This script downsamples the reads according to the provided downsampling factor (float betwenn 0 and 1) and runs the MILORD module to extract the alternative excision events.
Note: the sample with the smallest library size (not included in downsampling), the MILORD command needs to be executed separately.

### Downsampled_Alternative_Excision_ICOP_paper.ipynb
This notebook analyses the alternative excision events reported in the gff3.gz files outputted by MILORD.

### MILORD/MILORD.pm
Pre-release MILORD module used in this study. The updated version is on https://github.com/oarnaiz/ParTIES/tree/master/lib/PARTIES

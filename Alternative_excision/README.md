# Alternative excision analysis

### lib-size.sh
This script acquires the libary size for each sample. It extracts the number of properly paired and mapped reads from the parties "Map" output 
from mapping on the MAC+IES genome (see IES_retention/IRS_parties.sh).
These numbers can be used to calculate the downsampling factor

To provide:
- a text file (called to_lib-size.txt) containing the sample names in individual lines.

Output:
- a lib_size_ppm.txt file. For each sample, the name will be printed in one line and the read number in the subsequent line

### run-milord.sh
This script downsamples the reads according to the provided downsampling factor (float betwenn 0 and 1) and runs the MILORD module to extract the alternative excision events.
Note: the sample with the smallest library size (not included in downsampling), the MILORD command needs to be executed separately.

To provide:
- a text file (called to_milord.txt) containing in each line a sample name and the corresponding downsampling factor (separated by a space)

Output:
- a directory named by sample name containing the MILORD output. The .ggf3 file reports the detected alternative excision events.

### Downsampled_Alternative_Excision_ICOP_paper.ipynb
This notebook analyses the alternative excision events reported in the gff3.gz files outputted by MILORD.

### MILORD/MILORD.pm
Pre-release MILORD module used in this study. The updated version is on https://github.com/oarnaiz/ParTIES/tree/master/lib/PARTIES

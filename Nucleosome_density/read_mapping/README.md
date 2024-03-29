# DNA-seq and DNAse-seq processing for IESs

## Content of this subdirectory
### IES_coverage scripts
These scripts map the reads to the reference genome. The "nucleosome_density" script size selects the reads. Both scripts extract properly paired and mapped reads and reads mapping to IESs. If no downsampling is applied, the reads on IESs can be counted.

These are the output files: 
- .bam (properly paired and mapped reads, unsorted)
- .sorted.bam (sorted)
- .sorted.bam.bai (indexed)
- .IES.bam (reads mapping IES extracted from .sorted.bam)
- optional: .IES.htseq-count.txt (table with read counts per IES)
  
IES_coverage_nucleosome_density.sh: outputs size-selected reads

IES_coverage_MAC_DNA.sh: no size selection applied

### downsampling scripts
These scripts downsample the .IES.bam reads and count the reads on IESs. Library sizes for calculating the downsampling factor should be acquired by samtools stats command on .sorted.bam files. The downsampling factor should be a float between 0 and 1.

output files: 
- .IES.bam.bai (indexed)
- .IES.downsampled.bam (downsampled reads)
- .IES.htseq-count.txt (table with read counts per IES)

downsampling_DNase.sh: works with size-selected files

downsampling_MAC.sh: works with non size-selected files

### compare-reads.sh
This script compares the read length distribution of two samples. It uses the .IES.downsampled.bam and .IES.bam file of the DNase samples as input and outputs a histogram.

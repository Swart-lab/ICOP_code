#!/bin/bash

# this script downsamples properly paired and mapped reads according to downsampling factor
# provide sample name and downsampling factor in a .txt file
# alternative excision events will be reported by MILORD module

while read -r PREFIX DOWN; do

    #downsample the reads and store in KD9_alternative_excision folder
    samtools view -b -s $DOWN $PREFIX\_MIC.ptetraurelia_mac_51_with_ies.fa.BOWTIE.sorted.ppm.bam \
> $PREFIX\_MIC.ptetraurelia_mac_51_with_ies.fa.BOWTIE.sorted.ppm.downsampled-ppm.bam
    samtools index $PREFIX\_MIC.ptetraurelia_mac_51_with_ies.fa.BOWTIE.sorted.ppm.downsampled-ppm.bam

    # run MILORD module
    parties MILORD -genome ptetraurelia_mac_51_with_ies.fa \
-out_dir $PREFIX/ \
-bam $PREFIX\_MIC.ptetraurelia_mac_51_with_ies.fa.BOWTIE.sorted.ppm.downsampled-ppm.bam \
-ies internal_eliminated_sequence_MAC_with_IES.gff3 -threads 30 -force

# provide prefix and downsampling factor separated by a space for each sample in line
done < to_milord.txt

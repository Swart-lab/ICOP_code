#!/bin/bash

# this script extracts number of properly paired and mapped reads for all samples provided in the to_lib-size.txt

while read -r PREFIX; do
    echo $PREFIX

    # extract the properly paired and mapped reads
    samtools view -f2 -b $PREFIX\_MIC.ptetraurelia_mac_51_with_ies.fa.BOWTIE.sorted.bam \
> $PREFIX\_MIC.ptetraurelia_mac_51_with_ies.fa.BOWTIE.sorted.ppm.bam

    #generate a stats file from .sorted.ppm.bam
    samtools stats $PREFIX\_MIC.ptetraurelia_mac_51_with_ies.fa.BOWTIE.sorted.ppm.bam \
> $PREFIX\_MIC.ptetraurelia_mac_51_with_ies.fa.BOWTIE.sorted.ppm.bam.stats

    #extract the properly paired and mapped read number and store in a text file
    echo $PREFIX >> lib_size_ppm.txt
    sed -n -e '15,15p' $PREFIX\_MIC.ptetraurelia_mac_51_with_ies.fa.BOWTIE.sorted.ppm.bam.stats \
>> lib_size_ppm.txt

# provide a text file with the prefix for each sample in a separate line
done < to_lib-size.txt

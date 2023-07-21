#!/bin/bash

# mapping of RNA-seq PE reads to split transcriptomes (the knockdown target transcript is split into 5'-, silencing- and 3'-region

# NAME: how sample is called by company
# PREFIX: new name of the sample
# KD: name of the split_transcriptome used for mapping

while read -r NAME PREFIX KD; do

    # map the reads to the split transcriptome
    hisat2 --threads 16 -k 20 -q -x $KD-KD_ptetraurelia_mac_51_annotation_v2.0.transcript.fa \
--min-intronlen 10 --max-intronlen 500000 \
-1 ${NAME}_R1_001.fastq.gz \
-2 ${NAME}_R2_001.fastq.gz \
-S ${PREFIX}.$KD-split.sam

    #extract the properly mapping and paired reads
    samtools view -@ 8 -f2 -bT $KD-KD_ptetraurelia_mac_51_annotation_v2.0.transcript.fa \
${PREFIX}.$KD-split.sam > ${PREFIX}.$KD-split.bam

    #sort them by name for eXpress
    samtools sort -n -@ 8 -o $PREFIX.$KD-split.n-sorted.bam $PREFIX.$KD-split.bam
    samtools stats -@ 8 $PREFIX.$KD-split.n-sorted.bam > $PREFIX.$KD-split.n-sorted.bam.stats

    #sort them by location to extract specific regions for visualization in Geneious
    samtools sort -@ 8 -o $PREFIX.$KD-split.sorted.bam $PREFIX.$KD-split.bam
    samtools stats -@ 8 $PREFIX.$KD-split.sorted.bam > $PREFIX.$KD-split.sorted.bam.stats
    samtools index $PREFIX.$KD-split.sorted.bam

    # run express
    express -o quanti_split_ICOPs/$PREFIX.$KD -O 5 --calc-covar \
$KD-KD_ptetraurelia_mac_51_annotation_v2.0.transcript.fa \
$PREFIX.$KD-split.n-sorted.bam


    rm ${PREFIX}.$KD-split.sam

done < to_eXpress.txt

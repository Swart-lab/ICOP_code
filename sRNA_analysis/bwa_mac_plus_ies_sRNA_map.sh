#!/bin/bash

REFPREFIX=ptetraurelia_mac_51_with_ies
REFSEQ=$REFPREFIX.fa
THREADS=32
SRNA_SIZE=[1-4][0-9]

for IDX in {1..10}
do
  FASTQ=sRNA-seq/$IDX--${IDX}_R1_001.trimmed.fastq.gz

  bwa aln -t $THREADS -n 1 $REFSEQ $FASTQ > $REFPREFIX.$IDX.sai
  bwa samse $REFSEQ $REFPREFIX.$IDX.sai $FASTQ > $REFPREFIX.$IDX.sam
  grep "^@SQ\|	${SRNA_SIZE}M	.*	XT:A:U" $REFPREFIX.$IDX.sam > $REFPREFIX.$IDX.filtered.sam

  samtools view -b $REFPREFIX.$IDX.filtered.sam > $REFPREFIX.$IDX.filtered.bam
  samtools sort -@ $THREADS $REFPREFIX.$IDX.filtered.bam > $REFPREFIX.$IDX.filtered.sorted.bam
  samtools index $REFPREFIX.$IDX.filtered.sorted.bam

  rm -f $REFPREFIX.$IDX.sam $REFPREFIX.$IDX.filtered.sam $REFPREFIX.$IDX.filtered.bam
done

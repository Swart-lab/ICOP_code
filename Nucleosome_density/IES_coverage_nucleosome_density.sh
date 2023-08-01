# This script maps reads, size-selects them and extracts IES mapping reads
# optianlly reads on IESs can be counted. If downsampling should be applied, don't count the reads here

# provide sample prefix (uncomment as appropriate)
PREFIX=WCP1_2_PGM_DNase
#PREFIX=ND7_PGM_DNase

# map reads to reference genome
hisat2 --threads 16 -q -x ptetraurelia_mac_51_with_ies --min-intronlen 24 \
--max-intronlen 20000 \
-1 ${PREFIX}_R1.fastq.gz -2 ${PREFIX}_R2.fastq.gz \
-S ${PREFIX}.sam

# select reads of defined length
awk 'substr($0,1,1)=="@" || ($9>=125 && $9<=175) || ($9<=-125 && $9>=-175)' ${PREFIX}.sam > ${PREFIX}.size_selected.sam

# extract properly paired and mapped reads
samtools view -f2 -bT ptetraurelia_mac_51_with_ies.fa ${PREFIX}.size_selected.sam > ${PREFIX}.size_selected.bam
samtools sort -o $PREFIX.size_selected.sorted.bam $PREFIX.size_selected.bam
samtools index $PREFIX.size_selected.sorted.bam

# extract reads mapping to IESs
bedtools intersect -abam $PREFIX.size_selected.sorted.bam -b internal_eliminated_sequence_MAC_with_IES.bed -f 0.06 -split > $PREFIX.size_selected.IES.bam

# count reads on IESs (only uncomment if no downsampling is applied)
#htseq-count -f bam -r pos -s no --idattr ID -t internal_eliminated_sequence $PREFIX.size_selected.IES.bam internal_eliminated_sequence_MAC_with_IES.gff3 | grep -v "__" > $PREFIX.IES.htseq-count.txt

rm ${PREFIX}.size_selected.sam
rm ${PREFIX}.sam

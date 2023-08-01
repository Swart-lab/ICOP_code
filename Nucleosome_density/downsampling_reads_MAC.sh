# This script downsamples not size-selected IES mapping reads

# provide sample Prefix and downsampling factor
PREFIX=WCP1_2_PGM_MAC
DOWN=0.995839182

# Index coordinate-sorted files for fast random access
samtools index $PREFIX.not_size_selected.IES.bam

# downsampling
samtools view -b -s $DOWN $PREFIX.not_size_selected.IES.bam > $PREFIX.not_size_selected.IES.downsampled.bam

# read count on IESs
htseq-count -f bam -r pos -s no --idattr ID -t internal_eliminated_sequence $PREFIX.not_size_selected.IES.downsampled.bam \
internal_eliminated_sequence_MAC_with_IES.gff3 | grep -v "__" > $PREFIX.IES.downsampled.htseq-count.txt

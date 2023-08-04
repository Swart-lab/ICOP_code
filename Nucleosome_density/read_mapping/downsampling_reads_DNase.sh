# this script downsamples the size-selected IES mapping reads

# provide sample Prefix and downsampling factor
PREFIX=ND7_PGM_DNase
DOWN=0.857336441

# Index coordinate-sorted files for fast random access
samtools index $PREFIX.size_selected.IES.bam

# downsample
samtools view -b -s $DOWN $PREFIX.size_selected.IES.bam > $PREFIX.size_selected.IES.downsampled.bam

# count reads on IESs
htseq-count -f bam -r pos -s no --idattr ID -t internal_eliminated_sequence $PREFIX.size_selected.IES.downsampled.bam \
internal_eliminated_sequence_MAC_with_IES.gff3 | grep -v "__" > $PREFIX.IES.downsampled.htseq-count.txt


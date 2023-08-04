# this script generates a read length histogram. It works on two samples. One after the other extracts scaffold 9 from the sorted.bam file.
#In the final command a histogram of the read lengths will be generated.

# provide prefix
# this is the downsampled sample
PREFIX1=ND7_PGM_DNase
# this is the not-downsampled sample
PREFIX2=ICOP1_2_PGM_DNase

# this script works on two samples. One after the other it extracts scaffold 9 from the sorted.IES.bam file.

samtools index $PREFIX1.size_selected.IES.downsampled.bam
samtools view $PREFIX1.size_selected.IES.downsampled.bam scaffold51_9_with_IES -b > $PREFIX1.scaffold9.size_selected.IES.downsampled.bam
samtools index $PREFIX1.scaffold9.size_selected.IES.downsampled.bam

samtools index $PREFIX2.size_selected.IES.bam
samtools view $PREFIX2.size_selected.IES.bam scaffold51_9_with_IES -b > $PREFIX2.scaffold9.size_selected.IES.bam
samtools index $PREFIX2.scaffold9.size_selected.IES.bam

bamPEFragmentSize -b $PREFIX1.scaffold9.size_selected.IES.downsampled.bam $PREFIX2.scaffold9.size_selected.IES.bam -o ICOP1-2_read-hist_scaffold9.IES.bins.pdf \
--plotFileFormat pdf --maxFragmentLength 500 -n 1000 -p 10 --table ICOP1-2_read-hist_scaffold9.IES.bins.tab

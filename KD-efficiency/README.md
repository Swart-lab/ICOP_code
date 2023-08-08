# Validating knockdown efficiency

### calculate_eXpression.sh
This script maps the PE reads to the reference split-transcriptome. In this transcriptome, the target gene of the KD is split into 
5'-, silencing- and 3'-region. This is required when the coverage on the silencing region is much higher than on the rest of the 
transcript (due to siRNAs produced during silencing). Each knockdown therefore requires a separate split-transcriptome.

To provide:
A to_eXpress.txt file that contains three entries per line
- NAME: how sample is called by company
- PREFIX: new name of the sample
- KD: name of the split_transcriptome used for mapping

Output:
- .bam (properly paired and mapped reads)
- .sorted.bam (sorted by location
- .n-sorted.bam (sorted by read name)
- directory named by prefix, containing eXpress output. FPKM values can be found in results.xprs

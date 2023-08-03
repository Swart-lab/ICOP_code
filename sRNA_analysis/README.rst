How to run sRNA analysis scripts
================================

#. Install samtools and bwa.
#. Obtain fasta file for genomes of interest (e.g. for Paramecium, MAC, MAC+IES, L4440 vector; the former two can be obtained from ParameciumDB).
#. Change variables in ``$REFPREFIX`` and ``$IDX`` in both read mapping shell scripts as necessary to process multiple sRNA fastq files, then run.
#. Change variables in ``zRNA_len_histograms.py`` as necessary to refer to mapped read files from the previous step (to populate the dictionaries: "mac_count_d", "mac_plus_ies_count_d", "vec_count_d" - three series of sorted bam files should be given as input).
#. Run ``sRNA_len_histograms.py`` from the command line, to generate a series of sRNA length histogram pdfs.

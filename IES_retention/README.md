# IES retention score analysis

### get_filename_from_path.py
This script is called by IRS_parties.sh

### IRS_parties.sh
This script runs parties "Map" module to map the whole genome sequencing PE reads to the MAC and the MAC+IES genomes. Afterwards it runs 
the "MIRET" module to acquire IES retention scores (IRS). The modules can be found on https://github.com/oarnaiz/ParTIES/tree/master/lib/PARTIES

Arguments to provide when running the script:
- $1 path to the PE sequencing reads 1
- $2 path to the PE sequencing reads 2
- $3 sample name
- $4 number of threads
- $5 path to directory where results should be stored

Variables to specify in the script:
- TMP_DIR path to directory where temporaily the files should be stored
- GENOME_DIR path to directory where the reference files are stored (.fa and .gff3 for MAC and MAC+IES genomes)

Output directories:
- [name]_MIC contains sorted .bam file with reads mapping to MAC+IES genome
- [name]_MAC contains sorted .bam file with reads mapping to MAC genome
- [name]_results contains .gff3 with read counts per IES and IRS

### convert_MIRET_gff3_to_tab.py
This script extracts the IRSs for the MIRET.gff3 file and stores them into a .tab file

Arguments to provide when running the script:
- $1 path to MIRET.gff3 file

### extend_miret_table.py
This scripts adds [name].tab files to a extisting .tab file containing IRS of other knockdowns.

Arguments to provide when running the script:
- $1 path to the existing tab file that should be extended
- $2 to $n path to [name].tab files to be added to the existing .tab file
- with "> path/to/new/file.tab" the output will be stored in a new file

### IES_Retention_scores_ICOP_paper.ipynb
This jupyter notebook generates histograms for the IRS distribution for all IESs.

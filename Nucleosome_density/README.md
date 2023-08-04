# IES nucleosome density analyses

## Content of this subdirectory
### Read mapping scripts
These are located in the [read_mapping](read_mapping) subdirectory, with a README that describes their usage.

### Prepare_input_data_for_nuc_den.ipynb
This notebook prepares the input files for the subsequent nucleosome density analysis notebooks. It uses the .IES.htseq-count.txt files as input. The output can be used in ICOP_nucleosome_density_differences_paper.ipynb

### ICOP_IES_nucleosome_densities.ipynb
This notebook analyses nucleosome densities on IESs for different datasets. The dataset comprises the experimental sample (gene-of-interest/PGM-KD) and corresponding control sample (ND7/PGM-KD).

### ICOP_IES_nucleosome_density_differences_paper.ipynb
This notebook analyses nucleosome density differences on IESs for different datasets. The dataset comprises the experimental sample (gene-of-interest/PGM-KD) and corresponding control sample (ND7/PGM-KD).

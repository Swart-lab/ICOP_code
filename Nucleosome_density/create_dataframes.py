import pandas as pd
from functools import reduce
import numpy as np

files = ['input_files/ICOPs.merged.lengths.IES.downsampled.htseq-count.txt.gz',
         'input_files/ISWI1.IES_read_counts.txt.gz',
         'input_files/NOWA1.IES_read_counts.txt.gz',
         'input_files/PTCAF.htseq-count.downsampled.txt.gz']

# read all input files in data frames
dfs = []
for file in files:
    dfs.append(pd.read_csv(file, compression = 'gzip', sep=" "))

# merge the data frames
df = reduce(lambda left,right: pd.merge(left,right,on=['IES', 'IES_length'],
                how='outer'), dfs).fillna(np.nan)

#Read IES retention scores into dataframe
df_irs = pd.read_csv("ICOP_IRS.tab.gz",sep="\t")


#Choose the knockdowns you might want to use as filters
chosen_irs = df_irs[["ies_name", "ICOP1_2"]]

#Combine IES retention score dataframe together with IES read mapping dataframe:
df_merge = pd.merge(df, chosen_irs, left_on=["IES"], right_on=["ies_name"], how="inner")
df2 = df_merge.drop(columns=["ies_name"]).rename(columns={"ICOP1_2": "ICOP1_2-KD"})
df2.set_index("IES")


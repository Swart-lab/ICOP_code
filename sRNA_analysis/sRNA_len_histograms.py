#!/usr/bin/env python
import sys
import re
import pysam
import matplotlib

from Bio import SeqIO, Seq
from sys import argv
import matplotlib.pyplot as plt
from numpy import *

plt.rcParams['font.size'] = 14
matplotlib.rc('font',**{'family':'sans-serif','sans-serif':['Arial']})

min_sRNA_len = 1
max_sRNA_len = 50

def process_genome_sRNAs(genome_fasta, bam_file):
  f = SeqIO.parse(open(genome_fasta), "fasta")
  samfile = pysam.AlignmentFile(bam_file, "rb")

  scaffolds = [rec.name for rec in f]
  count_d = dict([(i, 0) for i in range(min_sRNA_len, max_sRNA_len +1)])

  for scaff in scaffolds:
    for read in samfile.fetch(scaff):
      cigar = int(read.cigarstring[:-1])
      count_d[cigar] += 1

  return count_d


for exp in range(1, 11):
  mac_count_d = process_genome_sRNAs("ptetraurelia_mac_51.fa", f"{exp}.filtered.sorted.bam")
  mac_plus_ies_count_d = process_genome_sRNAs("ptetraurelia_mac_51_with_ies.fa",
                          f"ptetraurelia_mac_51_with_ies.{exp}.filtered.sorted.bam")
  vec_count_d = process_genome_sRNAs("L4440.fa", f"L4440.{exp}.filtered.sorted.bam")

  ies_count_d = {}
  for i in range(1, 51):
    ies_count_d[i] = mac_plus_ies_count_d[i] - mac_count_d[i]
    
  sRNA_lengths = range(min_sRNA_len, max_sRNA_len +1)


  fig, ax = plt.subplots()
  #ax.set_aspect(1)

  mac_tot = sum(list(mac_count_d.values()))
  ies_tot = sum(list(ies_count_d.values()))
  vec_tot = sum(list(vec_count_d.values()))
  tot_count = mac_tot + ies_tot + vec_tot

  mac_counts = [mac_count_d[sRNA_length]/tot_count for sRNA_length in sRNA_lengths]
  ies_counts = [ies_count_d[sRNA_length]/tot_count for sRNA_length in sRNA_lengths]
  vec_counts = [vec_count_d[sRNA_length]/tot_count for sRNA_length in sRNA_lengths]

  #print(sum(mac_counts) + sum(ies_counts) + sum(vec_counts))

  plt.bar(sRNA_lengths, ies_counts, fc='red')
  plt.bar(sRNA_lengths, mac_counts, bottom=ies_counts, fc='green')#, ec='white')  
  mac_plus_ies_counts = array(mac_counts) + array(ies_counts)
  plt.bar(sRNA_lengths, vec_counts, bottom=mac_plus_ies_counts, fc='mediumpurple')#, ec='white')  
  plt.axis(xmin=9, xmax=41)

  plt.savefig(f"sRNA_distrib_{exp}.pdf")
    
  


# vim:sts=2:ts=2:sw=2

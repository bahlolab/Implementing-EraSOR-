#!/bin/bash

# script to add beta column to Saige sumstat files

library(tidyverse)
sumstat.dir <- " "
N <- 4000 # gwas sample size


# read in sumstat file from Saige output
saige.sumstats <- read_table(file.path(sumstat.dir, "saige.assoc.gz"))

saige.sumstats$beta <- saige.sumstats$Z /
  sqrt(((2*saige.sumstats$P)*(1-saige.sumstats$P))*(N + (saige.sumstats$Z^2)))

# write new sumstat file with beta value
write_tsv(saige.sumstats, file.path(sumstat.dir, "saige.sumstats.beta"))
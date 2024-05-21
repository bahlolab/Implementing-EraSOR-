#!/bin/bash

export APP_DIR=" "
export SUMSTATS_DIR=" "
export TARGET="plink.files" 
export IN_DIR=" "
export OUT_DIR=" "
export PHENO=" "

#module load R

Rscript ${APP_DIR}/PRSice.R \
--prsice ${APP_DIR}/PRSice_linux \
--base ${SUMSTATS_DIR}/saige.sumstats.beta \
--A1 A1 \
--A2 A2 \
--stat beta \
--beta \
--bar-levels 0.1,0.5 \
--fastscore \
--binary-target T \
--no-full \
--bp BP \
--chr CHR \
--pvalue P \
--snp SNP \
--clump-kb 250kb \
--clump-p 1.000000 \
--clump-r2 0.100000 \
--upper 1 \
--missing MEAN_IMPUTE \
--no-regress \
--model add \
--nonfounders \
--out ${OUT_DIR}/${PHENO} \
--print-snp \
--score sum \
--thread 10 \
--target ${IN_DIR}/${TARGET} \
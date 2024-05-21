#!/bin/bash

## set environmental variables ##
export APP_DIR=" "
export BASE_SUMSTAT_DIR=" "
export TARGET_SUMSTAT_DIR=" "
export LD_REF_DIR=" "
export ADJUSTED_SUMSTAT_DIR=" "


### run EraSOR ###

python ${APP_DIR}/EraSOR/EraSOR.py \
    --base ${BASE_SUMSTAT_DIR}/base_sumstat_file.txt \
    --base-snp SNP \
    --base-signed-sumstats BETA,0 \
    --base-a1 ALLELE1 \
    --base-a2 ALLELE0 \
    --base-p P_BOLT_LMM_INF \
    --base-N-col N \
    --target ${TARGET_SUMSTAT_DIR}/target_sumstats_file.txt \
    --target-snp MarkerName \
    --target-signed-sumstats Beta,0 \
    --target-a1 Allele1 \
    --target-a2 Allele2 \
    --target-p P-value \
    --target-N-col Effective_N \
    --ref-ld-chr ${LD_REF_DIR}/baselineLD_v2.3/baselineLD. \
    --w-ld-chr ${LD_REF_DIR}/1000G_Phase3_weights_hm3_no_MHC/weights.hm3_noMHC. \
    --out {ADJUSTED_SUMSTAT_DIR}/EraSOR.adjusted
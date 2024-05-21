#!/bin/bash

export SAIGE_DIR=" "
export DATA_DIR=" " # plink files
export RESULT_DIR=" "

# create sparse GRM file

Rscript ${SAIGE_DIR}/createSparseGRM.R \
--plinkFile=${DATA_DIR}/plink.files \
--nThreads=4 \
--outputPrefix=${RESULT_DIR}/sparseGRM \
--numRandomMarkerforSparseKin=2000 \
--relatednessCutoff=0.125

# step 1 NULL model

Rscript ${SAIGE_DIR}/step1_fitNULLGLMM.R \
--plinkFile=${DATA_DIR}/plink.files \
--phenoFile=${RESULT_DIR}/pheno_file.txt \
--phenoCol=PHENOTYPE \
--covarColList=SEX,PC1,PC2,PC3,PC4,PC5 \
--sexCol=SEX \
--FemaleCode=2 \
--MaleCode=1 \
--sampleIDColinphenoFile=IID \
--traitType=binary \
--outputPrefix=${RESULT_DIR}/binary \
--nThreads=24 \
--IsOverwriteVarianceRatioFile=TRUE \
--LOCO=FALSE \
--useSparseGRMtoFitNULL=TRUE \
--sparseGRMFile ${RESULT_DIR}/sparseGRM_relatednessCutoff_0.125_2000_randomMarkersUsed.sparseGRM.mtx \
--sparseGRMSampleIDFile ${RESULT_DIR}/sparseGRM_relatednessCutoff_0.125_2000_randomMarkersUsed.sparseGRM.mtx.sampleIDs.txt

# step 2 fit model

for i in $(seq 4 22);
do

Rscript ${SAIGE_DIR}/step2_SPAtests.R \
--bedFile=${DATA_DIR}/plink.files.bed \
--bimFile=${DATA_DIR}/plink.files.bim \
--famFile=${DATA_DIR}/plink.files.fam \
--AlleleOrder=alt-first \
--is_output_moreDetails=FALSE \
--chrom=${i} \
--minMAF=0 \
--minMAC=20 \
--LOCO=FALSE \
--sparseGRMFile=${RESULT_DIR}/sparseGRM_relatednessCutoff_0.125_2000_randomMarkersUsed.sparseGRM.mtx \
--sparseGRMSampleIDFile=${RESULT_DIR}/sparseGRM_relatednessCutoff_0.125_2000_randomMarkersUsed.sparseGRM.mtx.sampleIDs.txt \
--GMMATmodelFile=${RESULT_DIR}/binary.rda \
--varianceRatioFile=${RESULT_DIR}/binary.varianceRatio.txt \
--SAIGEOutputFile=${RESULT_DIR}/chr${i}_test.txt \
--is_Firth_beta=FALSE \
--is_fastTest=TRUE

done
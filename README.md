# Implementing-EraSOR-
Code for analyses performed as part of Ellis CA, Oliver KL et al. manuscript

# Supplementary methods 

The EraSOR software takes as input two sets of GWAS summary statistics: (1) summary statistics of the base GWAS; and (2) summary statistics from a GWAS performed on the PRS target cohort. To generate these latter data, we performed a separate GWAS in each of our target cohorts using SAIGE v1.3.3, comparing familial cases to population controls (see scripts #1.1, #1.2, #1.3). Related samples were accounted for by inclusion of a sparse genetic-relationship matrix in the null logistic mixed model, in addition to sex and the first 5 ancestry principal components as covariates. Principal components were generated using PCAir software to account for relatedness (see script #2).

After providing the two sets of summary statistics (for the base and target cohort) as input (see script #3), EraSOR produces as output an adjusted set of summary statistics (z-scores) for a subset of the base GWAS SNPs based on a reference panel of LD (linkage disequilibrium) scores. We used European LD scores calculated from 1000 Genomes.

Erasor-adjusted beta values were calculated from z-scores (see script #4). These adjusted beta weights were used to compute PRS values for the target cohorts using PRSice-2 (see script #5).

P-values and odds ratios reported in Table 1 were calculated using mixed effects models accounting for genetic relatedness as a random effect covariate, and the first five ancestry principal components as fixed effects (see script #6).

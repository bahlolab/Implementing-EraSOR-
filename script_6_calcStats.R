#!/bin/bash

## Logistic regression ##
library(tidyverse)
library(lme4)

# status - case v control (1, 0)

prs_dir <- " "
prs_data <- read_tsv(file.path(prs_dir, "prs.all.score"))

# merge scores with pca and clinical data
prs_database <- left_join(prs_data, pca_data, by = "sample.id") %>% 
					left_join(clin_data, by = "sample.id")

### lme4 ###
model_01 <- lme4::glmer(status ~ PRS + SEX + PC1 + PC2 + PC3 + PC4 + PC5 +
                     (1|FID), family=binomial, data = prs_database)

summary(model_01)

# calc ORs
cc <- confint(model_01, parm = "beta_", method = "Wald")
ctab <- cbind(est = fixef(model_foc01), cc)
rtab <- exp(ctab) #exponentiate to get ORs
print(rtab, digits = 3)
### C22_DataforModel
### author: Ziqi Ye
### date: 2021-4-12
### 
### (1) generate complete data
### (2) generate imputed data
### input: jointdataB.c22.csv
### output: datasets ready for analysis 

install.packages("missForest")
install.packages("mice")
library(readr)
library(missForest)
library(mice)

DataB <- read_csv("/Users/ziqiye/Desktop/BIOS841/Project1/data/jointdataB.c22.csv")

colSums(is.na(DataB))
# missing values in stable_3months(3), stable_condoms_3months(3), casual_3months(1), casual_condoms_3months(1)
DataB_complete <- DataB[ , colSums(is.na(DataB)) == 0]

#Generate 10% missing values at Random
DataB.mis <- prodNA(DataB, noNA = 0.1)

#Check missing values introduced in the data
summary(DataB.mis)

# factor variables
# not sure with variable freq_discuss, is this one ordinal variable?
factor_varB <- c("stable_3months","stable_condoms_3months","casual_3months",
                 "casual_condoms_3months","women_3months","arm","marital_status", 
                 "education_level","monthly_income","sex_orientation")

#remove continuous variables
DataB.mis <- DataB.mis[,factor_varB]
summary(DataB.mis)

imputed_Data <- mice(DataB.mis, m=5, maxit = 50, method = 'polyreg', seed = 500)
summary(imputed_Data)

### C11_Check_Variable_Class.R
### Check factors as factors, numbers as numbers
### author: Zhentao Yu, Minxin Lu
### date: 2021-3-22
### input: C01_ReadData.R
### output: a new dataset with variables in the correct class

library(dplyr)
source("C01_ReadData.R")
##### Baseline 309 data #####

# date variables
date_varB <-"B"
# binary variables\
binary_varB <- c("D","E","G","l","M.A","M.B","M.C","M.D","M.E",
                 "M.F","M.N","R","W","Z","AC","AE.A","AE.B",
                 "AE.C","AE.D","AE.E","AE.F","AE.G",
                 "AJ.A","AJ.B","AJ.C","AJ.D","AJ.E","AJ.F","AJ.G",
                 "AP","AQ.A","AQ.B","AQ.C","AQ.D","AQ.E","AQ.F","AT",
                 "AU","BA","BB.A","BB.B","BB.C","BB.D","BB.E","BB.F","BE",
                 "BF","BL","BM.A","BM.B","BM.C","BM.D","BM.E","BM.F","BP",
                 "BQ","BR","BW.A","BW.B","BW.C","BW.D","BW.E","BW.F","BZ",
                 "CA","CF.A","CF.B","CF.C","CF.D","CF.E","CF.F","CI",
                 "CJ","CO.A","CO.B","CO.C","CO.D","CO.E","CO.F","CR",
                 "CS","CY","CZ")
# factor variables
factor_varB <- c("F","H","K","P","AH","AL","AM","AN",
                 "AW","AX","AY",  "BH","BI","BJ",  "BT","BU","BV",
                 "CC","CD","CE","CL","CM","CN",
                 "CT","CU","CW","DA","DB")
#ordinal variables
ordinal_varB <- c("I","J","Q","T","V","X","Y","AB","AD","AF","AG","AI",
                  "AO","AR","AS","AZ","BC","BD","BK","BN","BO","BX","BY","CG","CH",
                  "CP","CQ","CV")
#unrelated variables 
tobedeleted_varB <- c("AK","AV","BG","BS","CB","CK")#initial name of people who index usually hang out with
                      
#continous variables
cont_varB <- setdiff(colnames(DataB),c(date_varB,binary_varB,factor_varB,ordinal_varB,tobedeleted_varB))


# factors and ordinals as factors
dataB.c14 <-DataB
dataB.c14[factor_varB] = lapply(dataB.c14[factor_varB],factor)
dataB.c14[ordinal_varB] = lapply(dataB.c14[ordinal_varB],factor)

# contiunous variable ONLY S and U are missclassified as factor variables
dataB.c14$S <- as.numeric(dataB.c14$S)
dataB.c14$U <- as.numeric(dataB.c14$U)

# remove the initial names of closest people
dataB.c14 <- dataB.c14[ , -which(names(dataB.c14) %in% tobedeleted_varB)]
DataB <- dataB.c14

##### Survey 207 data #####

# date variables
date_varB <- c('A')

# binary variables
binary_varB <- c('E','F','G','H','I','O','P','Q','R','S','Y','Z',
                 'AA','AB','AC','AD','AE','AF','AG','AH','AI','AJ','AK','AL','AM',
                 'AN','AO','AP','AQ','AR','AS','AV','AZ','BD','BI')

# factor variables
factor_varB <- c('J','K','L','M','N','T','U','V','W','X','AW','AX','AY',
                 'BB','BN')

#ordinal variables
ordinal_varB <- c('BC','BF','BH','BJ','BK','BM')

#unrelated variables 
unrelated_varB <- c('B','AT')

#continous variables
cont_varB <- setdiff(colnames(DataS),c(date_varB,binary_varB,factor_varB,ordinal_varB,unrelated_varB))


# factors and ordinals as factors; continuous variables as numerical 
DataS[factor_varB] <- as.factor(DataS[factor_varB])
DataS[ordinal_varB] <- as.factor(DataS[ordinal_varB])
DataS[cont_varB] <- as.numeric(DataS[cont_varB])

##### Alter 269 data #####

# date variables
date_varB <- c('C')

# binary variables
binary_varB <- c('L','O','Q','U','Z',
                 'AC','AD','AE','AF','AG','AH','AI','AM','AP','AQ','AR','AS',
                 'BH','BL','BM','BS','BW','BX',
                 'CD','CH','CI','CJ','CR','CS',
                 'DA','DB','DJ')

# factor variables
factor_varB <- c('B','D','J','M','N','S',
                 'AJ','AL','AN','AO','AT','AU','AV','AW',
                 'BB','BD','BE','BF','BI','BO','BP','BQ','BT','BZ',
                 'CA','CB','CE','CL','CM','CN','CO','CU','CV','CW','CX',
                 'DD','DE','DF','DG','DK','DL')

#ordinal variables
ordinal_varB <- c('W','T','Y',
                  'AB','AK','AY',
                  'BA','BG','BJ','BK','BR','BU','BV',
                  'CC','CF','CG','CP','CQ','CY','CZ',
                  'DH','DI','DM','DN')

#unrelated variables 
unrelated_varB <- c('P',
                    'BC','BN','BY',
                    'CK','CT',
                    'DC')

#continous variables
cont_varB <- setdiff(colnames(DataA),c(date_varB,binary_varB,factor_varB,ordinal_varB,unrelated_varB))


# factors and ordinals as factors; continuous variables as numerical 
DataA[factor_varB] <- as.factor(DataA[factor_varB])
DataA[ordinal_varB] <- as.factor(DataA[ordinal_varB])
DataA[cont_varB] <- as.numeric(DataA[cont_varB])

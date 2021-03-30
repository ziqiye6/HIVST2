###  C12_Variables_Summary.R
###  descriptive statistics for baseline 309 data
###  author: Ziqi Ye
###  date: 2021-3-29
###  input: C01_ReadData.R, C11_Check_Variable_Class.R 
###  output: summary table

library(dplyr)
library(gtsummary)
source("C11_Check_Variable_Class.R")

##### Baseline 309 data #####
str(DataB)
summary(DataB)

binary_summary1 <- DataB %>% select(D, E, G, L, M.A, M.B, M.C, M.D, M.E,
                           M.F, R, W, Z, AC, AE.A, AE.B,
                           AE.C, AE.D, AE.E, AE.F, AE.G,
                           AJ.A, AJ.B, AJ.C, AJ.D, AJ.E, AJ.F, AJ.G)
binary_summary2 <- DataB %>% select(AP, AQ.A, AQ.B, AQ.C, AQ.D, AQ.E, AQ.F, AT,
                                    AU, BA, BB.A, BB.B, BB.C, BB.D, BB.E, BB.F, BE,
                                    BF, BL, BM.A, BM.B, BM.C, BM.D, BM.E, BM.F, BP,
                                    BQ, BR)
binary_summary3 <- DataB %>% select(BW.A, BW.B, BW.C, BW.D, BW.E, BW.F, BZ,
                                    CA, CF.A, CF.B, CF.C, CF.D, CF.E, CF.F, CI,
                                    CJ, CO.A, CO.B, CO.C, CO.D, CO.E, CO.F, CR,
                                    CS, CY, CZ)

binary_summary1 %>% tbl_summary()
binary_summary2 %>% tbl_summary()
binary_summary3 %>% tbl_summary()

factor_summary <- DataB %>% select(F, H, K, P, AH, AL, AM, AN,
                                   AW, AX, AY,  BH, BI, BJ,  BT, BU, BV,
                                   CC, CD, CE, CL, CM, CN,
                                   CT, CU, CW, DA, DB)

factor_summary %>% tbl_summary()

ordinal_summary <- DataB %>% select(I, J, Q, T, V, X, Y, AB, AD, AF,
                                    AG, AI, AO, AR, AS, AZ, BC, BD,
                                    BK, BN, BO, BX, BY, CG, CH,
                                    CP, CQ, CV)

ordinal_summary %>% tbl_summary()

boxplot(DataB$A, main="A: deposit supposed to pay")
boxplot(DataB$O, main="O: In the last 3 months, with how many men have you had anal sexual intercourse?")
boxplot(DataB$S, main="S: In the last 3 months, how many stable male partners did you have?")
boxplot(DataB$U, main="U: In the last 3 months, how many casual male partners did you have?")
boxplot(DataB$AA, main="AA: With how many different women did you have sex in the last 3 months?")
boxplot(DataB$CX, main="CX: How many self test kits do you want to request this time?")
boxplot(DataB$DD, main="DD: Number of actual kits distribution ")

boxplot.stats(DataB$O)
boxplot.stats(DataB$S)
boxplot.stats(DataB$U)
boxplot.stats(DataB$AA)
boxplot.stats(DataB$DD)


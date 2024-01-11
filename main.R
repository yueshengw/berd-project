## Table 1 Charateristics/Trement Group Breakdown
  # Init
clinical_data <- read.csv("~/Downloads/berd/project/Clinical.csv")
# install.packages("glue")
 library(glue)
  # Creating subsets
bCPM <- subset(clinical_data, nrx == 3)
control <- subset(clinical_data, nrx == 1)
bC <- subset(clinical_data, nrx == 2)
num_of_each <- c(nrow(bCPM), nrow(control), nrow(bC))
  # Number of patients
num_of_patients <- c(nrow(bCPM), nrow(control), nrow(bC))
num_of_patients
  # Age, years
age_median <- c(round(median(bCPM$agex)), round(median(control$agex)), round(median(bC$agex)))
age_range <- c(glue('{min}-{max}', min = round(min(bCPM$agex)), max = round(max(bCPM$agex))),
               glue('{min}-{max}', min = round(min(control$agex)), max = round(max(control$agex))),
               glue('{min}-{max}', min = round(min(bC$agex)), max = round(max(bC$agex))))
  # Race
bCPM_NHW <- nrow(subset(bCPM, racegrp == 1))
bCPM_A <- nrow(subset(bCPM, racegrp == 2))
bCPM_NHB <- nrow(subset(bCPM, racegrp == 3))
bCPM_H <- nrow(subset(bCPM, racegrp == 4))
bCPM_Other <- nrow(subset(bCPM, racegrp == 5))

control_NHW <- nrow(subset(control, racegrp == 1))
control_A <- nrow(subset(control, racegrp == 2))
control_NHB <- nrow(subset(control, racegrp == 3))
control_H <- nrow(subset(control, racegrp == 4))
control_Other <- nrow(subset(control, racegrp == 5))

bC_NHW <- nrow(subset(bC, racegrp == 1))
bC_A <- nrow(subset(bC, racegrp == 2))
bC_NHB <- nrow(subset(bC, racegrp == 3))
bC_H <- nrow(subset(bC, racegrp == 4))
bC_Other <- nrow(subset(bC, racegrp == 5))

Race_NHW <- c(glue('{count} ({percentage})', count = bCPM_NHW, percentage = format(round(bCPM_NHW / nrow(bCPM) * 100, 1), nsmall = 1)),
              glue('{count} ({percentage})', count = control_NHW, percentage = format(round(control_NHW / nrow(control) * 100, 1), nsmall = 1)),
              glue('{count} ({percentage})', count = bC_NHW, percentage = format(round(bC_NHW / nrow(bC) * 100, 1), nsmall = 1)))

Race_A <- c(glue('{count} ({percentage})', count = bCPM_A, percentage = format(round(bCPM_A / nrow(bCPM) * 100, 1), nsmall = 1)),
              glue('{count} ({percentage})', count = control_A, percentage = format(round(control_A / nrow(control) * 100, 1), nsmall = 1)),
              glue('{count} ({percentage})', count = bC_A, percentage = format(round(bC_A / nrow(bC) * 100, 1), nsmall = 1)))

Race_NHB <- c(glue('{count} ({percentage})', count = bCPM_NHB, percentage = format(round(bCPM_NHB / nrow(bCPM) * 100, 1), nsmall = 1)),
              glue('{count} ({percentage})', count = control_NHB, percentage = format(round(control_NHB / nrow(control) * 100, 1), nsmall = 1)),
              glue('{count} ({percentage})', count = bC_NHB, percentage = format(round(bC_NHB / nrow(bC) * 100, 1), nsmall = 1)))

Race_H <- c(glue('{count} ({percentage})', count = bCPM_H, percentage = format(round(bCPM_H / nrow(bCPM) * 100, 1), nsmall = 1)),
              glue('{count} ({percentage})', count = control_H, percentage = format(round(control_H / nrow(control) * 100, 1), nsmall = 1)),
              glue('{count} ({percentage})', count = bC_H, percentage = format(round(bC_H / nrow(bC) * 100, 1), nsmall = 1)))

Race_Other <- c(glue('{count} ({percentage})', count = bCPM_Other, percentage = format(round(bCPM_Other / nrow(bCPM) * 100, 1), nsmall = 1)),
              glue('{count} ({percentage})', count = control_Other, percentage = format(round(control_Other / nrow(control) * 100, 1), nsmall = 1)),
              glue('{count} ({percentage})', count = bC_Other, percentage = format(round(bC_Other / nrow(bC) * 100, 1), nsmall = 1)))              

# GOG Performance Status (Uses different method for serializing the data)
# Slightly different result compared to manual (Check later)
GOG_P_S_0_count <- c(nrow(subset(bCPM, GOGps == 0)), nrow(subset(control, GOGps == 0)), nrow(subset(bC, GOGps == 0)))
GOG_P_S_1_count <- c(nrow(subset(bCPM, GOGps == 1)), nrow(subset(control, GOGps == 1)), nrow(subset(bC, GOGps == 1)))
GOG_P_S_2_count <- c(nrow(subset(bCPM, GOGps == 2)), nrow(subset(control, GOGps == 2)), nrow(subset(bC, GOGps == 2)))

GOG_P_S_0_percentage <- format(round((GOG_P_S_0_count / num_of_each) * 100, 1), nsmall = 1)
GOG_P_S_1_percentage <- format(round((GOG_P_S_1_count / num_of_each) * 100, 1), nsmall = 1)
GOG_P_S_2_percentage <- format(round((GOG_P_S_2_count / num_of_each) * 100, 1), nsmall = 1)

GOG_P_S_0 <- c(glue("{GOG_P_S_0_count[1]} ({GOG_P_S_0_percentage[1]})"),
               glue("{GOG_P_S_0_count[2]} ({GOG_P_S_0_percentage[2]})"),
               glue("{GOG_P_S_0_count[3]} ({GOG_P_S_0_percentage[3]})"))
GOG_P_S_0
GOG_P_S_1 <- c(glue("{GOG_P_S_1_count[1]} ({GOG_P_S_1_percentage[1]})"),
               glue("{GOG_P_S_1_count[2]} ({GOG_P_S_1_percentage[2]})"),
               glue("{GOG_P_S_1_count[3]} ({GOG_P_S_1_percentage[3]})"))
GOG_P_S_1
GOG_P_S_2 <- c(glue("{GOG_P_S_2_count[1]} ({GOG_P_S_2_percentage[1]})"),
               glue("{GOG_P_S_2_count[2]} ({GOG_P_S_2_percentage[2]})"),
               glue("{GOG_P_S_2_count[3]} ({GOG_P_S_2_percentage[3]})"))
GOG_P_S_2

# FIGO Stage/Debulking Status
FIGO_3_O_count <- c(nrow(subset(bCPM, sizcat == 2)), nrow(subset(control, sizcat == 2)), nrow(subset(bC, sizcat == 2)))
FIGO_3_SO_count <- c(nrow(subset(bCPM, sizcat == 3)), nrow(subset(control, sizcat == 3)), nrow(subset(bC, sizcat == 3)))
FIGO_4_count <- c(nrow(subset(bCPM, sizcat == 4)), nrow(subset(control, sizcat == 4)), nrow(subset(bC, sizcat == 4)))

FIGO_3_O_percentage <- format(round((FIGO_3_O_count / num_of_each) * 100, 1), nsmall = 1)
FIGO_3_SO_percentage <- format(round((FIGO_3_SO_count / num_of_each) * 100, 1), nsmall = 1)
FIGO_4_percentage <- format(round((FIGO_4_count / num_of_each) * 100, 1), nsmall = 1)

FIGO_3_O <- c(glue("{FIGO_3_O_count[1]} ({FIGO_3_O_percentage[1]})"),
               glue("{FIGO_3_O_count[2]} ({FIGO_3_O_percentage[2]})"),
               glue("{FIGO_3_O_count[3]} ({FIGO_3_O_percentage[3]})"))
FIGO_3_O
FIGO_3_SO <- c(glue("{FIGO_3_SO_count[1]} ({FIGO_3_SO_percentage[1]})"),
               glue("{FIGO_3_SO_count[2]} ({FIGO_3_SO_percentage[2]})"),
               glue("{FIGO_3_SO_count[3]} ({FIGO_3_SO_percentage[3]})"))
FIGO_3_SO
FIGO_4 <- c(glue("{FIGO_4_count[1]} ({FIGO_4_percentage[1]})"),
               glue("{FIGO_4_count[2]} ({FIGO_4_percentage[2]})"),
               glue("{FIGO_4_count[3]} ({FIGO_4_percentage[3]})"))
FIGO_4

# Ascites
Ascites_Y_count <- c(nrow(subset(bCPM, asccat == 1)), nrow(subset(control, asccat == 1)), nrow(subset(bC, asccat == 1)))
Ascites_N_count <- c(nrow(subset(bCPM, asccat == 2)), nrow(subset(control, asccat == 2)), nrow(subset(bC, asccat == 2)))
Ascites_Unknown_count <- c(nrow(subset(bCPM, asccat == 9)), nrow(subset(control, asccat == 9)), nrow(subset(bC, asccat == 9)))

Ascites_Y_percentage <- format(round((Ascites_Y_count / num_of_each) * 100, 1), nsmall = 1)
Ascites_N_percentage <- format(round((Ascites_N_count / num_of_each) * 100, 1), nsmall = 1)
Ascites_Unknown_percentage <- format(round((Ascites_Unknown_count / num_of_each) * 100, 1), nsmall = 1)

Ascites_Y <- c(glue("{Ascites_Y_count[1]} ({Ascites_Y_percentage[1]})"),
               glue("{Ascites_Y_count[2]} ({Ascites_Y_percentage[2]})"),
               glue("{Ascites_Y_count[3]} ({Ascites_Y_percentage[3]})"))
Ascites_Y
Ascites_N <- c(glue("{Ascites_N_count[1]} ({Ascites_N_percentage[1]})"),
               glue("{Ascites_N_count[2]} ({Ascites_N_percentage[2]})"),
               glue("{Ascites_N_count[3]} ({Ascites_N_percentage[3]})"))
Ascites_N
Ascites_Unknown <- c(glue("{Ascites_Unknown_count[1]} ({Ascites_Unknown_percentage[1]})"),
                     glue("{Ascites_Unknown_count[2]} ({Ascites_Unknown_percentage[2]})"),
                     glue("{Ascites_Unknown_count[3]} ({Ascites_Unknown_percentage[3]})"))
Ascites_Unknown
# Tumor Histology
Tumor_Histology_S_count <- c(nrow(subset(bCPM, ct == 1)), nrow(subset(control, ct == 1)), nrow(subset(bC, ct == 1)))
Tumor_Histology_E_count <- c(nrow(subset(bCPM, ct == 2)), nrow(subset(control, ct == 2)), nrow(subset(bC, ct == 2)))
Tumor_Histology_CC_count <- c(nrow(subset(bCPM, ct == 3)), nrow(subset(control, ct == 3)), nrow(subset(bC, ct == 3)))
Tumor_Histology_M_count <- c(nrow(subset(bCPM, ct == 4)), nrow(subset(control, ct == 4)), nrow(subset(bC, ct == 4)))
Tumor_Histology_Other_count <- c(nrow(subset(bCPM, ct == 5)), nrow(subset(control, ct == 5)), nrow(subset(bC, ct == 5)))

Tumor_Histology_S_percentage <- format(round((Tumor_Histology_S_count / num_of_each) * 100, 1), nsmall = 1)
Tumor_Histology_E_percentage <- format(round((Tumor_Histology_E_count / num_of_each) * 100, 1), nsmall = 1)
Tumor_Histology_CC_percentage <- format(round((Tumor_Histology_CC_count / num_of_each) * 100, 1), nsmall = 1)
Tumor_Histology_M_percentage <- format(round((Tumor_Histology_M_count / num_of_each) * 100, 1), nsmall = 1)
Tumor_Histology_Other_percentage <- format(round((Tumor_Histology_Other_count / num_of_each) * 100, 1), nsmall = 1, trim = T) # Work around: Not sure where the extra space is coming from

Tumor_Histology_S <- c(glue("{Tumor_Histology_S_count[1]} ({Tumor_Histology_S_percentage[1]})"),
              glue("{Tumor_Histology_S_count[2]} ({Tumor_Histology_S_percentage[2]})"),
              glue("{Tumor_Histology_S_count[3]} ({Tumor_Histology_S_percentage[3]})"))
Tumor_Histology_S
Tumor_Histology_E <- c(glue("{Tumor_Histology_E_count[1]} ({Tumor_Histology_E_percentage[1]})"),
               glue("{Tumor_Histology_E_count[2]} ({Tumor_Histology_E_percentage[2]})"),
               glue("{Tumor_Histology_E_count[3]} ({Tumor_Histology_E_percentage[3]})"))
Tumor_Histology_E
Tumor_Histology_CC <- c(glue("{Tumor_Histology_CC_count[1]} ({Tumor_Histology_CC_percentage[1]})"),
            glue("{Tumor_Histology_CC_count[2]} ({Tumor_Histology_CC_percentage[2]})"),
            glue("{Tumor_Histology_CC_count[3]} ({Tumor_Histology_CC_percentage[3]})"))
Tumor_Histology_CC
Tumor_Histology_M <- c(glue("{Tumor_Histology_M_count[1]} ({Tumor_Histology_M_percentage[1]})"),
            glue("{Tumor_Histology_M_count[2]} ({Tumor_Histology_M_percentage[2]})"),
            glue("{Tumor_Histology_M_count[3]} ({Tumor_Histology_M_percentage[3]})"))
Tumor_Histology_M
Tumor_Histology_Other <- c(glue("{Tumor_Histology_Other_count[1]} ({Tumor_Histology_Other_percentage[1]})"),
            glue("{Tumor_Histology_Other_count[2]} ({Tumor_Histology_Other_percentage[2]})"),
            glue("{Tumor_Histology_Other_count[3]} ({Tumor_Histology_Other_percentage[3]})"))
Tumor_Histology_Other

# Tumor Grade
Tumor_Grade_P_count <- c(nrow(subset(bCPM, path == 3)), nrow(subset(control, path == 3)), nrow(subset(bC, path == 3)))
Tumor_Grade_M_count <- c(nrow(subset(bCPM, path == 2)), nrow(subset(control, path == 2)), nrow(subset(bC, path == 2)))
Tumor_Grade_W_count <- c(nrow(subset(bCPM, path == 1)), nrow(subset(control, path == 1)), nrow(subset(bC, path == 1)))
Tumor_Grade_N_count <- c(nrow(subset(bCPM, path == 'N')), nrow(subset(control, path == 'N')), nrow(subset(bC, path == 'N')))

Tumor_Grade_P_percentage <- format(round((Tumor_Grade_P_count / num_of_each) * 100, 1), nsmall = 1)
Tumor_Grade_M_percentage <- format(round((Tumor_Grade_M_count / num_of_each) * 100, 1), nsmall = 1)
Tumor_Grade_W_percentage <- format(round((Tumor_Grade_W_count / num_of_each) * 100, 1), nsmall = 1)
Tumor_Grade_N_percentage <- format(round((Tumor_Grade_N_count / num_of_each) * 100, 1), nsmall = 1)

Tumor_Grade_P <- c(glue("{Tumor_Grade_P_count[1]} ({Tumor_Grade_P_percentage[1]})"),
               glue("{Tumor_Grade_P_count[2]} ({Tumor_Grade_P_percentage[2]})"),
               glue("{Tumor_Grade_P_count[3]} ({Tumor_Grade_P_percentage[3]})"))
Tumor_Grade_P
Tumor_Grade_M <- c(glue("{Tumor_Grade_M_count[1]} ({Tumor_Grade_M_percentage[1]})"),
               glue("{Tumor_Grade_M_count[2]} ({Tumor_Grade_M_percentage[2]})"),
               glue("{Tumor_Grade_M_count[3]} ({Tumor_Grade_M_percentage[3]})"))
Tumor_Grade_M
Tumor_Grade_W <- c(glue("{Tumor_Grade_W_count[1]} ({Tumor_Grade_W_percentage[1]})"),
                     glue("{Tumor_Grade_W_count[2]} ({Tumor_Grade_W_percentage[2]})"),
                     glue("{Tumor_Grade_W_count[3]} ({Tumor_Grade_W_percentage[3]})"))
Tumor_Grade_W
Tumor_Grade_N <- c(glue("{Tumor_Grade_N_count[1]} ({Tumor_Grade_N_percentage[1]})"),
                     glue("{Tumor_Grade_N_count[2]} ({Tumor_Grade_N_percentage[2]})"),
                     glue("{Tumor_Grade_N_count[3]} ({Tumor_Grade_N_percentage[3]})"))
Tumor_Grade_N

# Mutation (No UKNWN)
Mutation_B1_count <- c(nrow(subset(bCPM, mutgroup == "B1")), nrow(subset(control, mutgroup == "B1")), nrow(subset(bC, mutgroup == "B1")))
Mutation_B2_count <- c(nrow(subset(bCPM, mutgroup == "B2")), nrow(subset(control, mutgroup == "B2")), nrow(subset(bC, mutgroup == "B2")))
Mutation_HRR_count <- c(nrow(subset(bCPM, mutgroup == "Other")), nrow(subset(control, mutgroup == "Other")), nrow(subset(bC, mutgroup == "Other")))
Mutation_Other_count <- c(nrow(subset(bCPM, mutgroup == "WT")), nrow(subset(control, mutgroup == "WT")), nrow(subset(bC, mutgroup == "WT")))

Mutation_B1_percentage <- format(round((Mutation_B1_count / (Mutation_B1_count + Mutation_B2_count + Mutation_HRR_count + Mutation_Other_count)) * 100, 1), nsmall = 1)
Mutation_B2_percentage <- format(round((Mutation_B2_count / (Mutation_B1_count + Mutation_B2_count + Mutation_HRR_count + Mutation_Other_count)) * 100, 1), nsmall = 1)
Mutation_HRR_percentage <- format(round((Mutation_HRR_count / (Mutation_B1_count + Mutation_B2_count + Mutation_HRR_count + Mutation_Other_count)) * 100, 1), nsmall = 1)
Mutation_Other_percentage <- format(round((Mutation_Other_count / (Mutation_B1_count + Mutation_B2_count + Mutation_HRR_count + Mutation_Other_count)) * 100, 1), nsmall = 1)

Mutation_B1 <- c(glue("{Mutation_B1_count[1]} ({Mutation_B1_percentage[1]})"),
               glue("{Mutation_B1_count[2]} ({Mutation_B1_percentage[2]})"),
               glue("{Mutation_B1_count[3]} ({Mutation_B1_percentage[3]})"))
Mutation_B1
Mutation_B2 <- c(glue("{Mutation_B2_count[1]} ({Mutation_B2_percentage[1]})"),
               glue("{Mutation_B2_count[2]} ({Mutation_B2_percentage[2]})"),
               glue("{Mutation_B2_count[3]} ({Mutation_B2_percentage[3]})"))
Mutation_B2
Mutation_HRR <- c(glue("{Mutation_HRR_count[1]} ({Mutation_HRR_percentage[1]})"),
                     glue("{Mutation_HRR_count[2]} ({Mutation_HRR_percentage[2]})"),
                     glue("{Mutation_HRR_count[3]} ({Mutation_HRR_percentage[3]})"))
Mutation_HRR
Mutation_Other <- c(glue("{Mutation_Other_count[1]} ({Mutation_Other_percentage[1]})"),
                     glue("{Mutation_Other_count[2]} ({Mutation_Other_percentage[2]})"),
                     glue("{Mutation_Other_count[3]} ({Mutation_Other_percentage[3]})"))
Mutation_Other

# CD31
CD31_LE_Median_count <- c(nrow(subset(bCPM, cd31_median == "0")), nrow(subset(control, cd31_median == "0")), nrow(subset(bC, cd31_median == "0")))
CD31_M_Median_count <- c(nrow(subset(bCPM, cd31_median == "1")), nrow(subset(control, cd31_median == "1")), nrow(subset(bC, cd31_median == "1")))

CD31_LE_Median_percentage <- format(round((CD31_LE_Median_count / (CD31_LE_Median_count + CD31_M_Median_count)) * 100, 1), nsmall = 1)
CD31_M_Median_percentage <- format(round((CD31_M_Median_count / (CD31_LE_Median_count + CD31_M_Median_count)) * 100, 1), nsmall = 1)
Mutation_HRR_percentage <- format(round((Mutation_HRR_count / (CD31_LE_Median_count + CD31_M_Median_count)) * 100, 1), nsmall = 1)
Mutation_Other_percentage <- format(round((Mutation_Other_count / (CD31_LE_Median_count + CD31_M_Median_count)) * 100, 1), nsmall = 1)

CD31_LE_Median <- c(glue("{CD31_LE_Median_count[1]} ({CD31_LE_Median_percentage[1]})"),
               glue("{CD31_LE_Median_count[2]} ({CD31_LE_Median_percentage[2]})"),
               glue("{CD31_LE_Median_count[3]} ({CD31_LE_Median_percentage[3]})"))
CD31_LE_Median
CD31_M_Median <- c(glue("{CD31_M_Median_count[1]} ({CD31_M_Median_percentage[1]})"),
               glue("{CD31_M_Median_count[2]} ({CD31_M_Median_percentage[2]})"),
               glue("{CD31_M_Median_count[3]} ({CD31_M_Median_percentage[3]})"))
CD31_M_Median

# Creating table
table_data <- data.frame(
  Characteristics = c("Number of Patients", "Age (Median)", "Age (Range)", 
                      "Race NHW", "Race A", "Race NHB", "Race H", "Race Other", 
                      "GOG Performance Status 0", "GOG Performance Status 1", 
                      "GOG Performance Status 2", "FIGO Stage 3 O", 
                      "FIGO Stage 3 SO", "FIGO Stage 4", "Ascites Yes", 
                      "Ascites No", "Ascites Unknown", "Tumor Histology Serous", 
                      "Tumor Histology Endometrioid", "Tumor Histology Clear Cell", 
                      "Tumor Histology Mucinous", "Tumor Histology Other", 
                      "Tumor Grade Poorly Differentiated", 
                      "Tumor Grade Moderately Differentiated", 
                      "Tumor Grade Well Differentiated", "Tumor Grade Not Reported", 
                      "Mutation BRCA1", "Mutation BRCA2", "Mutation HRR", 
                      "Mutation Other", "CD31 <= Median", "CD31 > Median"),
  
  `Bevacizumab-Concurrent Plus Maintenance` = c(num_of_patients[1], 
                                                age_median[1], age_range[1],
                                                Race_NHW[1], Race_A[1], Race_NHB[1], 
                                                Race_H[1], Race_Other[1],
                                                GOG_P_S_0[1], GOG_P_S_1[1], GOG_P_S_2[1],
                                                FIGO_3_O[1], FIGO_3_SO[1], FIGO_4[1],
                                                Ascites_Y[1], Ascites_N[1], Ascites_Unknown[1],
                                                Tumor_Histology_S[1], Tumor_Histology_E[1], 
                                                Tumor_Histology_CC[1], Tumor_Histology_M[1], 
                                                Tumor_Histology_Other[1], 
                                                Tumor_Grade_P[1], Tumor_Grade_M[1], 
                                                Tumor_Grade_W[1], Tumor_Grade_N[1], 
                                                Mutation_B1[1], Mutation_B2[1], 
                                                Mutation_HRR[1], Mutation_Other[1],
                                                CD31_LE_Median[1], CD31_M_Median[1]),
  
  Control = c(num_of_patients[2], 
              age_median[2], age_range[2],
              Race_NHW[2], Race_A[2], Race_NHB[2], 
              Race_H[2], Race_Other[2],
              GOG_P_S_0[2], GOG_P_S_1[2], GOG_P_S_2[2],
              FIGO_3_O[2], FIGO_3_SO[2], FIGO_4[2],
              Ascites_Y[2], Ascites_N[2], Ascites_Unknown[2],
              Tumor_Histology_S[2], Tumor_Histology_E[2], 
              Tumor_Histology_CC[2], Tumor_Histology_M[2], 
              Tumor_Histology_Other[2], 
              Tumor_Grade_P[2], Tumor_Grade_M[2], 
              Tumor_Grade_W[2], Tumor_Grade_N[2], 
              Mutation_B1[2], Mutation_B2[2], 
              Mutation_HRR[2], Mutation_Other[2],
              CD31_LE_Median[2], CD31_M_Median[2]),
  
  `Bevacizumab-Concurrent` = c(num_of_patients[3], 
                               age_median[3], age_range[3],
                               Race_NHW[3], Race_A[3], Race_NHB[3], 
                               Race_H[3], Race_Other[3],
                               GOG_P_S_0[3], GOG_P_S_1[3], GOG_P_S_2[3],
                               FIGO_3_O[3], FIGO_3_SO[3], FIGO_4[3],
                               Ascites_Y[3], Ascites_N[3], Ascites_Unknown[3],
                               Tumor_Histology_S[3], Tumor_Histology_E[3], 
                               Tumor_Histology_CC[3], Tumor_Histology_M[3], 
                               Tumor_Histology_Other[3], 
                               Tumor_Grade_P[3], Tumor_Grade_M[3], 
                               Tumor_Grade_W[3], Tumor_Grade_N[3], 
                               Mutation_B1[3], Mutation_B2[3], 
                               Mutation_HRR[3], Mutation_Other[3],
                               CD31_LE_Median[3], CD31_M_Median[3])
)

print(table_data)


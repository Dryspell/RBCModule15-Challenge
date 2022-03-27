library(dplyr)

mechaCar_mpg <- read.csv("MechaCar_mpg.csv")
linRegMPG <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,mechaCar_mpg)
summary(linRegMPG)

suspension_coils <- read.csv("Suspension_Coil.csv")
suspensionSummary <- suspension_coils %>% summarize(Mean_PSI = mean(PSI), Median_PSI = median(PSI), Variance_PSI = var(PSI), SD_PSI = sd(PSI))
write.table(suspensionSummary, file = "suspension_total_summary.csv", sep = "\t", row.names = F)

lot_summary <- suspension_coils %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI = mean(PSI), Median_PSI = median(PSI), Variance_PSI = var(PSI), SD_PSI = sd(PSI), .groups = "keep")
write.table(lot_summary, file = "suspension_lot_summary.csv", sep = "\t", row.names = F)

# t-test on full dataset
t.test(log10(suspension_coils$PSI) %>% sample(50), mu=mean(log10(suspension_coils$PSI)))

# t-tests on individual lots
t.test(log10(suspension_coils$PSI) %>% sample(50), 
       mu=mean(log10(suspension_coils$PSI)),
       subset = suspension_coils$Manufacturing_Lot == "Lot1")
t.test(log10(suspension_coils$PSI) %>% sample(50),
       mu=mean(log10(suspension_coils$PSI)),
       subset = suspension_coils$Manufacturing_Lot == "Lot2")
t.test(log10(suspension_coils$PSI) %>% sample(50),
       mu=mean(log10(suspension_coils$PSI)),
       subset = suspension_coils$Manufacturing_Lot == "Lot3")


# CLEAN UP #################################################
# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)

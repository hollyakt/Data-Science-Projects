# Load necessary libraries
install.packages(c("tidyverse", "ggplot2", "survival", "survminer"))
library(tidyverse)
library(ggplot2)
library(survival)
library(survminer)

# Loading Dataset
lung_cancer <- read.csv("/Users/holly/Desktop/PUBH 3242/lung_cancer_data.csv")

# Convert necessary variables to factors
lung_cancer <- lung_cancer %>%
  mutate(
    Treatment_Type = factor(Treatment_Type),
    Stage_of_Cancer = factor(Stage_of_Cancer, levels = c("I", "II", "III", "IV")),
    Metastasis_Status = factor(Metastasis_Status, levels = c("No", "Yes")),
    Gender = factor(Gender),
    Comorbidities = factor(Comorbidities),
    Year_of_Diagnosis = as.integer(Year_of_Diagnosis)
  )

# Summary Statistics Table
summary_table <- lung_cancer %>%
  group_by(Treatment_Type) %>%
  summarise(
    Median_Age = median(Age, na.rm = TRUE),
    Median_Survival_Years = median(Survival_Years, na.rm = TRUE),
    Stage_I = sum(Stage_of_Cancer == "I", na.rm = TRUE),
    Stage_II = sum(Stage_of_Cancer == "II", na.rm = TRUE),
    Stage_III = sum(Stage_of_Cancer == "III", na.rm = TRUE),
    Stage_IV = sum(Stage_of_Cancer == "IV", na.rm = TRUE),
    Male = sum(Gender == "Male", na.rm = TRUE),
    Female = sum(Gender == "Female", na.rm = TRUE),
    Other = sum(Gender == "Other", na.rm = TRUE)
  )

print(summary_table)

# Define colors for treatment types
treatment_colors <- c("Chemotherapy" = "pink",  
                      "Radiation" = "turquoise",   
                      "Surgery" = "blue",     
                      "Palliative" = "orange")   

# Visualization 1: Treatment Trends Over Time
# Count number of patients per treatment type per year
treatment_trends <- lung_cancer %>%
  group_by(Year_of_Diagnosis, Treatment_Type) %>%
  summarise(count = n(), .groups = 'drop')

# Create stacked area chart
ggplot(treatment_trends, aes(x = Year_of_Diagnosis, y = count, fill = Treatment_Type)) +
  geom_area(alpha = 0.8) +
  scale_fill_manual(values = treatment_colors) +  # Custom colors
  labs(title = "Lung Cancer Treatment Trends Over Time",
       x = "Year of Diagnosis",
       y = "Number of Patients",
       fill = "Treatment Type") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
        legend.position = "right")


# Visualization 2: Survival by Treatment
ggplot(lung_cancer, aes(x = Treatment_Type, y = Survival_Years, fill = Treatment_Type)) +
  geom_boxplot() +
  labs(title = "Survival Years by Treatment Type", x = "Treatment Type", y = "Survival Years") +
  theme_minimal()

# Visualization 3: Temporal Survival Trends
# Survival data by year and treatment type
survival_trends <- lung_cancer %>%
  group_by(Year_of_Diagnosis, Treatment_Type) %>%
  summarise(mean_survival = mean(Survival_Years, na.rm = TRUE)) %>%
  ungroup()

# A lollipop chart
ggplot(survival_trends, aes(x = Year_of_Diagnosis, y = mean_survival, color = Treatment_Type)) +
  geom_segment(aes(x = Year_of_Diagnosis, xend = Year_of_Diagnosis, y = 0, yend = mean_survival), 
               size = 1, alpha = 0.7) +  # Vertical line
  geom_point(size = 4) +  # Circular marker
  scale_color_manual(values = treatment_colors) +  # Custom colors
  labs(title = "Temporal Survival Trends by Treatment Type",
       x = "Year of Diagnosis",
       y = "Mean Survival Years",
       color = "Treatment Type") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
        legend.position = "right")

# Kaplan-Meier Survival Analysis
surv_obj <- Surv(lung_cancer$Survival_Years, lung_cancer$Metastasis_Status == "Yes")
fit <- survfit(surv_obj ~ Treatment_Type, data = lung_cancer)

# Visualization 4: Kaplan-Meier Curve
ggsurvplot(fit, data = lung_cancer, 
           pval = TRUE, conf.int = TRUE, 
           title = "Kaplan-Meier Survival Curves by Treatment Type",
           risk.table = TRUE, legend.title = "Treatment Type")

# Regression Analysis: Cox Proportional Hazards Model
cox_model <- coxph(Surv(Survival_Years, Metastasis_Status == "Yes") ~ 
                     Treatment_Type + Age + Gender + Stage_of_Cancer, 
                   data = lung_cancer)

# Visualization 5: Forest Plot of Hazard Ratios
ggforest(cox_model, data = lung_cancer)

# Print regression results
summary(cox_model)


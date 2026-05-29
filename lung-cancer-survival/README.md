# Lung Cancer Treatment — Survival Analysis

R analysis of lung cancer outcomes by treatment type, using Kaplan-Meier survival curves and a Cox proportional hazards model.

Course: PUBH 3242, Georgetown University.

## Run

```r
# Install packages (first time only)
install.packages(c("tidyverse", "ggplot2", "survival", "survminer"))

# Then open analysis.R and update the data path at the top, or pass it via Rscript:
Rscript analysis.R /path/to/lung_cancer_data.csv
```

## Methods

- Summary statistics by treatment type
- Stacked area chart of treatment trends over time
- Boxplot of survival years by treatment
- Kaplan-Meier curves with risk table
- Cox proportional hazards model + forest plot of hazard ratios

## Data

Course-provided dataset — not redistributed here.

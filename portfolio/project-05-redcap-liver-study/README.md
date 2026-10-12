# Question

How can a liver study case report form be designed to capture labs, diagnoses, medications, and branching logic while maintaining clean data quality checks?

# Data

A synthetic REDCap-style liver study dataset with 25 patient records, covering labs, diagnoses, medications, and a quality abstraction workflow.

# Finding

The final CRF and validation rules produced a clean synthetic abstraction dataset with zero missing required fields and zero out-of-range lab measurements, demonstrating a robust QC workflow for a liver cohort study.

# Screenshot

![REDCap liver study preview](https://hollyakt.github.io/portfolio/assets/redcap-liver.png)

# Files

- `redcap_data_dictionary.csv` lists the case report form variables and validation rules.
- `synthetic_liver_chart_data.csv` contains 25 abstracted synthetic records.
- `redcap_abstraction_sop.md` documents the abstraction workflow.
- `redcap_quality_summary.R` summarizes the exported data and flags data quality issues.

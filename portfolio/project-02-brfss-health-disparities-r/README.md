# Question

Is being uninsured associated with skipping a routine checkup, and does that pattern vary by state?

# Data

BRFSS 2022 public-use survey data from the CDC Behavioral Risk Factor Surveillance System. The analysis uses the core health coverage and preventive care variables from the public XPT file and weighted survey methods.

# Finding

In the survey-weighted analysis, uninsured adults had a markedly higher probability of not having a routine checkup compared with insured adults, with the largest gaps in states like South Dakota, Vermont, and Maine.

# Screenshot

![BRFSS checkup gap preview](https://hollyakt.github.io/portfolio/assets/brfss-checkup-gap.png)

# Files

- `analysis.R`: downloads and analyzes the CDC BRFSS 2022 file using the survey package.
- `outputs/state_prevalence.csv`: state-level weighted checkup prevalence.
- `outputs/model_results.csv`: model coefficients from the survey-weighted logistic regression.
- `outputs/state_checkup_gap_plot.png`: chart of the uninsured vs insured checkup gap.

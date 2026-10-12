# Question

Which companies, states, and complaint issues drive the most debt collection complaints, and how often do companies respond within the CFPB response timeline?

# Data

The CFPB Consumer Complaint Database, filtered to the Debt collection product category. The workbook includes complaint counts, issue categories, state-level volume, and company response timeliness.

# Finding

The largest complaint volume was concentrated in a small number of large debt collectors, with the strongest complaint burden in Texas, California, and Florida; timeliness varied substantially across firms.

# Screenshot

![Debt complaint summary preview](https://hollyakt.github.io/portfolio/assets/debt-complaints.png)

# Files

- `build_excel_analysis.py` downloads the CFPB complaint archive and builds the workbook.
- `outputs/debt_collection_dashboard.xlsx` contains analysis sheets and charts.
- `outputs/response_timeline_summary.csv` stores company response timeliness by firm.

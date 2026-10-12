# Question

Which Pennsylvania hospitals have the longest ER waits, highest readmission rates, and poorest performance on CMS quality metrics?

# Data

Three CMS provider datasets were merged on facility ID: Hospital General Information, Timely and Effective Care, and Unplanned Hospital Visits. The file was filtered to Pennsylvania hospitals.

# Finding

Long ER waits and elevated readmission burden were concentrated in a small group of high-volume Pennsylvania hospitals, especially in urban and rural facilities serving complex patient populations.

# Screenshot

![Pennsylvania hospital dashboard preview](https://hollyakt.github.io/portfolio/assets/pa-hospitals.png)

# Files

- `prepare_pa_hospitals.py` creates the merged PA facility dataset.
- `queries/power_query_m.txt` contains the Power Query M that mirrors the merge logic.
- `data/pa_hospital_merge.csv` is the merged Pennsylvania file ready for Power BI.
- `outputs/pa_hospital_dashboard_preview.png` is a static preview of the dashboard concept.

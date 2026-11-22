# Crop insurance analytics

A five-part, AI-assisted YuvaIntern virtual project by Subhatit Maity. It examines a practical planning question: how much does a national crop insurance loss ratio conceal about bad years, and how should a hypothetical insurer plan for them?

The public-data analysis concerns the **U.S. federal crop insurance program**. The stress tests, policy contracts and claim notices are simulations. All amounts are nominal USD. The case study does not use customer records or claim actual business savings.

[Download the Excel analysis](analysis/insurance-analysis.xlsx) · [Data and source notes](data/SOURCES.md)

| Week | Report | Supporting evidence | Main finding |
| --- | --- | --- | --- |
| 1 | [Portfolio analysis](reports/01-portfolio.pdf) | Excel: Portfolio and Raw | The 2014–2025 pooled loss ratio was 80.2%. Payments exceeded premium in 2019 and 2022. |
| 2 | [Risk assessment](reports/02-risk.pdf) | Excel: Risk | On a hypothetical $100m premium book, the drought scenario reduces margin before expenses by $65.76m. |
| 3 | [Policy evaluation](reports/03-policy.pdf) | [Word assessment framework](reports/03-policy.docx) and Excel: Policies | In the localized yield loss, the area index pays zero while the example farm loses $30,000 in revenue. |
| 4 | [Claims simulation](reports/04-claims.pdf) | Excel: Claims and Notices, [synthetic intake](data/simulated_notices.csv) | Twelve repeat notices inflate requested dollars by $241,800. The screen refers 39 notices for review. |
| 5 | [Premium forecast](reports/05-forecast.pdf) | Excel: Forecast and Raw | Prior-year forecasting gave a $2.03bn mean absolute error across six years versus $2.82bn for a three-year average. |

## Reproduce and check

With Python 3.10+ and the packages in requirements.txt, run from the repository root:

```sh
python -m pip install -r requirements.txt
python analysis/analyze.py
python analysis/reports.py
soffice --headless --convert-to pdf --outdir reports reports/*.docx
```

The first command after setup regenerates the 372 synthetic notices with seed 493097 and writes the numerical results to analysis/results.json. The report script reads those results and draws the figures. LibreOffice converts the Word copies to PDF. The published spreadsheet works in Excel independently of the build tools. Its optional Node builder, analysis/workbook.mjs, uses @oai/artifact-tool in the Codex runtime. Run it with the repository as the working directory and the package available to Node.

To audit the analysis in Excel, trace the pooled loss ratio to the twelve historical rows on Portfolio, change a severity factor on Risk, or change the Claims review thresholds and inspect the queue count. The partial 2026 observation feeds the planning scenarios only. The 2027 range is conditional; it has no assigned coverage probability. The simulation's review flags identify notices for human investigation and carry no fraud labels.

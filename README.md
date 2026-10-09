# IEAP-Series03-RStudio

Team solution to **IEAP Series 03 — Data wrangling and ANOVA** (M1 IEAP, Université de Montpellier, course *Python, R and Git for data analysis*).

We reproduce the main result of Mottet et al. (2017, Fig. 3): movement time as a function of the index of difficulty, in patients after a stroke, age-matched controls and young controls. The report runs a full ANOVA pipeline in R (data cleaning, mixed ANOVA, regression by group, figure) and discusses why our numbers differ from the published ones.

The final report is [`IEAP-Series03-Rstudio.pdf`](IEAP-Series03-Rstudio.pdf).

## Team

| Member | GitHub account | Part of the report |
|:--|:--|:--|
| Chloé GILLES | `ChloeGil-student` | 1.1–1.3 Question, data reorganization, ANOVA; 1.7 Discussion; master document |
| Charles Sam DEEMUA | `Charles-Dee` | 1.4 Linear regression by group |
| Tuba TUBA | `tuba1079` | 1.5–1.6 Graph and PDF export |

The Git workflow, the challenges and the checklist (last sections of the report) concern the whole team.

## Structure of the repository

```
IEAP-Series03-Rstudio.qmd    master document: header, setup, list of included sections
IEAP-Series03-Rstudio.pdf    rendered report (the file uploaded to Moodle)
R/
  setup.R                    libraries, data loading and cleaning, sourced once by the master
Sections/
  01_Data-reorganisation.qmd             1.1–1.3 question, cleaning, ANOVA
  02_Linear-regression-by-group.qmd      1.4 regression by group
  03_Save-the-graph.qmd                  1.5–1.6 graph and PDF export
  04_Discussion-of-the-differences.qmd   1.7 comparison with the article
    05_GitWorkflow_Checklist.qmd           Git workflow, challenges, lessons learned, checklist
data/
  Results.txt                one row per reaching movement
figures/
  MT_as_function_of_ID.pdf   figure of section 1.5, 8 x 6 inches (written at render time)
references.bib               bibliography
LICENSE                      MIT license
```

The master document contains no analysis. Each section is a separate file, included at render time with `{{< include ... >}}`. The sections are not independent: they must be included in order, because later sections reuse objects created earlier (for example `cell_means` from section 01 and `regression_by_group` from section 02). A section file therefore cannot be rendered alone.

## How to render the report

Requirements:

- R (the report was last rendered with R 4.6.1) and RStudio, or Quarto alone
- R packages: `ez`, `tidyverse`, `here`, `knitr`, `rmarkdown`
- a LaTeX distribution for the PDF, for example TinyTeX

Steps:

1. Clone the repository.

   ```
   git clone https://github.com/ChloeGil-student/IEAP-Series03-RStudio.git
   ```

2. Open the project with `IEAP-Series03-RStudio.Rproj`. The paths use `here()`, which starts from the folder of this file.

3. Install what is missing. In the R console:

   ```r
   install.packages(c("ez", "tidyverse", "here", "knitr", "rmarkdown"))
   ```

   In the terminal:

   ```
   quarto install tinytex
   ```

4. Render the master document, with the *Render* button in RStudio or in the terminal:

   ```
   quarto render IEAP-Series03-Rstudio.qmd
   ```

The render recreates `IEAP-Series03-Rstudio.pdf` and `figures/MT_as_function_of_ID.pdf`.

## Data

`data/Results.txt` was provided on the course Moodle page for Series 03: <https://moodle.umontpellier.fr/mod/folder/view.php?id=1025707>. Columns: `GROUP`, `SUBJ`, `TRIAL`, `ORI`, `DIR`, `ID`, `REP`, `NbVelPeaks`, `MovementTime`.

The cleaning rule (removal of the incomplete conditions `ID3` and `R3`) is written once, in `R/setup.R`, and justified in section 1.3 of the report.

## Git workflow

`main` is the graded branch. Each section was written on its own branch and merged into `main` through a pull request. The report describes this workflow, including what did not go as planned, in the section *Our Git workflow*.

## Reference

Mottet, D., van Dokkum, L. E. H., Froger, J., Gouaïch, A., & Laffont, I. (2017). Trajectory formation principles are the same after mild or moderate stroke. *PLOS ONE*, 12(3), e0173674. <https://doi.org/10.1371/journal.pone.0173674>

## License

MIT, see [`LICENSE`](LICENSE).
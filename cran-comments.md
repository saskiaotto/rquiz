## Resubmission (2nd)

This is a second resubmission. Fixed remaining `\dontrun{}` in the 
`fillBlanks-shiny` example that was missed in the previous resubmission.

## Resubmission

This is a resubmission. The following changes were made as requested:

- Added reference URLs for inspiring works in the Description field.
- Added `\value` tags to all Shiny binding documentation (fillBlanks-shiny, 
  multiQuestions-shiny, singleQuestion-shiny).
- Replaced `\dontrun{}` with `if (interactive()) {}` in Shiny examples.
- Removed examples for the unexported function `convertFillBlanks2HTML()`.


## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new submission.

* The NOTE mentions possibly misspelled words: "UI" (user interface),
  "cloze" (a standard term in language testing for fill-in-the-blank
  exercises), "Abhilash", "Kirkby", "Narayan" (proper names of credited 
  authors), and on R-oldrelease also "customizable" (correct US English
  spelling). All are correct.

* The NOTE flags URLs to codepen.io as "403 Forbidden" — CodePen blocks
  automated URL checkers but the links work in a browser. These are credit
  links to the original code that inspired parts of this package.

* On R-oldrelease (4.4.3), an additional NOTE reports "Author field differs
  from that derived from Authors@R" due to how ORCID is rendered in older
  R versions. This is a known cosmetic difference and does not affect
  functionality.

## Test environments

* Local: macOS Tahoe (aarch64-apple-darwin20), R 4.5.2
* win-builder: Windows Server 2022 x64, R 4.5.3 (R-release)
* win-builder: Windows Server 2022 x64, R 4.4.3 (R-oldrelease)
* win-builder: Windows Server 2022 x64, R-devel (2026-03-25)

# Validate a single question object

Checks that a question list is correctly structured for use in
[`singleQuestion`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md).
Validates required fields, answer index bounds, and detects question
type automatically.

## Usage

``` r
checkSingleQuestion(x)
```

## Arguments

- x:

  A named list with at least the following elements:

  question

  :   A character string with the question text.

  options

  :   A character vector of answer options (min. 2).

  answer

  :   An integer vector of correct answer index/indices (1-based).
      Length \> 1 is interpreted as multiple-choice.

  tip

  :   (optional) A character string shown as a hint.

## Value

The input `x` invisibly if all checks pass.

## See also

[`singleQuestion`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md)
which calls this function internally,
[`checkMultiQuestions`](https://saskiaotto.github.io/rquiz/reference/checkMultiQuestions.md)
for validating lists of questions.

## Examples

``` r
# Single-choice question
q_sc <- list(
  question = "Which planet is closest to the Sun?",
  options  = c("Venus", "Mercury", "Mars"),
  answer   = 2L,
  tip      = "It's also the smallest planet."
)
checkSingleQuestion(q_sc)

# Multiple-choice question (auto-detected from answer length)
q_mc <- list(
  question = "Which are noble gases?",
  options  = c("Helium", "Oxygen", "Neon", "Iron"),
  answer   = c(1L, 3L)
)
checkSingleQuestion(q_mc)
```

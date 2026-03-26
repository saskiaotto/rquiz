# Validate a list of question objects

Checks that all questions in a list are correctly structured for use in
[`multiQuestions`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md).
Each question is validated via
[`checkSingleQuestion`](https://saskiaotto.github.io/rquiz/reference/checkSingleQuestion.md).
The list elements can be named (e.g. `q1`, `q2`) or unnamed — unnamed
elements are automatically assigned names `q1`, `q2`, etc.

## Usage

``` r
checkMultiQuestions(x)
```

## Arguments

- x:

  A list of question lists, each conforming to the structure described
  in
  [`checkSingleQuestion`](https://saskiaotto.github.io/rquiz/reference/checkSingleQuestion.md).

## Value

The input `x` (with names assigned if needed) invisibly if all checks
pass.

## See also

[`multiQuestions`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md)
which calls this function internally,
[`checkSingleQuestion`](https://saskiaotto.github.io/rquiz/reference/checkSingleQuestion.md)
for validating individual questions.

## Examples

``` r
questions <- list(
  q1 = list(
    question = "Which planet is closest to the Sun?",
    options  = c("Venus", "Mercury", "Mars"),
    answer   = 2L
  ),
  q2 = list(
    question = "Which are noble gases?",
    options  = c("Helium", "Oxygen", "Neon", "Iron"),
    answer   = c(1L, 3L)
  )
)
checkMultiQuestions(questions)
```

# Validate a fill-in-the-blank question object

Checks that a cloze question list is correctly structured for use in
[`fillBlanks`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md).
Validates required fields, cloze markers, and optional additional
options.

## Usage

``` r
checkFillBlanks(x)
```

## Arguments

- x:

  A named list with at least the following element:

  cloze

  :   A character string containing the cloze text with blank markers.
      Each blank must be enclosed between `$$!` (opening tag) and `!$$`
      (closing tag), e.g. `"R is a $$!programming!$$ language"`.

  addOptions

  :   (optional) A character vector of additional distractor options
      displayed as answer choices alongside the correct answers.

## Value

The input `x` invisibly if all checks pass.

## See also

[`fillBlanks`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
which calls this function internally.

## Examples

``` r
# Valid cloze text
txt <- list(
  cloze = "R is a $$!programming!$$ language for $$!statistical computing!$$.",
  addOptions = c("natural", "colloquial")
)
checkFillBlanks(txt)

# Minimal (without addOptions)
txt2 <- list(cloze = "The capital of France is $$!Paris!$$.")
checkFillBlanks(txt2)
```

# Returns a JSON-formatted string

`convert2JSON` is a helper function for the
[`multiQuestions`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md)
quiz function. It converts its input list into a Javascript object and
returns it as JSON text. This text can then be read by the
multiQuestions Javascript code.

## Usage

``` r
convert2JSON(x, choice = "single")
```

## Arguments

- x:

  The input list of the
  [`multiQuestions`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md)
  function, which is a list of lists, each containing 3 or 4 elements
  (question, options, answer, and optionally tip).

- choice:

  A character string specifying the quiz mode. Either `"single"`
  (default) or `"multiple"` for multiple-choice.

## Value

The function returns a JSON-formatted string containing a JS object of
all questions.

## See also

[`multiQuestions`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md)

# Returns a JSON-formatted string

`convertFillGaps2HTML` is a helper function for the
[`fillGaps`](https://saskiaotto.github.io/rquiz/reference/fillGaps.md)
quiz function. It converts its input list containing the cloze as simple
text into two strings of HTML code. These strings are then taken by the
fillGaps Javascript code and appended 'as is' to the HTML cloze and
option div elements.

## Usage

``` r
convertFillGaps2HTML(x, blanksWidth, blanksAlign)
```

## Arguments

- x:

  The input list of the
  [`fillGaps`](https://saskiaotto.github.io/rquiz/reference/fillGaps.md)
  function, which contains 2 \*\*named\*\* elements:

  - `$cloze` A string containing the full text \*\*including\*\* the
    words, signs or items to be removed. These text parts should be
    indicated by placing them between an opening 'tag' `$$!` and a
    closing 'tag' `!$$`. Anything inside these tags will be removed from
    the cloze text and shown as answer options at the bottom of the
    widget (if tip button is displayed).

  - `$addOptions` A character vector containing additional answer
    options to show in the tip section.

- blanksWidth:

  character; a string providing the width (in pixels) of the blank
  fields. This is defined by the user in the function
  [`fillGaps`](https://saskiaotto.github.io/rquiz/reference/fillGaps.md).
  If set to `NULL`, the width is chosen by the system.

- blanksAlign:

  character; the default alignment of the answer options once placed
  into the correct blank field is `"center"`. Other options are `"left"`
  and `"right"`. The former is more suitable for coding syntax. This is
  defined by the user in the function
  [`fillGaps`](https://saskiaotto.github.io/rquiz/reference/fillGaps.md).

## Value

The function returns a list with 2 named character vectors, each
containing only one string:

- `cloze_txt`:

  A string of the cloze text including span elements for the blank
  fields with data-target reference. This string goes directly into the
  div.fgq-cloze element.

- `opt_txt`:

  Individual span elements, one for each answer option, that are
  directly appended to the p.fgq-options element in the Javascript code

## See also

[`fillGaps`](https://saskiaotto.github.io/rquiz/reference/fillGaps.md)

## Examples

``` r
x <- list(
  cloze = "R is a $$!programming!$$ language and free software environment
   for $$!statistical computing!$$ and graphics.",
  addOptions = c("natural", "colloquial", "movies", "audio")
)
convertFillGaps2HTML(x, blanksWidth = NULL, blanksAlign = "center")
#> $cloze
#> [1] "R is a <input type='text' class='fgq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;</span> language and free software environment   for <input type='text' class='fgq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;</span> and graphics."
#> 
#> $answers
#> [1] "programming"           "statistical computing"
#> 
#> $options
#> [1] "<span class='fgq-option'>colloquial</span> <span class='fgq-option'>movies</span> <span class='fgq-option'>statistical computing</span> <span class='fgq-option'>natural</span> <span class='fgq-option'>programming</span> <span class='fgq-option'>audio</span>"
#> 
```

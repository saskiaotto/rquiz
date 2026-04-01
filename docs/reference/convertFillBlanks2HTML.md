# Convert cloze text to HTML

`convertFillBlanks2HTML` is a helper function for the
[`fillBlanks`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
quiz function. It converts the input list containing the cloze text into
HTML strings with blank input fields. These strings are then used by the
fillBlanks JavaScript code and appended to the HTML cloze and option div
elements.

## Usage

``` r
convertFillBlanks2HTML(x, blanksWidth, blanksAlign)
```

## Arguments

- x:

  The input list of the
  [`fillBlanks`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
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
  [`fillBlanks`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md).
  If set to `NULL`, the width is chosen by the system.

- blanksAlign:

  character; the default alignment of the answer options once placed
  into the correct blank field is `"center"`. Other options are `"left"`
  and `"right"`. The former is more suitable for coding syntax. This is
  defined by the user in the function
  [`fillBlanks`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md).

## Value

A list with 3 named elements:

- `cloze`:

  An HTML string of the cloze text with input fields replacing the
  `$$!...!$$` markers.

- `answers`:

  A character vector of the correct answers (extracted from the
  markers).

- `options`:

  An HTML string of span elements for all answer options (correct +
  additional), randomized in order.

## See also

[`fillBlanks`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md),
[`checkFillBlanks`](https://saskiaotto.github.io/rquiz/reference/checkFillBlanks.md)

# Shiny bindings for fillGaps

Output and render functions for using fillGaps within Shiny applications
and interactive Rmd documents.

## Usage

``` r
fillGapsOutput(outputId, width = "100%", height = "500px")

renderFillGaps(expr, env = parent.frame(), quoted = FALSE)
```

## Arguments

- outputId:

  output variable to read from

- width, height:

  Must be a valid CSS unit (like `'100%'`, `'400px'`, `'auto'`) or a
  number, which will be coerced to a string and have `'px'` appended.

- expr:

  An expression that generates a fillGaps quiz

- env:

  The environment in which to evaluate `expr`.

- quoted:

  Is `expr` a quoted expression (with
  [`quote()`](https://rdrr.io/r/base/substitute.html))? This is useful
  if you want to save an expression in a variable.

## Examples

``` r
if (FALSE) { # \dontrun{
library(shiny)

txt <- list(
  cloze = "R is a $$!programming!$$ language for $$!statistical computing!$$.",
  addOptions = c("natural", "cooking")
)

ui <- fluidPage(
  fillGapsOutput("quiz1")
)

server <- function(input, output) {
  output$quiz1 <- renderFillGaps({
    fillGaps(x = txt, title = "Fill the Gaps")
  })
}

shinyApp(ui, server)
} # }
```

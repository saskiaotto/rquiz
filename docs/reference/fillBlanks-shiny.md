# Shiny bindings for fillBlanks

Output and render functions for using fillBlanks within Shiny
applications and interactive Rmd documents.

## Usage

``` r
fillBlanksOutput(outputId, width = "100%", height = "500px")

renderFillBlanks(expr, env = parent.frame(), quoted = FALSE)
```

## Arguments

- outputId:

  output variable to read from

- width, height:

  Must be a valid CSS unit (like `'100%'`, `'400px'`, `'auto'`) or a
  number, which will be coerced to a string and have `'px'` appended.

- expr:

  An expression that generates a fillBlanks quiz

- env:

  The environment in which to evaluate `expr`.

- quoted:

  Is `expr` a quoted expression (with
  [`quote()`](https://rdrr.io/r/base/substitute.html))? This is useful
  if you want to save an expression in a variable.

## Value

`fillBlanksOutput` returns an HTML output element for use in a Shiny UI
definition. `renderFillBlanks` returns a server-side rendering function
to be assigned to an output slot.

## Examples

``` r
if (FALSE) { # \dontrun{
library(shiny)

txt <- list(
  cloze = "R is a $$!programming!$$ language for $$!statistical computing!$$.",
  addOptions = c("natural", "cooking")
)

ui <- fluidPage(
  fillBlanksOutput("quiz1")
)

server <- function(input, output) {
  output$quiz1 <- renderFillBlanks({
    fillBlanks(x = txt, title = "Fill in the Blanks")
  })
}

shinyApp(ui, server)
} # }
```

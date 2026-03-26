# Shiny bindings for multiQuestions

Output and render functions for using multiQuestions within Shiny
applications and interactive Rmd documents.

## Usage

``` r
multiQuestionsOutput(outputId, width = "100%", height = "400px")

renderMultiQuestions(expr, env = parent.frame(), quoted = FALSE)
```

## Arguments

- outputId:

  output variable to read from

- width, height:

  Must be a valid CSS unit (like `'100%'`, `'400px'`, `'auto'`) or a
  number, which will be coerced to a string and have `'px'` appended.

- expr:

  An expression that generates a multiQuestions quiz

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

x <- list(
  q1 = list("What is 2+2?", c("3", "4", "5"), 2),
  q2 = list("What is 3*3?", c("6", "9", "12"), 2)
)

ui <- fluidPage(
  multiQuestionsOutput("quiz1")
)

server <- function(input, output) {
  output$quiz1 <- renderMultiQuestions({
    multiQuestions(x = x, title = "Math Quiz")
  })
}

shinyApp(ui, server)
} # }
```

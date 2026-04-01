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

## Value

`multiQuestionsOutput` returns an HTML output element for use in a Shiny
UI definition. `renderMultiQuestions` returns a server-side rendering
function to be assigned to an output slot.

## Examples

``` r
if (interactive()) {
library(shiny)

x <- list(
  q1 = list(
    question = "What is 2+2?",
    options = c("3", "4", "5"),
    answer = 2
  ),
  q2 = list(
    question = "What is 3*3?",
    options = c("6", "9", "12"),
    answer = 2
  )
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
}
```

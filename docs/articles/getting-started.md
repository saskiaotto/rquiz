# Getting Started with rquiz

## Overview

**rquiz** provides three types of interactive quizzes as HTML widgets:

| Function | Description |
|----|----|
| [`singleQuestion()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md) | A single question with immediate feedback (single- or multiple-choice) |
| [`multiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md) | A multi-page quiz with navigation, timer, and results page |
| [`fillGaps()`](https://saskiaotto.github.io/rquiz/reference/fillGaps.md) | A fill-in-the-blank cloze text |

All quizzes work in R Markdown, Quarto documents, HTML presentations
(e.g. revealJS), and Shiny applications.

## Defining Questions

### Single question (`singleQuestion`)

Questions are defined as a list with 3 (or 4) elements:

``` r

myQuestion <- list(
  question = "What is the capital of France?",  # the question text
  options = c("Berlin", "London", "Paris", "Madrid"),  # answer options
  answer = 3,  # index of the correct answer (Paris)
  tip = "Think about the Eiffel Tower."  # optional tip text (for MC mode)
)
```

For **single-choice** (`choice = "single"`, the default), `answer` is a
single integer. For **multiple-choice** (`choice = "multiple"`),
`answer` is a vector of integers:

``` r

myMCQuestion <- list(
  question = "Which of the following are prime numbers?",
  options = c("2", "4", "7", "9", "11", "15"),
  answer = c(1, 3, 5),  # indices of correct options (2, 7, 11)
  tip = "Prime numbers are only divisible by 1 and themselves."
)
```

### Multiple questions (`multiQuestions`)

Pass a list of question lists. Each question follows the same structure:

``` r

x <- list(
  q1 = list(
    question = "Which planet is closest to the Sun?",
    options = c("Venus", "Mercury", "Mars", "Earth"),
    answer = 2
  ),
  q2 = list(
    question = "What is the chemical symbol for gold?",
    options = c("Ag", "Fe", "Au", "Cu"),
    answer = 3
  )
)
```

### Fill-in-the-blank (`fillGaps`)

Define a cloze text with `$$!answer!$$` markers for blank fields.
Optionally add distractor options:

``` r

txt <- list(
  cloze = "R is a $$!programming!$$ language for $$!statistical computing!$$.",
  addOptions = c("natural", "colloquial", "movies")
)
```

Use `<pre>` tags for code formatting:

``` r

codequiz <- list(
  cloze = "<pre>x $$!<-!$$ c(1, 2, 3)
$$!mean!$$(x)</pre>",
  addOptions = c("=", "->", "median", "sum")
)
```

## Creating a Quiz

Once your data is defined, pass it to the quiz function:

``` r

singleQuestion(
  x = list(
    question = "What is the capital of France?",
    options = c("Berlin", "London", "Paris", "Madrid"),
    answer = 3
  ),
  title = "Geography Quiz"
)
```

## Key Parameters

All three quiz functions share a common set of parameters:

### Content & behavior

| Parameter | Description | Default |
|----|----|----|
| `title` | Quiz title text | `NULL` / `"Quiz"` |
| `language` | Language for UI text (`"en"`, `"de"`, `"fr"`, `"es"`) | `"en"` |
| `shuffle` | Randomize option/question order | `FALSE` |
| `showTipButton` | Show a hint button | `TRUE` |
| `showSolutionButton` | Show a reveal-solution button | `TRUE` |

### Layout

| Parameter | Description                                     | Default   |
|-----------|-------------------------------------------------|-----------|
| `width`   | Widget width (CSS value)                        | `"100%"`  |
| `height`  | Widget height (CSS value)                       | `"500px"` |
| `scroll`  | Fixed height with scrollbar (useful for slides) | `FALSE`   |
| `center`  | Center the widget horizontally                  | `TRUE`    |

### Design

All visual aspects are customizable — colors, fonts, sizes. Common
parameters include:

| Parameter | Description | Default |
|----|----|----|
| `fontFamily` | Font stack | `"'Helvetica Neue', ..."` |
| `fontSize` | Base font size in px | `16` |
| `titleCol` / `titleBg` | Title text & background color | `"#FFF"` / `"#5F5F5F"` |
| `questionCol` / `questionBg` | Question text & background color | varies |

See the function documentation
([`?singleQuestion`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md),
[`?multiQuestions`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md),
[`?fillGaps`](https://saskiaotto.github.io/rquiz/reference/fillGaps.md))
for the full list of design parameters.

## Multilingual Support

Set `language` to change all UI text (buttons, messages) automatically:

``` r

# German
singleQuestion(x = myQuestion, language = "de")

# French
multiQuestions(x = questions, language = "fr")

# Spanish
fillGaps(x = txt, language = "es")
```

Currently supported: English (`"en"`), German (`"de"`), French (`"fr"`),
Spanish (`"es"`). To request additional languages, please open an issue
on [GitHub](https://github.com/saskiaotto/rquiz/issues).

## Using in Quarto / R Markdown

Simply include quiz code in a code chunk. The widget renders as part of
the HTML output:

```` markdown
```{r}
library(rquiz)
singleQuestion(
  x = list("What is 2+2?", c("3", "4", "5"), 2),
  title = "Math"
)
```
````

For **HTML slide presentations** (e.g. revealJS, xaringan), use
`scroll = TRUE` to add a scrollbar when the quiz exceeds the available
slide space:

``` r

singleQuestion(x = myQuestion, scroll = TRUE, height = "400px")
```

## Using in Shiny

Use the provided output/render functions:

``` r

library(shiny)
library(rquiz)

ui <- fluidPage(
  h2("My Quiz App"),
  singleQuestionOutput("quiz")
)

server <- function(input, output) {
  output$quiz <- renderSingleQuestion({
    singleQuestion(
      x = list("What is 2+2?", c("3", "4", "5"), 2)
    )
  })
}

shinyApp(ui, server)
```

Each quiz type has its own pair:
[`singleQuestionOutput()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion-shiny.md)
/
[`renderSingleQuestion()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion-shiny.md),
[`multiQuestionsOutput()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions-shiny.md)
/
[`renderMultiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions-shiny.md),
[`fillGapsOutput()`](https://saskiaotto.github.io/rquiz/reference/fillGaps-shiny.md)
/
[`renderFillGaps()`](https://saskiaotto.github.io/rquiz/reference/fillGaps-shiny.md).

## Next Steps

- Browse the
  [Gallery](https://saskiaotto.github.io/rquiz/articles/gallery.md) for
  interactive examples with different configurations
- Check the [Function
  Reference](https://saskiaotto.github.io/rquiz/reference/index.md) for
  all available parameters

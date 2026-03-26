# Gallery

This gallery showcases the quiz types available in **rquiz** with
different configurations. All quizzes are interactive — try them out!
Click “Code” to see the R code behind each quiz.

------------------------------------------------------------------------

## Single Question — Single-Choice

Click an answer to get instant feedback (green = correct, red = wrong).

Show code

``` r

singleQuestion(
  x = list(
    question = "Which city hosted the 2024 Summer Olympics?",
    options = c("Athens", "London", "Paris", "Tokyo"),
    answer = 3
  ),
  title = "Geography Quiz"
)
```

------------------------------------------------------------------------

## Single Question — Multiple-Choice

Select all correct answers, then click Submit. The tip and solution
buttons provide help.

Show code

``` r

singleQuestion(
  x = list(
    question = "Which of the following are European capital cities?",
    options = c("Berlin", "Sydney", "Paris", "Tokyo", "Rome"),
    answer = c(1, 3, 5),
    tip = "Three of the five cities are in Europe."
  ),
  title = "European Capitals",
  showTipButton = TRUE
)
```

------------------------------------------------------------------------

## Multi-Question Quiz — Single-Choice

Navigate through questions with Previous/Next. The timer tracks your
time and a results page shows your score at the end. With
`shuffle = TRUE`, the question order is randomized — click “Try again”
on the results page to see a different order each time.

Show code

``` r

multiQuestions(
  x = list(
    q1 = list(
      question = "Which city hosted the 2024 Summer Olympics?",
      options = c("Athens", "London", "Paris", "Tokyo"),
      answer = 3,
      tip = "They speak French there."
    ),
    q2 = list(
      question = "Which sport was newly added at the 2024 Paris Olympics?",
      options = c("Skateboarding", "Breaking", "Surfing", "Sport Climbing"),
      answer = 2
    ),
    q3 = list(
      question = "Which country has won the most gold medals in
        Winter Olympics history?",
      options = c("USA", "Canada", "Germany", "Norway"),
      answer = 4,
      tip = "Think Scandinavia."
    )
  ),
  title = "Olympic Sports Quiz",
  shuffle = TRUE,
  showTipButton = TRUE
)
```

------------------------------------------------------------------------

## Multi-Question Quiz — Multiple-Choice

When any question has multiple correct answers, all questions use
checkboxes.

Show code

``` r

multiQuestions(
  x = list(
    q1 = list(
      question = "Which of these are team sports in the Summer Olympics?",
      options = c("Basketball", "Tennis", "Football", "Golf", "Volleyball"),
      answer = c(1, 3, 5)
    ),
    q2 = list(
      question = "Which cities have hosted the Summer Olympics more than once?",
      options = c("Berlin", "London", "Paris", "Tokyo", "Sydney"),
      answer = c(2, 3, 4),
      tip = "Three of the five cities have been repeat hosts."
    ),
    q3 = list(
      question = "Which continents have hosted the Summer Olympics?",
      options = c("Europe", "Asia", "Africa", "North America",
        "South America", "Oceania"),
      answer = c(1, 2, 4, 5, 6)
    )
  ),
  title = "Olympic Trivia (MC)",
  showTipButton = TRUE
)
```

------------------------------------------------------------------------

## Multi-Question Quiz — Mixed SC and MC

Questions with a single answer and questions with multiple answers can
be combined. The quiz auto-detects MC mode when any question has
multiple correct answers.

Show code

``` r

multiQuestions(
  x = list(
    q1 = list(
      question = "What is the capital of Japan?",
      options = c("Seoul", "Tokyo", "Beijing", "Bangkok"),
      answer = 2
    ),
    q2 = list(
      question = "Which of these countries are in South America?",
      options = c("Brazil", "Portugal", "Argentina", "Spain", "Chile"),
      answer = c(1, 3, 5),
      tip = "Three of the five are in South America."
    )
  ),
  title = "Geography Mix",
  showTipButton = TRUE
)
```

------------------------------------------------------------------------

## Fill-in-the-Blank — Basic

Type the missing words into the blank fields. Click Submit to check your
answers.

Show code

``` r

fillBlanks(
  x = list(
    cloze = "The $$!Nile!$$ is the longest river in $$!Africa!$$.",
    addOptions = c("Amazon", "Europe", "Danube", "Asia")
  ),
  title = "Geography",
  description = "Complete the sentence with the correct words.",
  showTipButton = TRUE
)
```

------------------------------------------------------------------------

## Fill-in-the-Blank — Code Syntax

Use `<pre>` tags for monospace code formatting. Use `<br>` for line
breaks within `<pre>` blocks.

Show code

``` r

fillBlanks(
  x = list(
    cloze = "<pre>library($$!ggplot2!$$) <br><br>
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + <br>
  $$!geom_point!$$(aes(color = Species)) + <br>
  $$!theme_minimal!$$()</pre>",
    addOptions = c("geom_line", "theme_classic", "dplyr", "geom_bar")
  ),
  title = "ggplot2 Code Quiz",
  showTipButton = TRUE,
  blanksAlign = "left"
)
```

------------------------------------------------------------------------

## German Language

All UI text (buttons, messages, tips) adapts automatically with
`language = "de"`:

Show code

``` r

singleQuestion(
  x = list(
    question = "Welche dieser Staedte liegt in Deutschland?",
    options = c("Zuerich", "Wien", "Muenchen", "Prag"),
    answer = 3,
    tip = "Denke an Bayern!"
  ),
  language = "de",
  title = "Geographie-Quiz",
  showTipButton = TRUE
)
```

------------------------------------------------------------------------

## French Language

Show code

``` r

multiQuestions(
  x = list(
    q1 = list(
      question = "Quelle est la capitale de la France?",
      options = c("Lyon", "Marseille", "Paris", "Toulouse"),
      answer = 3
    ),
    q2 = list(
      question = "Quel fleuve traverse Paris?",
      options = c("Le Rhin", "La Loire", "La Seine", "La Garonne"),
      answer = 3,
      tip = "Il passe sous le Pont Neuf."
    )
  ),
  language = "fr",
  title = "Quiz de geographie",
  showTipButton = TRUE
)
```

------------------------------------------------------------------------

## Reusable Dark Theme

Create a theme once and apply it to any quiz type with
[`rquizTheme()`](https://saskiaotto.github.io/rquiz/reference/rquizTheme.md):

Show code

``` r

dark <- rquizTheme(
  fontFamily = "Georgia, serif",
  fontSize = 18,
  titleCol = "#E0E0E0", titleBg = "#1A1A2E",
  questionCol = "#FFFFFF", questionBg = "#16213E",
  mainCol = "#E0E0E0", mainBg = "#1A1B2E",
  optionBg = "#252540", optionLabelBg = "#0F3460",
  navButtonCol = "#FFFFFF", navButtonBg = "#E94560",
  tipButtonCol = "#E0E0E0", tipButtonBg = "#2C2C3E",
  solutionButtonCol = "#E0E0E0", solutionButtonBg = "#2C2C3E",
  tipAreaCol = "#E0E0E0", tipAreaBg = "#1A2A1A", tipAreaBorder = "#4CAF50",
  solutionAreaCol = "#E0E0E0", solutionAreaBg = "#1A1A2E",
  solutionAreaBorder = "#5DADE2"
)
```

### Dark Single Question

Show code

``` r

singleQuestion(
  x = list(
    question = "Which ocean is the largest?",
    options = c("Atlantic", "Indian", "Pacific", "Arctic"),
    answer = 3,
    tip = "It covers more area than all the land on Earth combined."
  ),
  theme = dark,
  title = "Ocean Quiz",
  showTipButton = TRUE
)
```

### Dark Multi-Question Quiz

Show code

``` r

multiQuestions(
  x = list(
    q1 = list(
      question = "What is the highest mountain in the world?",
      options = c("K2", "Kangchenjunga", "Mount Everest", "Lhotse"),
      answer = 3
    ),
    q2 = list(
      question = "Which desert is the largest?",
      options = c("Gobi", "Sahara", "Antarctic", "Arabian"),
      answer = 3,
      tip = "It's not made of sand."
    )
  ),
  theme = dark,
  title = "Earth Quiz",
  showTipButton = TRUE
)
```

### Dark Fill-in-the-Blank

Show code

``` r

fillBlanks(
  x = list(
    cloze = "The $$!Pacific!$$ Ocean is the largest and the
      $$!Mariana!$$ Trench is its deepest point.",
    addOptions = c("Atlantic", "Indian", "Challenger")
  ),
  theme = dark,
  title = "Ocean Facts",
  showTipButton = TRUE
)
```

------------------------------------------------------------------------

## Custom Blue Theme (Multi-Page)

Navigation buttons, solution area, and answers can all be themed
individually:

Show code

``` r

multiQuestions(
  x = list(
    q1 = list(
      question = "What is the largest planet in our solar system?",
      options = c("Mars", "Jupiter", "Saturn", "Neptune"),
      answer = 2
    ),
    q2 = list(
      question = "How many continents are there?",
      options = c("5", "6", "7", "8"),
      answer = 3
    )
  ),
  title = "Space & Earth",
  titleCol = "#FFFFFF", titleBg = "#2C3E50",
  mainBg = "#ECF0F1",
  optionBg = "#D5DBDB",
  navButtonCol = "#FFFFFF", navButtonBg = "#3498DB",
  solutionButtonCol = "#2C3E50", solutionButtonBg = "#D5DBDB",
  solutionAreaBg = "#D6EAF8", solutionAreaBorder = "#2980B9"
)
```

------------------------------------------------------------------------

## Compact Quiz (Small Width)

Quizzes adapt responsively to smaller widths. Buttons wrap to the next
line when space is limited.

Show code

``` r

singleQuestion(
  x = list(
    question = "What is the smallest country in the world?",
    options = c("Monaco", "Vatican City", "San Marino", "Liechtenstein"),
    answer = 2
  ),
  title = "Mini Quiz",
  width = "50%",
  fontSize = 14
)
```

------------------------------------------------------------------------

## Quiz in Scrollable Frame

Use `scroll = TRUE` for fixed-height containers — ideal for HTML slide
presentations:

Show code

``` r

multiQuestions(
  x = list(
    q1 = list(
      question = "Which river is the longest in the world?",
      options = c("Amazon", "Nile", "Yangtze", "Mississippi"),
      answer = 2
    ),
    q2 = list(
      question = "Which lake is the deepest?",
      options = c("Lake Superior", "Lake Victoria", "Lake Baikal", "Caspian Sea"),
      answer = 3
    )
  ),
  title = "Water Quiz",
  width = "60%",
  height = "350px",
  scroll = TRUE
)
```

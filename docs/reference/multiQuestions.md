# Create a multi-page quiz with navigation, timer, and results

`multiQuestions` creates an interactive quiz that presents multiple
questions one at a time with Previous/Next navigation. A timer tracks
how long the user takes (optional), and a results page shows the total
score with an optional 'Show solution' button to reveal correct answers.
Supports both single-choice and multiple-choice questions.

## Usage

``` r
multiQuestions(
  x,
  title = "Quiz",
  language = "en",
  shuffle = FALSE,
  showTipButton = FALSE,
  showSolutionButton = TRUE,
  inclTimer = TRUE,
  width = "100%",
  height = "500px",
  center = TRUE,
  scroll = FALSE,
  fontFamily = "'Helvetica Neue', Helvetica, Arial, sans-serif",
  fontSize = 16,
  titleFontSize = 20,
  questionFontSize = 16,
  titleAlign = "left",
  titleCol = "#FFFFFF",
  titleBg = "#5F5F5F",
  questionCol = "#1C1C1C",
  questionBg = "#F7F7F7",
  mainCol = "#1C1C1C",
  mainBg = "#F7F7F7",
  optionBg = "#ECECEC",
  timerCol = "#1C1C1C",
  navButtonCol = "#FFFFFF",
  navButtonBg = "#28A745",
  tipButtonCol = "#1C1C1C",
  tipButtonBg = "#F1F1F1",
  tipAreaCol = "#1C1C1C",
  tipAreaBg = "#E7F9E7",
  tipAreaBorder = "#28A745",
  solutionButtonCol = "#1C1C1C",
  solutionButtonBg = "#F1F1F1",
  solutionAreaCol = "#1C1C1C",
  solutionAreaBg = "#D6EAF8",
  solutionAreaBorder = "#3498DB",
  theme = NULL
)
```

## Arguments

- x:

  A list of question lists. Each sub-list should contain:

  - `$question` A character string with the question text.

  - `$options` A character vector of answer options (min. 2).

  - `$answer` An integer index (SC) or numeric vector of indices (MC) of
    the correct answer option(s).

  - `$tip` (optional) A character string shown as a custom tip when
    `showTipButton = TRUE`.

  Sub-lists can be named (e.g. `q1`, `q2`) for readability, but this is
  not required. Use
  [`checkMultiQuestions`](https://saskiaotto.github.io/rquiz/reference/checkMultiQuestions.md)
  to validate the input before passing it.

- title:

  character; the title text. The default is `"Quiz"`.

- language:

  character; the language of the quiz interface. Sets button labels,
  navigation text, result page text and other UI elements automatically.
  Currently supported: `"en"` (English, default), `"de"` (German),
  `"fr"` (French), and `"es"` (Spanish). To request additional
  languages, please open an issue on GitHub.

- shuffle:

  logical; if `TRUE`, the order of questions is randomized each time the
  widget is rendered or the quiz is restarted with 'Try again'. The
  default is `FALSE`.

- showTipButton:

  logical; whether to show a tip button on each question page. If `TRUE`
  and the question list contains a 4th element (tip text), the custom
  tip is displayed. In multiple-choice mode without a custom tip, the
  number of correct answers is shown. In single-choice mode, the button
  only appears for questions with a custom tip. The default is `FALSE`.

- showSolutionButton:

  logical; if `TRUE` (default), a 'Show solution' button is displayed on
  the results page, allowing users to reveal the correct answers. If
  `FALSE`, only the score (0 or 1) per question is shown.

- inclTimer:

  logical; whether to include a timer (`TRUE`, default) or not. The
  timer starts counting immediately after the page is loaded.

- width:

  character; the width of the quiz frame area in pixels or percentage.
  The default is `"100%"`.

- height:

  character; the height of the quiz frame area in pixels or percentage.
  The default is `"500px"`. If `scroll = FALSE`, the height is
  automatically determined based on content.

- center:

  logical; if `TRUE` (default), the quiz frame is centered when the
  width is less than `"100%"`.

- scroll:

  logical; if `TRUE`, the `height` argument sets a fixed frame height
  with a scroll bar for overflowing content. Useful for HTML
  presentations. If `FALSE` (default), the height adjusts automatically.

- fontFamily:

  character; the font family for all text elements in CSS style. The
  default is `"'Helvetica Neue', Helvetica, Arial, sans-serif"`.

- fontSize:

  integer; the font size in pixels for the main text elements. All other
  properties are rescaled accordingly. The default is `16`.

- titleFontSize:

  integer; the font size in pixels for the title. The default is `20`.

- questionFontSize:

  integer; the font size in pixels for the question text. The default is
  `16`.

- titleAlign:

  character; the alignment of the title text. One of `"left"` (default),
  `"center"`, or `"right"`.

- titleCol:

  character; the title text color as hex color or R color name. The
  default is `"#FFFFFF"`.

- titleBg:

  character; the title background color as hex color or R color name.
  The default is `"#5F5F5F"`.

- questionCol:

  character; the question text color. The default is `"#1C1C1C"`. The
  question is displayed in its own container between the title and the
  answer options.

- questionBg:

  character; the background color of the question container. The default
  is `"#F7F7F7"`.

- mainCol:

  character; the text color of the answer options and main content area.
  The default is `"#1C1C1C"`.

- mainBg:

  character; the background color of the main content area. The default
  is `"#F7F7F7"`.

- optionBg:

  character; the background color of the answer option blocks. The hover
  color is automatically derived (30% darker). The default is
  `"#ECECEC"`.

- timerCol:

  character; the timer text color as hex color or R color name. The
  default is `"#1C1C1C"`.

- navButtonCol:

  character; the text color of the navigation buttons (Previous, Next,
  Try again). The default is `"#FFFFFF"`.

- navButtonBg:

  character; the background color of the navigation buttons (Previous,
  Next, Try again). The default is `"#28A745"`.

- tipButtonCol:

  character; the tip button text color. The default is `"#1C1C1C"`.

- tipButtonBg:

  character; the tip button background color. The default is
  `"#F1F1F1"`.

- tipAreaCol:

  character; the text color of the tip area. The default is `"#1C1C1C"`.

- tipAreaBg:

  character; the background color of the tip area. The default is
  `"#E7F9E7"`.

- tipAreaBorder:

  character; the border color of the tip area. The default is
  `"#28A745"`.

- solutionButtonCol:

  character; the 'Show solution' button text color. The default is
  `"#1C1C1C"`.

- solutionButtonBg:

  character; the 'Show solution' button background color. The default is
  `"#F1F1F1"`.

- solutionAreaCol:

  character; the text color of the solution answer areas on the results
  page. The default is `"#1C1C1C"`.

- solutionAreaBg:

  character; the background color of the solution answer areas on the
  results page. The default is `"#D6EAF8"`.

- solutionAreaBorder:

  character; the border color of the solution answer areas on the
  results page. The default is `"#3498DB"`.

- theme:

  an optional
  [`rquizTheme`](https://saskiaotto.github.io/rquiz/reference/rquizTheme.md)
  object. Theme values are used as defaults and are overridden by any
  explicitly passed arguments.

## Value

An HTML widget object of class `multiQuestions` that can be rendered in
R Markdown/Quarto documents, Shiny applications, or the RStudio viewer.

## Details

The quiz mode is auto-detected: if **any** question has multiple correct
answers (`length(answer) > 1`), all questions use checkboxes
(multiple-choice mode). Otherwise, radio buttons are used
(single-choice). An optional tip button can provide hints per question
(custom text or, in MC mode, the number of correct answers).

**Text formatting:** Since quiz content is rendered as HTML, you can use
HTML tags in question and option strings: `<em>` for italics (e.g.
species names), `<strong>` for bold, `<code>` for inline code, or
`<span>` with inline CSS for colored text. Standard Markdown formatting
does *not* work inside quiz strings.

## See also

[`checkMultiQuestions`](https://saskiaotto.github.io/rquiz/reference/checkMultiQuestions.md)
for input validation,
[`singleQuestion`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md)
for single-question quizzes,
[`fillBlanks`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
for cloze quizzes,
[`rquizTheme`](https://saskiaotto.github.io/rquiz/reference/rquizTheme.md)
for reusable themes.

## Author

Saskia A. Otto

## Examples

``` r
# \donttest{
# --- SINGLE-CHOICE MODE ---

### Sub-lists can be named (e.g. q1, q2) for readability but don't have to.
sportQuiz <- list(
  q1 = list(
    question = "Which city hosted the 2024 Summer Olympics?",
    options = c("Athens", "London", "Paris", "Tokyo"),
    answer = 3  # i.e. Paris
  ),
  q2 = list(
    question = "Which of the following is NOT an official
      Olympic summer sport?",
    options = c("Beach Volleyball", "Baseball", "Football",
      "American Football", "Basketball", "Wrestling"),
    answer = 4
  ),
  q3 = list(
    question = "Which country has won the most Winter Olympic
      gold medals of all time?",
    options = c("USA", "Canada", "Germany",
      "Russia", "Sweden", "Norway"),
    answer = 6
  )
)

### Check if list has the correct format
checkMultiQuestions(sportQuiz)   # passes

### Default settings
multiQuestions(x = sportQuiz)

{"x":{"questions":"[{\"id\":1,\"question\":\"Which city hosted the 2024 Summer Olympics?\",\"options\":[{\"a\":\"Athens\",\"b\":\"London\",\"c\":\"Paris\",\"d\":\"Tokyo\"}],\"answer\":\"Paris\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which of the following is NOT an official      Olympic summer sport?\",\"options\":[{\"a\":\"Beach Volleyball\",\"b\":\"Baseball\",\"c\":\"Football\",\"d\":\"American Football\",\"e\":\"Basketball\",\"f\":\"Wrestling\"}],\"answer\":\"American Football\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":3,\"question\":\"Which country has won the most Winter Olympic      gold medals of all time?\",\"options\":[{\"a\":\"USA\",\"b\":\"Canada\",\"c\":\"Germany\",\"d\":\"Russia\",\"e\":\"Sweden\",\"f\":\"Norway\"}],\"answer\":\"Norway\",\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"single","title":"Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","inclTimer":"true","showTipBtn":"false","showSolutionBtn":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#5F5F5F","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Previous","txtNext":"Next","txtTotalQuestions":"Total Questions","txtTotalScore":"Total Score","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Correct answer","txtTryAgain":"Try again","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtNumberOfCorrectAnswers":"Number of correct answers","txtShowSolution":"Show solution","txtHideSolution":"Hide solution"},"evals":[],"jsHooks":[]}
### Custom title, shuffled questions, no timer, no solution button
multiQuestions(x = sportQuiz, title = "Sports Quiz",
  shuffle = TRUE, inclTimer = FALSE, showSolutionButton = FALSE)

{"x":{"questions":"[{\"id\":1,\"question\":\"Which city hosted the 2024 Summer Olympics?\",\"options\":[{\"a\":\"Athens\",\"b\":\"London\",\"c\":\"Paris\",\"d\":\"Tokyo\"}],\"answer\":\"Paris\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which of the following is NOT an official      Olympic summer sport?\",\"options\":[{\"a\":\"Beach Volleyball\",\"b\":\"Baseball\",\"c\":\"Football\",\"d\":\"American Football\",\"e\":\"Basketball\",\"f\":\"Wrestling\"}],\"answer\":\"American Football\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":3,\"question\":\"Which country has won the most Winter Olympic      gold medals of all time?\",\"options\":[{\"a\":\"USA\",\"b\":\"Canada\",\"c\":\"Germany\",\"d\":\"Russia\",\"e\":\"Sweden\",\"f\":\"Norway\"}],\"answer\":\"Norway\",\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"single","title":"Sports Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"true","inclTimer":"false","showTipBtn":"false","showSolutionBtn":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#5F5F5F","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Previous","txtNext":"Next","txtTotalQuestions":"Total Questions","txtTotalScore":"Total Score","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Correct answer","txtTryAgain":"Try again","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtNumberOfCorrectAnswers":"Number of correct answers","txtShowSolution":"Show solution","txtHideSolution":"Hide solution"},"evals":[],"jsHooks":[]}
### With tip button (only questions with a tip element show tips in SC mode)
sportQuizWithTips <- list(
  q1 = list(
    question = "Which city hosted the 2024 Summer Olympics?",
    options = c("Athens", "London", "Paris", "Tokyo"),
    answer = 3,
    tip = "They speak French there."
  ),
  q2 = list(
    question = "Which sport was added to the Olympics
      at the 2024 Paris Games?",
    options = c("Skateboarding", "Breaking",
      "Surfing", "Sport Climbing"),
    answer = 2  # no tip for this question
  )
)
multiQuestions(x = sportQuizWithTips, showTipButton = TRUE)

{"x":{"questions":"[{\"id\":1,\"question\":\"Which city hosted the 2024 Summer Olympics?\",\"options\":[{\"a\":\"Athens\",\"b\":\"London\",\"c\":\"Paris\",\"d\":\"Tokyo\"}],\"answer\":\"Paris\",\"tip\":\"They speak French there.\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which sport was added to the Olympics      at the 2024 Paris Games?\",\"options\":[{\"a\":\"Skateboarding\",\"b\":\"Breaking\",\"c\":\"Surfing\",\"d\":\"Sport Climbing\"}],\"answer\":\"Breaking\",\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"single","title":"Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","inclTimer":"true","showTipBtn":"true","showSolutionBtn":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#5F5F5F","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Previous","txtNext":"Next","txtTotalQuestions":"Total Questions","txtTotalScore":"Total Score","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Correct answer","txtTryAgain":"Try again","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtNumberOfCorrectAnswers":"Number of correct answers","txtShowSolution":"Show solution","txtHideSolution":"Hide solution"},"evals":[],"jsHooks":[]}

# --- MULTIPLE-CHOICE MODE (auto-detected from answer vector) ---

### If ANY question has multiple correct answers, all use checkboxes.
geoQuiz <- list(
  q1 = list(
    question = "Which of the following cities are in Europe?",
    options = c("Berlin", "Tokyo", "Paris", "Sydney", "Rome"),
    answer = c(1, 3, 5),
    tip = "Three of the five cities are European capitals."
  ),
  q2 = list(
    question = "Which of these rivers flow through Germany?",
    options = c("Rhine", "Thames", "Danube", "Seine", "Elbe"),
    answer = c(1, 3, 5)
    # no custom tip: auto-generated "Number of correct answers: 3"
  )
)
### Default settings
multiQuestions(x = geoQuiz)

{"x":{"questions":"[{\"id\":1,\"question\":\"Which of the following cities are in Europe?\",\"options\":[{\"a\":\"Berlin\",\"b\":\"Tokyo\",\"c\":\"Paris\",\"d\":\"Sydney\",\"e\":\"Rome\"}],\"answer\":[\"Berlin\",\"Paris\",\"Rome\"],\"tip\":\"Three of the five cities are European capitals.\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which of these rivers flow through Germany?\",\"options\":[{\"a\":\"Rhine\",\"b\":\"Thames\",\"c\":\"Danube\",\"d\":\"Seine\",\"e\":\"Elbe\"}],\"answer\":[\"Rhine\",\"Danube\",\"Elbe\"],\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"multiple","title":"Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","inclTimer":"true","showTipBtn":"false","showSolutionBtn":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#5F5F5F","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Previous","txtNext":"Next","txtTotalQuestions":"Total Questions","txtTotalScore":"Total Score","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Correct answer","txtTryAgain":"Try again","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtNumberOfCorrectAnswers":"Number of correct answers","txtShowSolution":"Show solution","txtHideSolution":"Hide solution"},"evals":[],"jsHooks":[]}
### Adding a title and showing the tip button
multiQuestions(x = geoQuiz, title = "Geography Quiz",
  showTipButton = TRUE)

{"x":{"questions":"[{\"id\":1,\"question\":\"Which of the following cities are in Europe?\",\"options\":[{\"a\":\"Berlin\",\"b\":\"Tokyo\",\"c\":\"Paris\",\"d\":\"Sydney\",\"e\":\"Rome\"}],\"answer\":[\"Berlin\",\"Paris\",\"Rome\"],\"tip\":\"Three of the five cities are European capitals.\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which of these rivers flow through Germany?\",\"options\":[{\"a\":\"Rhine\",\"b\":\"Thames\",\"c\":\"Danube\",\"d\":\"Seine\",\"e\":\"Elbe\"}],\"answer\":[\"Rhine\",\"Danube\",\"Elbe\"],\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"multiple","title":"Geography Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","inclTimer":"true","showTipBtn":"true","showSolutionBtn":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#5F5F5F","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Previous","txtNext":"Next","txtTotalQuestions":"Total Questions","txtTotalScore":"Total Score","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Correct answer","txtTryAgain":"Try again","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtNumberOfCorrectAnswers":"Number of correct answers","txtShowSolution":"Show solution","txtHideSolution":"Hide solution"},"evals":[],"jsHooks":[]}
### Changing the language
multiQuestions(x = sportQuiz, title = "Sport-Quiz",
  language = "de")

{"x":{"questions":"[{\"id\":1,\"question\":\"Which city hosted the 2024 Summer Olympics?\",\"options\":[{\"a\":\"Athens\",\"b\":\"London\",\"c\":\"Paris\",\"d\":\"Tokyo\"}],\"answer\":\"Paris\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which of the following is NOT an official      Olympic summer sport?\",\"options\":[{\"a\":\"Beach Volleyball\",\"b\":\"Baseball\",\"c\":\"Football\",\"d\":\"American Football\",\"e\":\"Basketball\",\"f\":\"Wrestling\"}],\"answer\":\"American Football\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":3,\"question\":\"Which country has won the most Winter Olympic      gold medals of all time?\",\"options\":[{\"a\":\"USA\",\"b\":\"Canada\",\"c\":\"Germany\",\"d\":\"Russia\",\"e\":\"Sweden\",\"f\":\"Norway\"}],\"answer\":\"Norway\",\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"single","title":"Sport-Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","inclTimer":"true","showTipBtn":"false","showSolutionBtn":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#5F5F5F","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Zurück","txtNext":"Weiter","txtTotalQuestions":"Fragen gesamt","txtTotalScore":"Gesamtpunktzahl","txtScore":"Punkte","txtQuestion":"F","txtCorrectAnswer":"Richtige Antwort","txtTryAgain":"Nochmal","txtShowTips":"Tipps anzeigen","txtHideTips":"Tipps ausblenden","txtNumberOfCorrectAnswers":"Anzahl richtiger Antworten","txtShowSolution":"Lösung anzeigen","txtHideSolution":"Lösung ausblenden"},"evals":[],"jsHooks":[]}multiQuestions(x = sportQuiz, title = "Quiz sportif",
  language = "fr", shuffle = TRUE)

{"x":{"questions":"[{\"id\":1,\"question\":\"Which city hosted the 2024 Summer Olympics?\",\"options\":[{\"a\":\"Athens\",\"b\":\"London\",\"c\":\"Paris\",\"d\":\"Tokyo\"}],\"answer\":\"Paris\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which of the following is NOT an official      Olympic summer sport?\",\"options\":[{\"a\":\"Beach Volleyball\",\"b\":\"Baseball\",\"c\":\"Football\",\"d\":\"American Football\",\"e\":\"Basketball\",\"f\":\"Wrestling\"}],\"answer\":\"American Football\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":3,\"question\":\"Which country has won the most Winter Olympic      gold medals of all time?\",\"options\":[{\"a\":\"USA\",\"b\":\"Canada\",\"c\":\"Germany\",\"d\":\"Russia\",\"e\":\"Sweden\",\"f\":\"Norway\"}],\"answer\":\"Norway\",\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"single","title":"Quiz sportif","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"true","inclTimer":"true","showTipBtn":"false","showSolutionBtn":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#5F5F5F","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Précédent","txtNext":"Suivant","txtTotalQuestions":"Total des questions","txtTotalScore":"Score total","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Bonne réponse","txtTryAgain":"Réessayer","txtShowTips":"Afficher les indices","txtHideTips":"Masquer les indices","txtNumberOfCorrectAnswers":"Nombre de bonnes réponses","txtShowSolution":"Afficher la solution","txtHideSolution":"Masquer la solution"},"evals":[],"jsHooks":[]}multiQuestions(x = sportQuiz, title = "Cuestionario deportivo",
  language = "es")

{"x":{"questions":"[{\"id\":1,\"question\":\"Which city hosted the 2024 Summer Olympics?\",\"options\":[{\"a\":\"Athens\",\"b\":\"London\",\"c\":\"Paris\",\"d\":\"Tokyo\"}],\"answer\":\"Paris\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which of the following is NOT an official      Olympic summer sport?\",\"options\":[{\"a\":\"Beach Volleyball\",\"b\":\"Baseball\",\"c\":\"Football\",\"d\":\"American Football\",\"e\":\"Basketball\",\"f\":\"Wrestling\"}],\"answer\":\"American Football\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":3,\"question\":\"Which country has won the most Winter Olympic      gold medals of all time?\",\"options\":[{\"a\":\"USA\",\"b\":\"Canada\",\"c\":\"Germany\",\"d\":\"Russia\",\"e\":\"Sweden\",\"f\":\"Norway\"}],\"answer\":\"Norway\",\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"single","title":"Cuestionario deportivo","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","inclTimer":"true","showTipBtn":"false","showSolutionBtn":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#5F5F5F","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Anterior","txtNext":"Siguiente","txtTotalQuestions":"Total de preguntas","txtTotalScore":"Puntuación total","txtScore":"Puntuación","txtQuestion":"P","txtCorrectAnswer":"Respuesta correcta","txtTryAgain":"Intentar de nuevo","txtShowTips":"Mostrar pistas","txtHideTips":"Ocultar pistas","txtNumberOfCorrectAnswers":"Número de respuestas correctas","txtShowSolution":"Mostrar solución","txtHideSolution":"Ocultar solución"},"evals":[],"jsHooks":[]}

# --- CHANGING THE STYLE ---

### Adjusting the window size
multiQuestions(x = sportQuiz, width = "50%")

{"x":{"questions":"[{\"id\":1,\"question\":\"Which city hosted the 2024 Summer Olympics?\",\"options\":[{\"a\":\"Athens\",\"b\":\"London\",\"c\":\"Paris\",\"d\":\"Tokyo\"}],\"answer\":\"Paris\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which of the following is NOT an official      Olympic summer sport?\",\"options\":[{\"a\":\"Beach Volleyball\",\"b\":\"Baseball\",\"c\":\"Football\",\"d\":\"American Football\",\"e\":\"Basketball\",\"f\":\"Wrestling\"}],\"answer\":\"American Football\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":3,\"question\":\"Which country has won the most Winter Olympic      gold medals of all time?\",\"options\":[{\"a\":\"USA\",\"b\":\"Canada\",\"c\":\"Germany\",\"d\":\"Russia\",\"e\":\"Sweden\",\"f\":\"Norway\"}],\"answer\":\"Norway\",\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"single","title":"Quiz","width":"50%","height":"500px","center":"true","scroll":"false","shuffle":"false","inclTimer":"true","showTipBtn":"false","showSolutionBtn":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#5F5F5F","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Previous","txtNext":"Next","txtTotalQuestions":"Total Questions","txtTotalScore":"Total Score","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Correct answer","txtTryAgain":"Try again","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtNumberOfCorrectAnswers":"Number of correct answers","txtShowSolution":"Show solution","txtHideSolution":"Hide solution"},"evals":[],"jsHooks":[]}multiQuestions(x = geoQuiz, width = "50%", center = FALSE)

{"x":{"questions":"[{\"id\":1,\"question\":\"Which of the following cities are in Europe?\",\"options\":[{\"a\":\"Berlin\",\"b\":\"Tokyo\",\"c\":\"Paris\",\"d\":\"Sydney\",\"e\":\"Rome\"}],\"answer\":[\"Berlin\",\"Paris\",\"Rome\"],\"tip\":\"Three of the five cities are European capitals.\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which of these rivers flow through Germany?\",\"options\":[{\"a\":\"Rhine\",\"b\":\"Thames\",\"c\":\"Danube\",\"d\":\"Seine\",\"e\":\"Elbe\"}],\"answer\":[\"Rhine\",\"Danube\",\"Elbe\"],\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"multiple","title":"Quiz","width":"50%","height":"500px","center":"false","scroll":"false","shuffle":"false","inclTimer":"true","showTipBtn":"false","showSolutionBtn":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#5F5F5F","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Previous","txtNext":"Next","txtTotalQuestions":"Total Questions","txtTotalScore":"Total Score","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Correct answer","txtTryAgain":"Try again","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtNumberOfCorrectAnswers":"Number of correct answers","txtShowSolution":"Show solution","txtHideSolution":"Hide solution"},"evals":[],"jsHooks":[]}# height only works with scroll = TRUE
multiQuestions(x = sportQuiz, width = "50%",
  height = "300px", scroll = TRUE)

{"x":{"questions":"[{\"id\":1,\"question\":\"Which city hosted the 2024 Summer Olympics?\",\"options\":[{\"a\":\"Athens\",\"b\":\"London\",\"c\":\"Paris\",\"d\":\"Tokyo\"}],\"answer\":\"Paris\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which of the following is NOT an official      Olympic summer sport?\",\"options\":[{\"a\":\"Beach Volleyball\",\"b\":\"Baseball\",\"c\":\"Football\",\"d\":\"American Football\",\"e\":\"Basketball\",\"f\":\"Wrestling\"}],\"answer\":\"American Football\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":3,\"question\":\"Which country has won the most Winter Olympic      gold medals of all time?\",\"options\":[{\"a\":\"USA\",\"b\":\"Canada\",\"c\":\"Germany\",\"d\":\"Russia\",\"e\":\"Sweden\",\"f\":\"Norway\"}],\"answer\":\"Norway\",\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"single","title":"Quiz","width":"50%","height":"300px","center":"true","scroll":"true","shuffle":"false","inclTimer":"true","showTipBtn":"false","showSolutionBtn":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#5F5F5F","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Previous","txtNext":"Next","txtTotalQuestions":"Total Questions","txtTotalScore":"Total Score","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Correct answer","txtTryAgain":"Try again","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtNumberOfCorrectAnswers":"Number of correct answers","txtShowSolution":"Show solution","txtHideSolution":"Hide solution"},"evals":[],"jsHooks":[]}
### Customizing the design: dark theme
multiQuestions(x = sportQuizWithTips,
  title = "Sports Quiz", showTipButton = TRUE,
  fontFamily = "Georgia, serif",
  fontSize = 20, titleFontSize = 14, questionFontSize = 14,
  titleCol = "#E2E8F0", titleBg = "#2D2D44",
  questionCol = "#E2E8F0", questionBg = "#252540",
  mainCol = "#E2E8F0", mainBg = "#1A1B2E",
  optionBg = "#252540", timerCol = "#F687B3",
  navButtonCol = "#FFFFFF", navButtonBg = "#6C63FF",
  tipButtonCol = "#68D391", tipButtonBg = "#2D2D44",
  tipAreaCol = "#68D391", tipAreaBg = "#162616",
  tipAreaBorder = "#68D391",
  solutionButtonCol = "#63B3ED", solutionButtonBg = "#2D2D44",
  solutionAreaCol = "#63B3ED", solutionAreaBg = "#111827",
  solutionAreaBorder = "#4299E1")

{"x":{"questions":"[{\"id\":1,\"question\":\"Which city hosted the 2024 Summer Olympics?\",\"options\":[{\"a\":\"Athens\",\"b\":\"London\",\"c\":\"Paris\",\"d\":\"Tokyo\"}],\"answer\":\"Paris\",\"tip\":\"They speak French there.\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which sport was added to the Olympics      at the 2024 Paris Games?\",\"options\":[{\"a\":\"Skateboarding\",\"b\":\"Breaking\",\"c\":\"Surfing\",\"d\":\"Sport Climbing\"}],\"answer\":\"Breaking\",\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"single","title":"Sports Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","inclTimer":"true","showTipBtn":"true","showSolutionBtn":"true","fontFamily":"Georgia, serif","fontSize":20,"titleFontSize":14,"questionFontSize":14,"titleAlign":"left","titleCol":"#E2E8F0","titleBg":"#2D2D44","questionCol":"#E2E8F0","questionBg":"#252540","mainCol":"#E2E8F0","mainBg":"#1A1B2E","optionBg":"#252540","timerCol":"#F687B3","navBtnCol":"#FFFFFF","navBtnBg":"#6C63FF","tipBtnCol":"#68D391","tipBtnBg":"#2D2D44","tipAreaCol":"#68D391","tipAreaBg":"#162616","tipAreaBorder":"#68D391","solutionBtnCol":"#63B3ED","solutionBtnBg":"#2D2D44","solutionAreaCol":"#63B3ED","solutionAreaBg":"#111827","solutionAreaBorder":"#4299E1","txtPrevious":"Previous","txtNext":"Next","txtTotalQuestions":"Total Questions","txtTotalScore":"Total Score","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Correct answer","txtTryAgain":"Try again","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtNumberOfCorrectAnswers":"Number of correct answers","txtShowSolution":"Show solution","txtHideSolution":"Hide solution"},"evals":[],"jsHooks":[]}
### Using a reusable theme
dark <- rquizTheme(
  titleCol = "#E0E0E0", titleBg = "#1A1A2E",
  navButtonCol = "#FFFFFF", navButtonBg = "#E94560"
)
multiQuestions(x = sportQuiz, theme = dark, title = "Themed Sports Quiz")

{"x":{"questions":"[{\"id\":1,\"question\":\"Which city hosted the 2024 Summer Olympics?\",\"options\":[{\"a\":\"Athens\",\"b\":\"London\",\"c\":\"Paris\",\"d\":\"Tokyo\"}],\"answer\":\"Paris\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which of the following is NOT an official      Olympic summer sport?\",\"options\":[{\"a\":\"Beach Volleyball\",\"b\":\"Baseball\",\"c\":\"Football\",\"d\":\"American Football\",\"e\":\"Basketball\",\"f\":\"Wrestling\"}],\"answer\":\"American Football\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":3,\"question\":\"Which country has won the most Winter Olympic      gold medals of all time?\",\"options\":[{\"a\":\"USA\",\"b\":\"Canada\",\"c\":\"Germany\",\"d\":\"Russia\",\"e\":\"Sweden\",\"f\":\"Norway\"}],\"answer\":\"Norway\",\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"single","title":"Themed Sports Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","inclTimer":"true","showTipBtn":"false","showSolutionBtn":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#E0E0E0","titleBg":"#1A1A2E","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#E94560","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Previous","txtNext":"Next","txtTotalQuestions":"Total Questions","txtTotalScore":"Total Score","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Correct answer","txtTryAgain":"Try again","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtNumberOfCorrectAnswers":"Number of correct answers","txtShowSolution":"Show solution","txtHideSolution":"Hide solution"},"evals":[],"jsHooks":[]}multiQuestions(x = geoQuiz, theme = dark, title = "Themed Geography Quiz")

{"x":{"questions":"[{\"id\":1,\"question\":\"Which of the following cities are in Europe?\",\"options\":[{\"a\":\"Berlin\",\"b\":\"Tokyo\",\"c\":\"Paris\",\"d\":\"Sydney\",\"e\":\"Rome\"}],\"answer\":[\"Berlin\",\"Paris\",\"Rome\"],\"tip\":\"Three of the five cities are European capitals.\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which of these rivers flow through Germany?\",\"options\":[{\"a\":\"Rhine\",\"b\":\"Thames\",\"c\":\"Danube\",\"d\":\"Seine\",\"e\":\"Elbe\"}],\"answer\":[\"Rhine\",\"Danube\",\"Elbe\"],\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"multiple","title":"Themed Geography Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","inclTimer":"true","showTipBtn":"false","showSolutionBtn":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#E0E0E0","titleBg":"#1A1A2E","questionCol":"#1C1C1C","questionBg":"#F7F7F7","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#E94560","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtPrevious":"Previous","txtNext":"Next","txtTotalQuestions":"Total Questions","txtTotalScore":"Total Score","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Correct answer","txtTryAgain":"Try again","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtNumberOfCorrectAnswers":"Number of correct answers","txtShowSolution":"Show solution","txtHideSolution":"Hide solution"},"evals":[],"jsHooks":[]}# }
```

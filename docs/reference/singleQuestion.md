# Create a single-question quiz (single-choice or multiple-choice)

`singleQuestion` creates an interactive quiz with one question. It
supports both single-choice and multiple-choice modes, which are
auto-detected from the `answer` field (single integer = SC, vector of
integers = MC).

## Usage

``` r
singleQuestion(
  x,
  title = NULL,
  language = "en",
  shuffle = FALSE,
  showTipButton = FALSE,
  showSolutionButton = TRUE,
  width = "100%",
  height = "500px",
  center = TRUE,
  scroll = FALSE,
  fontFamily = "'Helvetica Neue', Helvetica, Arial, sans-serif",
  fontSize = 16,
  titleFontSize = 20,
  questionFontSize = 16,
  titleAlign = "center",
  titleCol = "#FFFFFF",
  titleBg = "#7E7E7E",
  questionCol = "white",
  questionBg = "#5F5F5F",
  mainCol = "#1C1C1C",
  mainBg = "#F7F7F7",
  optionBg = "#ECECEC",
  optionLabelBg = "#3498DB",
  navButtonCol = "#FFFFFF",
  navButtonBg = "#28A745",
  tipButtonCol = "#1C1C1C",
  tipButtonBg = "#F1F1F1",
  solutionButtonCol = "#1C1C1C",
  solutionButtonBg = "#F1F1F1",
  tipAreaCol = "#1C1C1C",
  tipAreaBg = "#E7F9E7",
  tipAreaBorder = "#28A745",
  solutionAreaCol = "#1C1C1C",
  solutionAreaBg = "#D6EAF8",
  solutionAreaBorder = "#3498DB",
  theme = NULL
)
```

## Arguments

- x:

  A list containing 3 or 4 elements (which can be named for better
  readability):

  - `$question` A string providing the actual question.

  - `$options` A character vector containing all answer options.

  - `$answer` An integer indicating the correct answer option
    (single-choice) or a numeric vector of indices indicating all
    correct answer options (multiple-choice). The quiz mode is
    auto-detected from the length of this field.

  - `$tip` (optional) A string providing a custom tip text, shown when
    `showTipButton = TRUE`. In multiple-choice mode, if omitted, the
    number of correct answers is shown as the default tip. In
    single-choice mode, the tip button only appears if a custom tip is
    provided.

  Use
  [`checkSingleQuestion`](https://saskiaotto.github.io/rquiz/reference/checkSingleQuestion.md)
  to validate the input before passing it.

- title:

  character; the title text. If set to `NULL` (default) the header box
  will not be shown.

- language:

  character; the language of the quiz interface. Sets button labels,
  feedback messages and other UI text automatically. Currently
  supported: `"en"` (English, default), `"de"` (German), `"fr"`
  (French), and `"es"` (Spanish). To request additional languages,
  please open an issue on GitHub.

- shuffle:

  logical; if `TRUE`, the answer options are displayed in a random order
  each time the widget is rendered. The correct answer mapping is
  preserved. The default is `FALSE`.

- showTipButton:

  logical; whether to show a tip button. If `TRUE` and `x` contains a
  4th element (e.g. `$tip`), the tip text is displayed. In
  multiple-choice mode without a custom tip, the number of correct
  answers is shown as a default tip. In single-choice mode, the button
  is only shown if a custom tip text is provided in `x[[4]]`. The
  default is `FALSE`.

- showSolutionButton:

  logical; whether to show a solution button that reveals the correct
  answer(s). The default is `TRUE`.

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

  integer; the font size in pixels for the answer option text. All other
  properties (margins, letter buttons, etc.) are rescaled accordingly.
  The default is `16`.

- titleFontSize:

  integer; the font size in pixels for the title. The default is `20`.

- questionFontSize:

  integer; the font size in pixels for the question text. The default is
  `16`.

- titleAlign:

  character; the alignment of the title text. One of `"left"`,
  `"center"` (default), or `"right"`.

- titleCol:

  character; the title text color as hex color or R color name. The
  default is `"#FFFFFF"`.

- titleBg:

  character; the title background color as hex color or R color name.
  The default is `"#7E7E7E"`.

- questionCol:

  character; the question text color as hex color or R color name. The
  default is `"white"`. This container also changes color to provide
  visual feedback (green for correct, red for wrong).

- questionBg:

  character; the question background color as hex color or R color name.
  The default is `"#5F5F5F"`.

- mainCol:

  character; the text color in the main content area (answer options).
  The default is `"#1C1C1C"`.

- mainBg:

  character; the background color of the main content area. The default
  is `"#F7F7F7"`.

- optionBg:

  character; the background color of the answer option rows. The hover
  color is automatically derived (30% darker). The default is
  `"#ECECEC"`.

- optionLabelBg:

  character; the background color of the A/B/C/D option labels. The
  hover color is automatically derived (20% darker). The default is
  `"#3498DB"`.

- navButtonCol:

  character; the navigation/submit button text color. The default is
  `"#FFFFFF"`.

- navButtonBg:

  character; the navigation/submit button background color. The default
  is `"#28A745"`.

- tipButtonCol:

  character; the tip button text color. The default is `"#1C1C1C"`.

- tipButtonBg:

  character; the tip button background color. The default is
  `"#F1F1F1"`.

- solutionButtonCol:

  character; the solution button text color. The default is `"#1C1C1C"`.

- solutionButtonBg:

  character; the solution button background color. The default is
  `"#F1F1F1"`.

- tipAreaCol:

  character; the text color of the tip text area. The default is
  `"#1C1C1C"`.

- tipAreaBg:

  character; the background color of the tip text area. The default is
  `"#E7F9E7"`.

- tipAreaBorder:

  character; the border color of the tip text area. The default is
  `"#28A745"`.

- solutionAreaCol:

  character; the text color of the solution text area. The default is
  `"#1C1C1C"`.

- solutionAreaBg:

  character; the background color of the solution text area. The default
  is `"#D6EAF8"`.

- solutionAreaBorder:

  character; the border color of the solution text area. The default is
  `"#3498DB"`.

- theme:

  an optional
  [`rquizTheme`](https://saskiaotto.github.io/rquiz/reference/rquizTheme.md)
  object. Theme values are used as defaults and are overridden by any
  explicitly passed arguments.

## Value

An HTML widget object of class `singleQuestion` that can be rendered in
R Markdown/Quarto documents, Shiny applications, or the RStudio viewer.

## Details

In **single-choice mode**, clicking an answer option gives immediate
visual feedback: green (correct) or red (wrong).

In **multiple-choice mode**, the user selects one or more options and
clicks Submit. If the answer is wrong, a feedback message indicates how
many correct and wrong selections were made. The Submit button is
disabled after each attempt and re-enabled when the selection changes,
allowing the user to adjust and retry. Optional Tip and Solution buttons
provide additional help.

**Text formatting:** Since quiz content is rendered as HTML, you can use
HTML tags in question and option strings: `<em>` for italics (e.g.
species names), `<strong>` for bold, `<code>` for inline code, or
`<span>` with inline CSS for colored text. Standard Markdown formatting
does *not* work inside quiz strings.

## See also

[`checkSingleQuestion`](https://saskiaotto.github.io/rquiz/reference/checkSingleQuestion.md)
for input validation,
[`multiQuestions`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md)
for multi-page quizzes,
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

myQuestionSC <- list(
  question = "Which city hosted the 2024 Summer Olympics?",
  options = c("Athens", "London", "Paris", "Tokyo"),
  answer = 3  # (i.e. Paris)
)

### Check if list has the correct format
checkSingleQuestion(myQuestionSC)   # passes

### Default (includes solution button)
singleQuestion(x = myQuestionSC)

{"x":{"question":"[ \"Which city hosted the 2024 Summer Olympics?\", [\"Athens\", \"London\", \"Paris\", \"Tokyo\"], \"Paris\" ]","choice":"single","title":"NULL","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"false","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
### With title and shuffled options
singleQuestion(x = myQuestionSC, title = "Sports Quiz", shuffle = TRUE)

{"x":{"question":"[ \"Which city hosted the 2024 Summer Olympics?\", [\"Athens\", \"London\", \"Paris\", \"Tokyo\"], \"Paris\" ]","choice":"single","title":"Sports Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"false","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
### Without the solution button
singleQuestion(x = myQuestionSC, showSolutionButton = FALSE)

{"x":{"question":"[ \"Which city hosted the 2024 Summer Olympics?\", [\"Athens\", \"London\", \"Paris\", \"Tokyo\"], \"Paris\" ]","choice":"single","title":"NULL","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"false","tipText":"","showSolutionBtn":"false","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
### With tip button (requires tip text in the question list)
myQuestionSCwithTip <- list(
  question = "Which city hosted the 2024 Summer Olympics?",
  options = c("Athens", "London", "Paris", "Tokyo"),
  answer = 3,
  tip = "Think about the Eiffel Tower."
)
singleQuestion(x = myQuestionSCwithTip, showTipButton = TRUE)

{"x":{"question":"[ \"Which city hosted the 2024 Summer Olympics?\", [\"Athens\", \"London\", \"Paris\", \"Tokyo\"], \"Paris\" ]","choice":"single","title":"NULL","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"true","tipText":"Think about the Eiffel Tower.","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
### Changing the window size
singleQuestion(x = myQuestionSC, width = "50%")

{"x":{"question":"[ \"Which city hosted the 2024 Summer Olympics?\", [\"Athens\", \"London\", \"Paris\", \"Tokyo\"], \"Paris\" ]","choice":"single","title":"NULL","width":"50%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"false","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}singleQuestion(x = myQuestionSC, width = "50%", center = FALSE)

{"x":{"question":"[ \"Which city hosted the 2024 Summer Olympics?\", [\"Athens\", \"London\", \"Paris\", \"Tokyo\"], \"Paris\" ]","choice":"single","title":"NULL","width":"50%","height":"500px","center":"false","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"false","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}# height works only with scroll = TRUE (useful for slide presentations):
singleQuestion(x = myQuestionSC, width = "50%",
  height = "300px", scroll = TRUE)

{"x":{"question":"[ \"Which city hosted the 2024 Summer Olympics?\", [\"Athens\", \"London\", \"Paris\", \"Tokyo\"], \"Paris\" ]","choice":"single","title":"NULL","width":"50%","height":"300px","center":"true","scroll":"true","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"false","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
### Changing the language (UI text changes automatically)
singleQuestion(x = myQuestionSCwithTip, language = "de",
  showTipButton = TRUE)

{"x":{"question":"[ \"Which city hosted the 2024 Summer Olympics?\", [\"Athens\", \"London\", \"Paris\", \"Tokyo\"], \"Paris\" ]","choice":"single","title":"NULL","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"true","tipText":"Think about the Eiffel Tower.","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Absenden","txtShowTips":"Tipps anzeigen","txtHideTips":"Tipps ausblenden","txtShowSolution":"Lösung anzeigen","txtHideSolution":"Lösung ausblenden","txtNumberOfCorrectAnswers":"Anzahl richtiger Antworten","txtCorrectAnswers":"Richtige Antworten","txtFeedbackCorrectSelected":"{n} von {total} richtigen Antworten ausgewählt.","txtFeedbackWrongOptions":"{n} falsche {option} ausgewählt.","txtFeedbackMissing":"{n} richtige {answer} fehlt/fehlen.","txtOptionSingular":"Option","txtOptionPlural":"Optionen","txtAnswerSingular":"Antwort","txtAnswerPlural":"Antworten"},"evals":[],"jsHooks":[]}
### Customizing the design (dark theme):
singleQuestion(x = myQuestionSCwithTip,
  showTipButton = TRUE,
  title = "Sports Quiz",
  fontFamily = "Georgia, serif",
  fontSize = 20, titleFontSize = 14, titleAlign = "left",
  titleCol = "#E0E0E0", titleBg = "#1A1A2E",
  questionCol = "#FFFFFF", questionBg = "#16213E",
  mainCol = "#E0E0E0", mainBg = "#1A1B2E",
  optionBg = "#252540", optionLabelBg = "#0F3460",
  navButtonCol = "#FFFFFF", navButtonBg = "#E94560",
  tipButtonCol = "#E0E0E0", tipButtonBg = "#2C2C3E",
  solutionButtonCol = "#E0E0E0", solutionButtonBg = "#2C2C3E",
  tipAreaCol = "#E0E0E0", tipAreaBg = "#1A2A1A", tipAreaBorder = "#4CAF50",
  solutionAreaCol = "#E0E0E0", solutionAreaBg = "#1A1A2E",
  solutionAreaBorder = "#5DADE2")

{"x":{"question":"[ \"Which city hosted the 2024 Summer Olympics?\", [\"Athens\", \"London\", \"Paris\", \"Tokyo\"], \"Paris\" ]","choice":"single","title":"Sports Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"Georgia, serif","fontSize":20,"titleFontSize":14,"questionFontSize":16,"titleAlign":"left","titleCol":"#E0E0E0","titleBg":"#1A1A2E","questionCol":"#FFFFFF","questionBg":"#16213E","mainCol":"#E0E0E0","mainBg":"#1A1B2E","optionBg":"#252540","optionLabelBg":"#0F3460","showTipBtn":"true","tipText":"Think about the Eiffel Tower.","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#E94560","tipBtnCol":"#E0E0E0","tipBtnBg":"#2C2C3E","solutionBtnCol":"#E0E0E0","solutionBtnBg":"#2C2C3E","tipAreaCol":"#E0E0E0","tipAreaBg":"#1A2A1A","tipAreaBorder":"#4CAF50","solutionAreaCol":"#E0E0E0","solutionAreaBg":"#1A1A2E","solutionAreaBorder":"#5DADE2","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}

# --- MULTIPLE-CHOICE MODE (auto-detected from answer vector) ---

myQuestionMC <- list(
  question = "Which of the following are European capital cities?",
  options = c("Berlin", "Sydney", "Paris", "Tokyo", "Rome"),
  answer = c(1, 3, 5)  # Berlin, Paris, Rome
)

### Default (auto-detected as MC because answer has 3 elements)
singleQuestion(x = myQuestionMC)

{"x":{"question":"[ \"Which of the following are European capital cities?\", [\"Berlin\", \"Sydney\", \"Paris\", \"Tokyo\", \"Rome\"], [\"Berlin\", \"Paris\", \"Rome\"] ]","choice":"multiple","title":"NULL","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"false","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
### With title and shuffled options
singleQuestion(x = myQuestionMC,
  title = "Geography Quiz", shuffle = TRUE)

{"x":{"question":"[ \"Which of the following are European capital cities?\", [\"Berlin\", \"Sydney\", \"Paris\", \"Tokyo\", \"Rome\"], [\"Berlin\", \"Paris\", \"Rome\"] ]","choice":"multiple","title":"Geography Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"false","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
### Without the solution button
singleQuestion(x = myQuestionMC, showSolutionButton = FALSE)

{"x":{"question":"[ \"Which of the following are European capital cities?\", [\"Berlin\", \"Sydney\", \"Paris\", \"Tokyo\", \"Rome\"], [\"Berlin\", \"Paris\", \"Rome\"] ]","choice":"multiple","title":"NULL","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"false","tipText":"","showSolutionBtn":"false","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
### With tip button (auto-generated: shows number of correct answers)
singleQuestion(x = myQuestionMC, showTipButton = TRUE)

{"x":{"question":"[ \"Which of the following are European capital cities?\", [\"Berlin\", \"Sydney\", \"Paris\", \"Tokyo\", \"Rome\"], [\"Berlin\", \"Paris\", \"Rome\"] ]","choice":"multiple","title":"NULL","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"true","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
### With custom tip text
myQuestionMCwithTip <- list(
  question = "Which of the following are European capital cities?",
  options = c("Berlin", "Sydney", "Paris", "Tokyo", "Rome"),
  answer = c(1, 3, 5),
  tip = "Three of the five cities are in Europe."
)
singleQuestion(x = myQuestionMCwithTip, showTipButton = TRUE)

{"x":{"question":"[ \"Which of the following are European capital cities?\", [\"Berlin\", \"Sydney\", \"Paris\", \"Tokyo\", \"Rome\"], [\"Berlin\", \"Paris\", \"Rome\"] ]","choice":"multiple","title":"NULL","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"true","tipText":"Three of the five cities are in Europe.","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
### Changing the window size
singleQuestion(x = myQuestionMC, width = "50%")

{"x":{"question":"[ \"Which of the following are European capital cities?\", [\"Berlin\", \"Sydney\", \"Paris\", \"Tokyo\", \"Rome\"], [\"Berlin\", \"Paris\", \"Rome\"] ]","choice":"multiple","title":"NULL","width":"50%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"false","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}singleQuestion(x = myQuestionMC, width = "50%",
  height = "450px", scroll = TRUE)

{"x":{"question":"[ \"Which of the following are European capital cities?\", [\"Berlin\", \"Sydney\", \"Paris\", \"Tokyo\", \"Rome\"], [\"Berlin\", \"Paris\", \"Rome\"] ]","choice":"multiple","title":"NULL","width":"50%","height":"450px","center":"true","scroll":"true","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"false","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
### Changing the language (button labels change automatically)
singleQuestion(x = myQuestionMC, showTipButton = TRUE, language = "de")

{"x":{"question":"[ \"Which of the following are European capital cities?\", [\"Berlin\", \"Sydney\", \"Paris\", \"Tokyo\", \"Rome\"], [\"Berlin\", \"Paris\", \"Rome\"] ]","choice":"multiple","title":"NULL","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"true","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Absenden","txtShowTips":"Tipps anzeigen","txtHideTips":"Tipps ausblenden","txtShowSolution":"Lösung anzeigen","txtHideSolution":"Lösung ausblenden","txtNumberOfCorrectAnswers":"Anzahl richtiger Antworten","txtCorrectAnswers":"Richtige Antworten","txtFeedbackCorrectSelected":"{n} von {total} richtigen Antworten ausgewählt.","txtFeedbackWrongOptions":"{n} falsche {option} ausgewählt.","txtFeedbackMissing":"{n} richtige {answer} fehlt/fehlen.","txtOptionSingular":"Option","txtOptionPlural":"Optionen","txtAnswerSingular":"Antwort","txtAnswerPlural":"Antworten"},"evals":[],"jsHooks":[]}singleQuestion(x = myQuestionMC, showTipButton = TRUE, language = "fr")

{"x":{"question":"[ \"Which of the following are European capital cities?\", [\"Berlin\", \"Sydney\", \"Paris\", \"Tokyo\", \"Rome\"], [\"Berlin\", \"Paris\", \"Rome\"] ]","choice":"multiple","title":"NULL","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"true","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Valider","txtShowTips":"Afficher les indices","txtHideTips":"Masquer les indices","txtShowSolution":"Afficher la solution","txtHideSolution":"Masquer la solution","txtNumberOfCorrectAnswers":"Nombre de bonnes réponses","txtCorrectAnswers":"Bonnes réponses","txtFeedbackCorrectSelected":"{n} sur {total} bonnes réponses sélectionnées.","txtFeedbackWrongOptions":"{n} mauvaise(s) {option} sélectionnée(s).","txtFeedbackMissing":"{n} bonne(s) {answer} manquante(s).","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"réponse","txtAnswerPlural":"réponses"},"evals":[],"jsHooks":[]}singleQuestion(x = myQuestionMC, showTipButton = TRUE, language = "es")

{"x":{"question":"[ \"Which of the following are European capital cities?\", [\"Berlin\", \"Sydney\", \"Paris\", \"Tokyo\", \"Rome\"], [\"Berlin\", \"Paris\", \"Rome\"] ]","choice":"multiple","title":"NULL","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"white","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"true","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Enviar","txtShowTips":"Mostrar pistas","txtHideTips":"Ocultar pistas","txtShowSolution":"Mostrar solución","txtHideSolution":"Ocultar solución","txtNumberOfCorrectAnswers":"Número de respuestas correctas","txtCorrectAnswers":"Respuestas correctas","txtFeedbackCorrectSelected":"{n} de {total} respuestas correctas seleccionadas.","txtFeedbackWrongOptions":"{n} {option} incorrecta(s) seleccionada(s).","txtFeedbackMissing":"{n} {answer} correcta(s) faltante(s).","txtOptionSingular":"opción","txtOptionPlural":"opciones","txtAnswerSingular":"respuesta","txtAnswerPlural":"respuestas"},"evals":[],"jsHooks":[]}
### Customizing the design (dark theme)
singleQuestion(x = myQuestionMCwithTip,
  showTipButton = TRUE,
  title = "Geography Quiz",
  fontFamily = "Georgia, serif",
  fontSize = 20, titleFontSize = 14, titleAlign = "left",
  titleCol = "#E0E0E0", titleBg = "#1A1A2E",
  questionCol = "#FFFFFF", questionBg = "#16213E",
  mainCol = "#E0E0E0", mainBg = "#1A1B2E",
  optionBg = "#252540", optionLabelBg = "#0F3460",
  navButtonCol = "#FFFFFF", navButtonBg = "#E94560",
  tipButtonCol = "#E0E0E0", tipButtonBg = "#2C2C3E",
  solutionButtonCol = "#E0E0E0", solutionButtonBg = "#2C2C3E",
  tipAreaCol = "#E0E0E0", tipAreaBg = "#1A2A1A", tipAreaBorder = "#4CAF50",
  solutionAreaCol = "#E0E0E0", solutionAreaBg = "#1A1A2E",
  solutionAreaBorder = "#5DADE2")

{"x":{"question":"[ \"Which of the following are European capital cities?\", [\"Berlin\", \"Sydney\", \"Paris\", \"Tokyo\", \"Rome\"], [\"Berlin\", \"Paris\", \"Rome\"] ]","choice":"multiple","title":"Geography Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"Georgia, serif","fontSize":20,"titleFontSize":14,"questionFontSize":16,"titleAlign":"left","titleCol":"#E0E0E0","titleBg":"#1A1A2E","questionCol":"#FFFFFF","questionBg":"#16213E","mainCol":"#E0E0E0","mainBg":"#1A1B2E","optionBg":"#252540","optionLabelBg":"#0F3460","showTipBtn":"true","tipText":"Three of the five cities are in Europe.","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#E94560","tipBtnCol":"#E0E0E0","tipBtnBg":"#2C2C3E","solutionBtnCol":"#E0E0E0","solutionBtnBg":"#2C2C3E","tipAreaCol":"#E0E0E0","tipAreaBg":"#1A2A1A","tipAreaBorder":"#4CAF50","solutionAreaCol":"#E0E0E0","solutionAreaBg":"#1A1A2E","solutionAreaBorder":"#5DADE2","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
### Using a reusable theme
dark <- rquizTheme(
  titleCol = "#E0E0E0", titleBg = "#1A1A2E",
  questionCol = "#FFFFFF", questionBg = "#16213E",
  navButtonBg = "#E94560"
)
singleQuestion(x = myQuestionMC, theme = dark, title = "Themed Quiz")

{"x":{"question":"[ \"Which of the following are European capital cities?\", [\"Berlin\", \"Sydney\", \"Paris\", \"Tokyo\", \"Rome\"], [\"Berlin\", \"Paris\", \"Rome\"] ]","choice":"multiple","title":"Themed Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#E0E0E0","titleBg":"#1A1A2E","questionCol":"#FFFFFF","questionBg":"#16213E","mainCol":"#1C1C1C","mainBg":"#F7F7F7","optionBg":"#ECECEC","optionLabelBg":"#3498DB","showTipBtn":"false","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#E94560","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}# }
```

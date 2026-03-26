# Create a reusable quiz theme

Defines a set of design parameters that can be applied to any rquiz
function
([`singleQuestion`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md),
[`multiQuestions`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md),
[`fillBlanks`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)).
Parameters not recognized by a particular quiz type are silently
ignored. Explicit values passed directly to a quiz function always
override theme values.

## Usage

``` r
rquizTheme(
  language = NULL,
  shuffle = NULL,
  showTipButton = NULL,
  showSolutionButton = NULL,
  width = NULL,
  height = NULL,
  center = NULL,
  scroll = NULL,
  fontFamily = NULL,
  fontSize = NULL,
  titleFontSize = NULL,
  titleAlign = NULL,
  titleCol = NULL,
  titleBg = NULL,
  questionCol = NULL,
  questionBg = NULL,
  questionFontSize = NULL,
  mainCol = NULL,
  mainBg = NULL,
  optionBg = NULL,
  optionLabelBg = NULL,
  timerCol = NULL,
  navButtonCol = NULL,
  navButtonBg = NULL,
  tipButtonCol = NULL,
  tipButtonBg = NULL,
  solutionButtonCol = NULL,
  solutionButtonBg = NULL,
  tipAreaCol = NULL,
  tipAreaBg = NULL,
  tipAreaBorder = NULL,
  solutionAreaCol = NULL,
  solutionAreaBg = NULL,
  solutionAreaBorder = NULL,
  descriptFontSize = NULL
)
```

## Arguments

- language:

  character; language for UI text (`"en"`, `"de"`, `"fr"`, `"es"`).

- shuffle:

  logical; whether to randomize options/question order.

- showTipButton:

  logical; whether to show a tip button.

- showSolutionButton:

  logical; whether to show a solution button.

- width:

  character; widget width (CSS value).

- height:

  character; widget height (CSS value).

- center:

  logical; whether to center the widget.

- scroll:

  logical; whether to use a fixed height with scrollbar.

- fontFamily:

  character; font stack for all text.

- fontSize:

  numeric; base font size in pixels.

- titleFontSize:

  numeric; title font size in pixels.

- titleAlign:

  character; title text alignment.

- titleCol:

  character; title text color.

- titleBg:

  character; title background color.

- questionCol:

  character; text color of the question container (singleQuestion,
  multiQuestions) or description container (fillBlanks). This container
  also provides visual feedback (green/red) in singleQuestion and
  fillBlanks.

- questionBg:

  character; background color of the question/description container (all
  quiz types).

- questionFontSize:

  numeric; question font size (singleQuestion, multiQuestions).

- mainCol:

  character; text color of the main content area and answer options (all
  quiz types).

- mainBg:

  character; background color of the main content area (all quiz types).

- optionBg:

  character; background color of answer option rows/blocks
  (singleQuestion, multiQuestions). Hover is auto-derived (30% darker).

- optionLabelBg:

  character; A/B/C label background (singleQuestion only).

- timerCol:

  character; timer text color (multiQuestions only).

- navButtonCol:

  character; navigation/submit button text color (all quiz types).

- navButtonBg:

  character; navigation/submit button background color (all quiz types).

- tipButtonCol:

  character; tip button text color.

- tipButtonBg:

  character; tip button background color.

- solutionButtonCol:

  character; solution button text color.

- solutionButtonBg:

  character; solution button background color.

- tipAreaCol:

  character; tip area text color.

- tipAreaBg:

  character; tip area background color.

- tipAreaBorder:

  character; tip area border color.

- solutionAreaCol:

  character; solution area text color.

- solutionAreaBg:

  character; solution area background color.

- solutionAreaBorder:

  character; solution area border color.

- descriptFontSize:

  numeric; description font size (fillBlanks only).

## Value

A named list of class `"rquizTheme"` containing all specified
parameters. Only non-NULL values are included.

## See also

[`singleQuestion`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md),
[`multiQuestions`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md),
[`fillBlanks`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
— all accept a `theme` argument.

## Examples

``` r
# Create a dark theme with shared + quiz-specific settings
dark <- rquizTheme(
  fontFamily = "Georgia, serif",
  fontSize = 20,
  titleCol = "#E0E0E0", titleBg = "#1A1A2E",
  questionCol = "#FFFFFF", questionBg = "#16213E",
  mainCol = "#E0E0E0", mainBg = "#1A1B2E",
  optionBg = "#252540", optionLabelBg = "#0F3460",
  navButtonCol = "#FFFFFF", navButtonBg = "#E94560",
  tipButtonCol = "#E0E0E0", tipButtonBg = "#2C2C3E",
  solutionButtonCol = "#E0E0E0", solutionButtonBg = "#2C2C3E",
  tipAreaCol = "#E0E0E0", tipAreaBg = "#1A2A1A",
  tipAreaBorder = "#4CAF50",
  solutionAreaCol = "#E0E0E0", solutionAreaBg = "#1A1A2E",
  solutionAreaBorder = "#5DADE2"
)

# \donttest{
# Apply to singleQuestion:
singleQuestion(
  x = list(
    question = "Which ocean is the largest?",
    options = c("Atlantic", "Indian", "Pacific", "Arctic"),
    answer = 3
  ),
  theme = dark, title = "Geography Quiz"
)

{"x":{"question":"[ \"Which ocean is the largest?\", [\"Atlantic\", \"Indian\", \"Pacific\", \"Arctic\"], \"Pacific\" ]","choice":"single","title":"Geography Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"Georgia, serif","fontSize":20,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#E0E0E0","titleBg":"#1A1A2E","questionCol":"#FFFFFF","questionBg":"#16213E","mainCol":"#E0E0E0","mainBg":"#1A1B2E","optionBg":"#252540","optionLabelBg":"#0F3460","showTipBtn":"false","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#E94560","tipBtnCol":"#E0E0E0","tipBtnBg":"#2C2C3E","solutionBtnCol":"#E0E0E0","solutionBtnBg":"#2C2C3E","tipAreaCol":"#E0E0E0","tipAreaBg":"#1A2A1A","tipAreaBorder":"#4CAF50","solutionAreaCol":"#E0E0E0","solutionAreaBg":"#1A1A2E","solutionAreaBorder":"#5DADE2","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}
# Apply to multiQuestions (uses mainCol, mainBg, navButtonBg, etc.):
multiQuestions(
  x = list(
    q1 = list(
      question = "What is the capital of Japan?",
      options = c("Seoul", "Tokyo", "Beijing"),
      answer = 2
    ),
    q2 = list(
      question = "Which river is the longest?",
      options = c("Amazon", "Nile", "Yangtze"),
      answer = 2
    )
  ),
  theme = dark, title = "Geography Quiz"
)

{"x":{"questions":"[{\"id\":1,\"question\":\"What is the capital of Japan?\",\"options\":[{\"a\":\"Seoul\",\"b\":\"Tokyo\",\"c\":\"Beijing\"}],\"answer\":\"Tokyo\",\"tip\":\"\",\"score\":0,\"status\":\"\"},{\"id\":2,\"question\":\"Which river is the longest?\",\"options\":[{\"a\":\"Amazon\",\"b\":\"Nile\",\"c\":\"Yangtze\"}],\"answer\":\"Nile\",\"tip\":\"\",\"score\":0,\"status\":\"\"}]","choice":"single","title":"Geography Quiz","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","inclTimer":"true","showTipBtn":"false","showSolutionBtn":"true","fontFamily":"Georgia, serif","fontSize":20,"titleFontSize":20,"questionFontSize":16,"titleAlign":"left","titleCol":"#E0E0E0","titleBg":"#1A1A2E","questionCol":"#FFFFFF","questionBg":"#16213E","mainCol":"#E0E0E0","mainBg":"#1A1B2E","optionBg":"#252540","timerCol":"#1C1C1C","navBtnCol":"#FFFFFF","navBtnBg":"#E94560","tipBtnCol":"#E0E0E0","tipBtnBg":"#2C2C3E","tipAreaCol":"#E0E0E0","tipAreaBg":"#1A2A1A","tipAreaBorder":"#4CAF50","solutionBtnCol":"#E0E0E0","solutionBtnBg":"#2C2C3E","solutionAreaCol":"#E0E0E0","solutionAreaBg":"#1A1A2E","solutionAreaBorder":"#5DADE2","txtPrevious":"Previous","txtNext":"Next","txtTotalQuestions":"Total Questions","txtTotalScore":"Total Score","txtScore":"Score","txtQuestion":"Q","txtCorrectAnswer":"Correct answer","txtTryAgain":"Try again","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtNumberOfCorrectAnswers":"Number of correct answers","txtShowSolution":"Show solution","txtHideSolution":"Hide solution"},"evals":[],"jsHooks":[]}
# Apply to fillBlanks:
fillBlanks(
  x = list(
    cloze = "The $$!Nile!$$ is the longest river in $$!Africa!$$."
  ),
  theme = dark, title = "Geography Quiz"
)

{"x":{"convCloze":"The <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> is the longest river in <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>.","convAnswers":["Nile","Africa"],"convOptions":"<span class='fbq-option'>Nile<\/span> <span class='fbq-option'>Africa<\/span>","title":"Geography Quiz","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"Georgia, serif","fontSize":20,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#E0E0E0","titleBg":"#1A1A2E","questionCol":"#FFFFFF","questionBg":"#16213E","mainCol":"#E0E0E0","mainBg":"#1A1B2E","navBtnCol":"#FFFFFF","navBtnBg":"#E94560","tipBtnCol":"#E0E0E0","tipBtnBg":"#2C2C3E","solutionBtnCol":"#E0E0E0","solutionBtnBg":"#2C2C3E","tipAreaCol":"#E0E0E0","tipAreaBg":"#1A2A1A","tipAreaBorder":"#4CAF50","solutionAreaCol":"#E0E0E0","solutionAreaBg":"#1A1A2E","solutionAreaBorder":"#5DADE2"},"evals":[],"jsHooks":[]}
# Explicit values override the theme:
singleQuestion(
  x = list(
    question = "Which ocean is the largest?",
    options = c("Atlantic", "Indian", "Pacific", "Arctic"),
    answer = 3
  ),
  theme = dark, titleBg = "#FF0000"
)

{"x":{"question":"[ \"Which ocean is the largest?\", [\"Atlantic\", \"Indian\", \"Pacific\", \"Arctic\"], \"Pacific\" ]","choice":"single","title":"NULL","width":"100%","height":"500px","center":"true","scroll":"false","shuffle":"false","fontFamily":"Georgia, serif","fontSize":20,"titleFontSize":20,"questionFontSize":16,"titleAlign":"center","titleCol":"#E0E0E0","titleBg":"#FF0000","questionCol":"#FFFFFF","questionBg":"#16213E","mainCol":"#E0E0E0","mainBg":"#1A1B2E","optionBg":"#252540","optionLabelBg":"#0F3460","showTipBtn":"false","tipText":"","showSolutionBtn":"true","navBtnCol":"#FFFFFF","navBtnBg":"#E94560","tipBtnCol":"#E0E0E0","tipBtnBg":"#2C2C3E","solutionBtnCol":"#E0E0E0","solutionBtnBg":"#2C2C3E","tipAreaCol":"#E0E0E0","tipAreaBg":"#1A2A1A","tipAreaBorder":"#4CAF50","solutionAreaCol":"#E0E0E0","solutionAreaBg":"#1A1A2E","solutionAreaBorder":"#5DADE2","txtSubmit":"Submit","txtShowTips":"Show tips","txtHideTips":"Hide tips","txtShowSolution":"Show solution","txtHideSolution":"Hide solution","txtNumberOfCorrectAnswers":"Number of correct answers","txtCorrectAnswers":"Correct answers","txtFeedbackCorrectSelected":"{n} of {total} correct answers selected.","txtFeedbackWrongOptions":"{n} wrong {option} selected.","txtFeedbackMissing":"{n} correct {answer} missing.","txtOptionSingular":"option","txtOptionPlural":"options","txtAnswerSingular":"answer","txtAnswerPlural":"answers"},"evals":[],"jsHooks":[]}# }
```

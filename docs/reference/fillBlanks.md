# Create a fill-in-the-blank cloze quiz

`fillBlanks` creates an interactive cloze (fill-in-the-blank) quiz where
users type missing words into blank fields. Blank fields are defined by
placing answer text between `$$!` and `!$$` markers in the cloze string.
A submit button checks all answers at once. The description container
changes color as feedback: green if all answers are correct, red
otherwise (with an alert showing the score). Optional tip and solution
buttons provide additional help.

## Usage

``` r
fillBlanks(
  x,
  title = NULL,
  description = NULL,
  language = "en",
  showTipButton = FALSE,
  showSolutionButton = TRUE,
  width = "100%",
  height = "500px",
  center = TRUE,
  scroll = FALSE,
  clozeWidth = "100%",
  clozeHeight = NULL,
  blanksWidth = "auto",
  blanksAlign = "center",
  fontFamily = "'Helvetica Neue', Helvetica, Arial, sans-serif",
  fontSize = 16,
  titleFontSize = 20,
  descriptFontSize = 16,
  titleAlign = "left",
  titleCol = "#FFFFFF",
  titleBg = "#7E7E7E",
  questionCol = "#FFFFFF",
  questionBg = "#5F5F5F",
  mainCol = "#1C1C1C",
  mainBg = "#F7F7F7",
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

  A named list containing:

  - `$cloze` (required) A character string with the full text. Words or
    phrases to become blanks are wrapped in `$$!answer!$$` markers.

  - `$addOptions` (optional) A character vector of additional (wrong)
    answer options shown in the tip area.

  Use
  [`checkFillBlanks`](https://saskiaotto.github.io/rquiz/reference/checkFillBlanks.md)
  to validate the input before passing it.

- title:

  character; the title text. If set to `NULL` (default), no title will
  be shown in the header box.

- description:

  character; a short description below the title. If set to `NULL`
  (default), a language-specific default text is used (e.g. "Fill in the
  blanks." for English, "Fülle die Lücken." for German). Set to `""`
  (empty string) to hide the description entirely.

- language:

  character; the language of the quiz interface. Sets button labels,
  result text, tips and description automatically. Currently supported:
  `"en"` (English, default), `"de"` (German), `"fr"` (French), and
  `"es"` (Spanish). To request additional languages, please open an
  issue on GitHub.

- showTipButton:

  logical; whether the tip button for answer options should be
  displayed. The default is `FALSE`.

- showSolutionButton:

  logical; whether the solution button should be displayed. The default
  is `TRUE`.

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

- clozeWidth:

  character; the width of the cloze section in pixels or percentage. The
  default is `"100%"`.

- clozeHeight:

  character or NULL; the minimum height of the cloze section. The
  default is `NULL` (auto). Set to e.g. `"250px"` for a fixed minimum
  height.

- blanksWidth:

  character; the width of blank input fields. The default is `"auto"`,
  which sizes fields based on the longest correct answer (minimum 50px).
  Set to a fixed value like `"150px"` or `NULL` for browser default.

- blanksAlign:

  character; the alignment of text in filled blanks. One of `"center"`
  (default), `"left"`, or `"right"`.

- fontFamily:

  character; the font family for all text elements in CSS style. The
  default is `"'Helvetica Neue', Helvetica, Arial, sans-serif"`.

- fontSize:

  integer; the font size in pixels for the main text elements. Other
  properties are rescaled accordingly. The default is `16`.

- titleFontSize:

  integer; the font size in pixels for the title. The default is `20`.

- descriptFontSize:

  integer; the font size in pixels for the description. The default is
  `16`.

- titleAlign:

  character; the alignment of the title text. One of `"left"` (default),
  `"center"`, or `"right"`.

- titleCol:

  character; the title (and description) text color as hex color or R
  color name. The default is `"#FFFFFF"`.

- titleBg:

  character; the title box background color as hex color or R color
  name. The default is `"#7E7E7E"`.

- questionCol:

  character; the description text color. The default is `"#FFFFFF"`.
  Named `questionCol` for consistency with
  [`singleQuestion`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md)
  and
  [`multiQuestions`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md),
  where this parameter controls the question container. In `fillBlanks`,
  it controls the description container, which also provides visual
  feedback after submission (green for all correct, red for errors).

- questionBg:

  character; the background color of the description container. The
  default is `"#5F5F5F"`.

- mainCol:

  character; the text color of the cloze content area. The default is
  `"#1C1C1C"`.

- mainBg:

  character; the background color of the main content area. The default
  is `"#F7F7F7"`.

- navButtonCol:

  character; the submit button text color. The default is `"#FFFFFF"`.

- navButtonBg:

  character; the submit button background color. The default is
  `"#28A745"`.

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

  character; the text color of the tip area. The default is `"#1C1C1C"`.

- tipAreaBg:

  character; the background color of the tip answer options area. The
  default is `"#E7F9E7"`.

- tipAreaBorder:

  character; the border color of the tip answer options area. The
  default is `"#28A745"`.

- solutionAreaCol:

  character; the text color of the solution area. The default is
  `"#1C1C1C"`.

- solutionAreaBg:

  character; the background color of the solution area. The default is
  `"#D6EAF8"`. Note: in fillBlanks, solutions are shown directly in the
  input fields, so this parameter is reserved for future use.

- solutionAreaBorder:

  character; the border color of the solution area. The default is
  `"#3498DB"`. See note for `solutionAreaBg`.

- theme:

  an optional
  [`rquizTheme`](https://saskiaotto.github.io/rquiz/reference/rquizTheme.md)
  object. Theme values are used as defaults and are overridden by any
  explicitly passed arguments.

## Value

An HTML widget object of class `fillBlanks` that can be rendered in R
Markdown/Quarto documents, Shiny applications, or the RStudio viewer.

## Details

Cloze exercises are widely used in language learning, programming
courses, and knowledge assessment. They can be flexibly tailored to meet
different learning needs.

**Cloze text format**

The full cloze text needs to be provided in one single string. Any word,
symbol or other text item that should be removed from the cloze and
become an answer option has to be placed between an opening 'tag' `$$!`
and a closing 'tag' `!$$`. In the following example the words
**programming** and **statistical computing** will be replaced with
blank fields and converted into blank input fields:

*x = list(cloze = "R is a \$\$!programming!\$\$ language and free
software environment for \$\$!statistical computing!\$\$ and
graphics.")*

To add more (but incorrect) answer options, simply add a character
vector named `$addOptions` to the input list.

**Formatting of cloze text**

The cloze string will be converted straight into html code. If you want
to format the text in a specific way, e.g. show some text parts in bold
or italic or a specific color, use HTML tags with inline CSS style:

*x = list(cloze = "R is a \$\$!programming!\$\$ \<b\>language\</b\> and
\<em\>free\</em\> software \<span
style='color:red'\>environment\</span\> for \$\$!statistical
computing!\$\$ and graphics.")*

Normal text wraps automatically. For monospace code blocks, use
**\<pre\>** tags — inside `<pre>`, line breaks require the **\<br\>**
tag (normal line breaks are ignored).

## See also

[`checkFillBlanks`](https://saskiaotto.github.io/rquiz/reference/checkFillBlanks.md)
for input validation,
[`singleQuestion`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md)
for choice quizzes,
[`multiQuestions`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md)
for multi-page quizzes,
[`rquizTheme`](https://saskiaotto.github.io/rquiz/reference/rquizTheme.md)
for reusable themes.

## Author

Saskia A. Otto

## Examples

``` r
# \donttest{
# --- BASIC USAGE ---
txt <- list(
  cloze = "R is a $$!programming!$$ language and free
    software environment for $$!statistical computing!$$
    and graphics."
)

### Check if list has the correct format
checkFillBlanks(txt)  # passes

### Default settings (solution button shown)
fillBlanks(x = txt)

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>programming<\/span> <span class='fbq-option'>statistical computing<\/span>","title":"NULL","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}
### Hide solution button
fillBlanks(x = txt, showSolutionButton = FALSE)

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>programming<\/span> <span class='fbq-option'>statistical computing<\/span>","title":"NULL","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"false","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}
### Tip button with additional wrong options
txtWithOptions <- list(
  cloze = "R is a $$!programming!$$ language and free
    software environment for $$!statistical computing!$$
    and graphics.",
  addOptions = c("natural", "colloquial", "movies", "audio")
)
fillBlanks(x = txtWithOptions, showTipButton = TRUE)

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>movies<\/span> <span class='fbq-option'>statistical computing<\/span> <span class='fbq-option'>audio<\/span> <span class='fbq-option'>natural<\/span> <span class='fbq-option'>programming<\/span> <span class='fbq-option'>colloquial<\/span>","title":"NULL","descript":"Fill in the blanks.","language":"en","showTipBtn":"true","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}
### Title and description
fillBlanks(x = txt, title = "What is R?",
  description = "Can you complete the following sentence?")

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>programming<\/span> <span class='fbq-option'>statistical computing<\/span>","title":"What is R?","descript":"Can you complete the following sentence?","language":"en","showTipBtn":"false","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}
### Changing the language
fillBlanks(x = txt, showTipButton = TRUE, language = "de")

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>programming<\/span> <span class='fbq-option'>statistical computing<\/span>","title":"NULL","descript":"Fülle die Lücken.","language":"de","showTipBtn":"true","showSolutionBtn":"true","txtSubmitBtn":"Absenden","txtTipBtnShow":"Tipps anzeigen","txtTipBtnHide":"Tipps ausblenden","txtSolutionBtnShow":"Lösung anzeigen","txtSolutionBtnHide":"Lösung ausblenden","tipIntro":"Wähle aus folgenden Optionen:","txtResultCorrect":"Du hast {score} von {total} richtig!","txtResultWrong":"Du hast {score} von {total} richtig!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}fillBlanks(x = txt, showTipButton = TRUE, language = "fr")

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>programming<\/span> <span class='fbq-option'>statistical computing<\/span>","title":"NULL","descript":"Remplissez les blancs.","language":"fr","showTipBtn":"true","showSolutionBtn":"true","txtSubmitBtn":"Valider","txtTipBtnShow":"Afficher les indices","txtTipBtnHide":"Masquer les indices","txtSolutionBtnShow":"Afficher la solution","txtSolutionBtnHide":"Masquer la solution","tipIntro":"Choisissez parmi les options suivantes :","txtResultCorrect":"Vous avez {score} sur {total} correct !","txtResultWrong":"Vous avez {score} sur {total} correct !","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}fillBlanks(x = txt, showTipButton = TRUE, language = "es")

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>statistical computing<\/span> <span class='fbq-option'>programming<\/span>","title":"NULL","descript":"Rellena los espacios en blanco.","language":"es","showTipBtn":"true","showSolutionBtn":"true","txtSubmitBtn":"Enviar","txtTipBtnShow":"Mostrar pistas","txtTipBtnHide":"Ocultar pistas","txtSolutionBtnShow":"Mostrar solución","txtSolutionBtnHide":"Ocultar solución","tipIntro":"Elige entre las siguientes opciones:","txtResultCorrect":"¡Has acertado {score} de {total}!","txtResultWrong":"¡Has acertado {score} de {total}!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}

# --- CHANGING THE STYLE ---

### Window and cloze size
fillBlanks(x = txt, width = "50%")

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>programming<\/span> <span class='fbq-option'>statistical computing<\/span>","title":"NULL","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"50%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}fillBlanks(x = txt, width = "50%", center = FALSE)

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>statistical computing<\/span> <span class='fbq-option'>programming<\/span>","title":"NULL","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"50%","height":"500px","center":"false","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}# height only works with scroll = TRUE
fillBlanks(x = txt, width = "50%", height = "200px", scroll = TRUE)

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>programming<\/span> <span class='fbq-option'>statistical computing<\/span>","title":"NULL","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"50%","height":"200px","center":"true","scroll":"true","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}fillBlanks(x = txt, clozeWidth = "50%")

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>statistical computing<\/span> <span class='fbq-option'>programming<\/span>","title":"NULL","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"50%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}fillBlanks(x = txt, clozeHeight = "300px")

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>programming<\/span> <span class='fbq-option'>statistical computing<\/span>","title":"NULL","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"300px","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}
### Blank field size and alignment
fillBlanks(x = txt, blanksWidth = "400px")

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='min-width:400px; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='min-width:400px; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>programming<\/span> <span class='fbq-option'>statistical computing<\/span>","title":"NULL","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"400px","blanksAlign":"center","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}fillBlanks(x = txt, blanksAlign = "left")

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:left'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:left'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>programming<\/span> <span class='fbq-option'>statistical computing<\/span>","title":"NULL","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"left","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}fillBlanks(x = txt, blanksAlign = "right")

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:right'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:right'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>programming<\/span> <span class='fbq-option'>statistical computing<\/span>","title":"NULL","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"right","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}
### Customizing the design: dark theme
fillBlanks(x = txtWithOptions,
  title = "What is R?", showTipButton = TRUE,
  fontFamily = "Georgia, serif",
  titleCol = "#E0E0E0", titleBg = "#1A1A2E",
  questionCol = "#FFFFFF", questionBg = "#16213E",
  mainCol = "#E0E0E0", mainBg = "#1A1B2E",
  navButtonCol = "#FFFFFF", navButtonBg = "#E94560",
  tipButtonCol = "#E0E0E0", tipButtonBg = "#2C2C3E",
  solutionButtonCol = "#E0E0E0", solutionButtonBg = "#2C2C3E",
  tipAreaCol = "#E0E0E0", tipAreaBg = "#1A2A1A",
  tipAreaBorder = "#4CAF50",
  solutionAreaCol = "#E0E0E0", solutionAreaBg = "#1A1A2E",
  solutionAreaBorder = "#5DADE2")

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>movies<\/span> <span class='fbq-option'>statistical computing<\/span> <span class='fbq-option'>programming<\/span> <span class='fbq-option'>audio<\/span> <span class='fbq-option'>colloquial<\/span> <span class='fbq-option'>natural<\/span>","title":"What is R?","descript":"Fill in the blanks.","language":"en","showTipBtn":"true","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"Georgia, serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#E0E0E0","titleBg":"#1A1A2E","questionCol":"#FFFFFF","questionBg":"#16213E","mainCol":"#E0E0E0","mainBg":"#1A1B2E","navBtnCol":"#FFFFFF","navBtnBg":"#E94560","tipBtnCol":"#E0E0E0","tipBtnBg":"#2C2C3E","solutionBtnCol":"#E0E0E0","solutionBtnBg":"#2C2C3E","tipAreaCol":"#E0E0E0","tipAreaBg":"#1A2A1A","tipAreaBorder":"#4CAF50","solutionAreaCol":"#E0E0E0","solutionAreaBg":"#1A1A2E","solutionAreaBorder":"#5DADE2"},"evals":[],"jsHooks":[]}
### Using a reusable theme
dark <- rquizTheme(
  titleCol = "#E0E0E0", titleBg = "#1A1A2E",
  questionCol = "#FFFFFF", questionBg = "#16213E",
  navButtonCol = "#FFFFFF", navButtonBg = "#E94560"
)
fillBlanks(x = txtWithOptions, theme = dark,
  title = "What is R?", showTipButton = TRUE)

{"x":{"convCloze":"R is a <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free    software environment for <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>    and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fbq-option'>audio<\/span> <span class='fbq-option'>statistical computing<\/span> <span class='fbq-option'>natural<\/span> <span class='fbq-option'>movies<\/span> <span class='fbq-option'>programming<\/span> <span class='fbq-option'>colloquial<\/span>","title":"What is R?","descript":"Fill in the blanks.","language":"en","showTipBtn":"true","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleAlign":"left","titleCol":"#E0E0E0","titleBg":"#1A1A2E","questionCol":"#FFFFFF","questionBg":"#16213E","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#E94560","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}

# --- CODE SYNTAX EXAMPLE ---

### Use <pre> tags for monospace formatting
codequiz <- list(
  cloze = "<pre>myFunc <- $$!function()!$$ { <br>
    print('Hello, world!') <br>
  $$!}!$$ <br>
  $$!myFunc()!$$</pre>",
  addOptions = c("function", ")", "myFunc")
)
fillBlanks(x = codequiz,
  title = "How to define and call a function",
  blanksAlign = "left")

{"x":{"convCloze":"<pre>myFunc <- <input type='text' class='fbq-target' data-accept='1' aria-label='Blank 1' style='; text-align:left'>&nbsp;<\/span> { <br>    print('Hello, world!') <br>  <input type='text' class='fbq-target' data-accept='2' aria-label='Blank 2' style='; text-align:left'>&nbsp;<\/span> <br>  <input type='text' class='fbq-target' data-accept='3' aria-label='Blank 3' style='; text-align:left'>&nbsp;<\/span><\/pre>","convAnswers":["function()","}","myFunc()"],"convOptions":"<span class='fbq-option'>}<\/span> <span class='fbq-option'>)<\/span> <span class='fbq-option'>function<\/span> <span class='fbq-option'>function()<\/span> <span class='fbq-option'>myFunc<\/span> <span class='fbq-option'>myFunc()<\/span>","title":"How to define and call a function","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"left","titleAlign":"left","titleCol":"#FFFFFF","titleBg":"#7E7E7E","questionCol":"#FFFFFF","questionBg":"#5F5F5F","mainCol":"#1C1C1C","mainBg":"#F7F7F7","navBtnCol":"#FFFFFF","navBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaCol":"#1C1C1C","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaCol":"#1C1C1C","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}# }
```

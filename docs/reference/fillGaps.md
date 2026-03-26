# Create a cloze drag and drop quiz

A cloze text with drag-and-drop items provides a sentence or paragraph
containing blank spaces with all the possible answers (correct and
incorrect) listed below the text. The user must drag the words, symbols
or other text items to the appropriate blank spaces to complete the
sentence or paragraph. Some of the advantages of cloze exercises are
that (1) they have real-world application, (2) they provide learners
with natural-like settings, and that (3) they can be flexibly and
personally tailored to meet learning needs. Cloze exercises are often
used as an evaluation task in natural language processing to assess the
performance of the trained language models.

## Usage

``` r
fillGaps(
  x,
  title = NULL,
  description = NULL,
  language = "en",
  showTipButton = TRUE,
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
  titleCol = "#FFFFFF",
  titleBg = "#5F5F5F",
  submitButtonCol = "#FFFFFF",
  submitButtonBg = "#28A745",
  tipButtonCol = "#1C1C1C",
  tipButtonBg = "#F1F1F1",
  solutionButtonCol = "#1C1C1C",
  solutionButtonBg = "#F1F1F1",
  tipAreaBg = "#E7F9E7",
  tipAreaBorder = "#28A745",
  solutionAreaBg = "#D6EAF8",
  solutionAreaBorder = "#3498DB"
)
```

## Arguments

- x:

  A list containing 2 **named** elements:

  - `$cloze` A string containing the full text **including** the words,
    signs or items to be removed. These text parts should be indicated
    by placing them between an opening 'tag' `$$!` and a closing 'tag'
    `!$$`. Anything inside these tags will be removed from the cloze
    text and shown as draggable object at the bottom of the widget.

  - `$addOptions` A character vector containing additional answer
    options to show as draggable objects.

- title:

  character; the title text. If set to `NULL` (default), no title will
  be shown in the header box.

- description:

  character; a short description below the title. If set to `NULL`
  (default), a language-specific default text is used (e.g. "Fill in the
  blanks." for English, "Fuelle die Luecken." for German). Set to `""`
  (empty string) to hide the description entirely.

- language:

  character; the language of the quiz interface. Sets button labels,
  result text, tips and description automatically. Currently supported:
  `"en"` (English, default), `"de"` (German), `"fr"` (French), and
  `"es"` (Spanish). To request additional languages, please open an
  issue on GitHub.

- showTipButton:

  logical; whether the tip button for answer options should be
  displayed. The default is `TRUE`.

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

- titleCol:

  character; the title (and description) text color as hex color or R
  color name. The default is `"#FFFFFF"`.

- titleBg:

  character; the title box background color as hex color or R color
  name. The default is `"#5F5F5F"`.

- submitButtonCol:

  character; the submit button text color. The default is `"#FFFFFF"`.

- submitButtonBg:

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

- tipAreaBg:

  character; the background color of the tip answer options area. The
  default is `"#E7F9E7"`.

- tipAreaBorder:

  character; the border color of the tip answer options area. The
  default is `"#28A745"`.

- solutionAreaBg:

  character; the background color of the solution area. The default is
  `"#D6EAF8"`. Note: in fillGaps, solutions are shown directly in the
  input fields, so this parameter is reserved for future use.

- solutionAreaBorder:

  character; the border color of the solution area. The default is
  `"#3498DB"`. See note for `solutionAreaBg`.

## Value

An HTML widget object of class `fillGaps` that can be rendered in R
Markdown documents, Shiny applications, or the RStudio viewer.

## Details

In this quiz function, answer options are provided to simplify the task.
Also, the draggable answer objects can only be placed on the correct
blank fields so students get immediate feedback. Once all answer objects
are placed on their respective blank fields, a confirming feedback
message is displayed. The order of answer option is randomized. If you
want to get the same order each time the function is run on the same
text input, set the seed of the RNG with set.seed().

**Cloze text format**

The full cloze text needs to be provided in one single string. Any word,
symbol or other text item that should be removed from the cloze and
become an answer option has to be placed between an opening 'tag' `$$!`
and a closing 'tag' `!$$`. In the following example the words
**programming** and **statistical computing** will be replaced with
blank fields and converted into draggable answer objects:

*x = list(cloze = "R is a \$\$!programming\$\$! language and free
software environment for \$\$!statistical computing!\$\$ and
graphics.")*

To add more (but incorrect) answer options, simply add a character
vector named `$addOptions` to the input list.

**Formatting of cloze text**

The cloze string will be converted straight into html code. If you want
to format the text in a specific way, e.g. show some text parts in bold
or italic or a specific color, use HTML tags with inline CSS style:

*x = list(cloze = "R is a \$\$!programming\$\$! \<b\>language\</b\> and
\<em\>free\<em\> software \<span style="color:red"\>environment\</span\>
for \$\$!statistical computing!\$\$ and graphics.")*

Any white space in the string will be correctly displayed in the cloze
text, but not a tab stop or line break. To display a line break in the
quiz use the **\<br\>** tag.

## Author

Saskia A. Otto

## Examples

``` r
# \donttest{
# Example 1 - A simple sentence -----
txt <- list(
  cloze = "R is a $$!programming!$$ language and free
   software environment for $$!statistical computing!$$
   and graphics.",
  addOptions = c("natural", "colloquial", "movies", "audio")
 )

fillGaps(x = txt)

{"x":{"convCloze":"R is a <input type='text' class='fgq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free   software environment for <input type='text' class='fgq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>   and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fgq-option'>movies<\/span> <span class='fgq-option'>audio<\/span> <span class='fgq-option'>statistical computing<\/span> <span class='fgq-option'>colloquial<\/span> <span class='fgq-option'>programming<\/span> <span class='fgq-option'>natural<\/span>","title":"NULL","descript":"Fill in the blanks.","language":"en","showTipBtn":"true","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleCol":"#FFFFFF","titleBg":"#5F5F5F","submitBtnCol":"#FFFFFF","submitBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}
# With title, German language, smaller width and font:
set.seed(1)
fillGaps(x = txt, language = "de",
            title = "What is R?",
            width = "500px",
            clozeHeight = "120px",
            fontFamily = "Georgia, 'Times New Roman', serif",
            fontSize = 12,
            titleFontSize = 15,
            descriptFontSize = 12)

{"x":{"convCloze":"R is a <input type='text' class='fgq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free   software environment for <input type='text' class='fgq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>   and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fgq-option'>programming<\/span> <span class='fgq-option'>colloquial<\/span> <span class='fgq-option'>natural<\/span> <span class='fgq-option'>audio<\/span> <span class='fgq-option'>statistical computing<\/span> <span class='fgq-option'>movies<\/span>","title":"What is R?","descript":"Fülle die Lücken.","language":"de","showTipBtn":"true","showSolutionBtn":"true","txtSubmitBtn":"Absenden","txtTipBtnShow":"Tipps anzeigen","txtTipBtnHide":"Tipps ausblenden","txtSolutionBtnShow":"Lösung anzeigen","txtSolutionBtnHide":"Lösung ausblenden","tipIntro":"Wähle aus folgenden Optionen:","txtResultCorrect":"Du hast {score} von {total} richtig!","txtResultWrong":"Du hast {score} von {total} richtig!","width":"500px","height":"500px","center":"true","scroll":"false","fontFamily":"Georgia, 'Times New Roman', serif","fontSize":12,"titleFontSize":15,"descriptFontSize":12,"clozeWidth":"100%","clozeHeight":"120px","blanksWidth":"auto","blanksAlign":"center","titleCol":"#FFFFFF","titleBg":"#5F5F5F","submitBtnCol":"#FFFFFF","submitBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}
# French language interface:
fillGaps(x = txt, language = "fr",
            title = "Qu'est-ce que R ?")

{"x":{"convCloze":"R is a <input type='text' class='fgq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free   software environment for <input type='text' class='fgq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>   and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fgq-option'>natural<\/span> <span class='fgq-option'>statistical computing<\/span> <span class='fgq-option'>audio<\/span> <span class='fgq-option'>colloquial<\/span> <span class='fgq-option'>programming<\/span> <span class='fgq-option'>movies<\/span>","title":"Qu'est-ce que R ?","descript":"Remplissez les blancs.","language":"fr","showTipBtn":"true","showSolutionBtn":"true","txtSubmitBtn":"Valider","txtTipBtnShow":"Afficher les indices","txtTipBtnHide":"Masquer les indices","txtSolutionBtnShow":"Afficher la solution","txtSolutionBtnHide":"Masquer la solution","tipIntro":"Choisissez parmi les options suivantes :","txtResultCorrect":"Vous avez {score} sur {total} correct !","txtResultWrong":"Vous avez {score} sur {total} correct !","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleCol":"#FFFFFF","titleBg":"#5F5F5F","submitBtnCol":"#FFFFFF","submitBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}
# Customize button and tip area colors:
fillGaps(x = txt,
            title = "Fill in the blanks",
            submitButtonBg = "#3498DB",
            tipButtonBg = "#E8E8E8",
            solutionButtonBg = "#E8E8E8",
            tipAreaBg = "#D6EAF8",
            tipAreaBorder = "#3498DB")

{"x":{"convCloze":"R is a <input type='text' class='fgq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free   software environment for <input type='text' class='fgq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>   and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fgq-option'>movies<\/span> <span class='fgq-option'>statistical computing<\/span> <span class='fgq-option'>audio<\/span> <span class='fgq-option'>colloquial<\/span> <span class='fgq-option'>natural<\/span> <span class='fgq-option'>programming<\/span>","title":"Fill in the blanks","descript":"Fill in the blanks.","language":"en","showTipBtn":"true","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleCol":"#FFFFFF","titleBg":"#5F5F5F","submitBtnCol":"#FFFFFF","submitBtnBg":"#3498DB","tipBtnCol":"#1C1C1C","tipBtnBg":"#E8E8E8","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#E8E8E8","tipAreaBg":"#D6EAF8","tipAreaBorder":"#3498DB","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}
# Customize title and hide buttons:
fillGaps(x = txt,
            title = "R Basics",
            titleCol = "#FFD700",
            titleBg = "#1a1a2e",
            showTipButton = FALSE,
            showSolutionButton = FALSE)

{"x":{"convCloze":"R is a <input type='text' class='fgq-target' data-accept='1' aria-label='Blank 1' style='; text-align:center'>&nbsp;<\/span> language and free   software environment for <input type='text' class='fgq-target' data-accept='2' aria-label='Blank 2' style='; text-align:center'>&nbsp;<\/span>   and graphics.","convAnswers":["programming","statistical computing"],"convOptions":"<span class='fgq-option'>programming<\/span> <span class='fgq-option'>movies<\/span> <span class='fgq-option'>audio<\/span> <span class='fgq-option'>colloquial<\/span> <span class='fgq-option'>natural<\/span> <span class='fgq-option'>statistical computing<\/span>","title":"R Basics","descript":"Fill in the blanks.","language":"en","showTipBtn":"false","showSolutionBtn":"false","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"center","titleCol":"#FFD700","titleBg":"#1a1a2e","submitBtnCol":"#FFFFFF","submitBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}

# Example 2 - Code syntax -----
# the <pre> tag will display the text in monospace
txt <- list(
  cloze =
  "<pre>myFunc <- $$!function()!$$ { <br>
       print('Hello, world!') <br>
  $$!}!$$ <br>
  $$!myFunc()!$$</pre>",
  addOptions = c("function", ")", "myFunc")
 )

 fillGaps(x = txt,
             title = "How to define and call a function",
             blanksAlign = "left")

{"x":{"convCloze":"<pre>myFunc <- <input type='text' class='fgq-target' data-accept='1' aria-label='Blank 1' style='; text-align:left'>&nbsp;<\/span> { <br>       print('Hello, world!') <br>  <input type='text' class='fgq-target' data-accept='2' aria-label='Blank 2' style='; text-align:left'>&nbsp;<\/span> <br>  <input type='text' class='fgq-target' data-accept='3' aria-label='Blank 3' style='; text-align:left'>&nbsp;<\/span><\/pre>","convAnswers":["function()","}","myFunc()"],"convOptions":"<span class='fgq-option'>)<\/span> <span class='fgq-option'>myFunc<\/span> <span class='fgq-option'>}<\/span> <span class='fgq-option'>function<\/span> <span class='fgq-option'>myFunc()<\/span> <span class='fgq-option'>function()<\/span>","title":"How to define and call a function","descript":"Fill in the blanks.","language":"en","showTipBtn":"true","showSolutionBtn":"true","txtSubmitBtn":"Submit","txtTipBtnShow":"Show tips","txtTipBtnHide":"Hide tips","txtSolutionBtnShow":"Show solution","txtSolutionBtnHide":"Hide solution","tipIntro":"Choose from the following options:","txtResultCorrect":"You got {score} out of {total} correct!","txtResultWrong":"You got {score} out of {total} correct!","width":"100%","height":"500px","center":"true","scroll":"false","fontFamily":"'Helvetica Neue', Helvetica, Arial, sans-serif","fontSize":16,"titleFontSize":20,"descriptFontSize":16,"clozeWidth":"100%","clozeHeight":"NULL","blanksWidth":"auto","blanksAlign":"left","titleCol":"#FFFFFF","titleBg":"#5F5F5F","submitBtnCol":"#FFFFFF","submitBtnBg":"#28A745","tipBtnCol":"#1C1C1C","tipBtnBg":"#F1F1F1","solutionBtnCol":"#1C1C1C","solutionBtnBg":"#F1F1F1","tipAreaBg":"#E7F9E7","tipAreaBorder":"#28A745","solutionAreaBg":"#D6EAF8","solutionAreaBorder":"#3498DB"},"evals":[],"jsHooks":[]}# }
```

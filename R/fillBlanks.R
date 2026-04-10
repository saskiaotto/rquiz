#' Create a fill-in-the-blank cloze quiz
#'
#' \code{fillBlanks} creates an interactive cloze (fill-in-the-blank) quiz where
#' users type missing words into blank fields. Blank fields are defined by
#' placing answer text between \code{$$!} and \code{!$$} markers in the cloze
#' string. A submit button checks all answers at once. The description container
#' changes color as feedback: green if all answers are correct, red otherwise
#' (with an alert showing the score). Optional tip and solution buttons provide
#' additional help.
#'
#' Cloze exercises are widely used in language learning, programming courses,
#' and knowledge assessment. They can be flexibly tailored to meet different
#' learning needs.
#'
#' @param x A named list containing:
#'        \itemize{
#'           \item \code{$cloze} (required) A character string with the full text.
#'                  Words or phrases to become blanks are wrapped in
#'                  \code{$$!answer!$$} markers.
#'           \item \code{$addOptions} (optional) A character vector of additional
#'                  (wrong) answer options shown in the tip area.
#'        }
#'        Use \code{\link{checkFillBlanks}} to validate the input before passing it.
#' @param title character; the title text. If set to \code{NULL} (default), no title
#'        will be shown in the header box.
#' @param description character; a short description below the title. If set to
#'        \code{NULL} (default), a language-specific default text is used (e.g.
#'        "Fill in the blanks." for English, "Fülle die Lücken." for German).
#'        Set to \code{""} (empty string) to hide the description entirely.
#' @param language character; the language of the quiz interface. Sets button labels,
#'        result text, tips and description automatically. Currently supported:
#'        \code{"en"} (English, default), \code{"de"} (German), \code{"fr"} (French),
#'        and \code{"es"} (Spanish). To request additional languages,
#'        please open an issue on GitHub.
#' @param showTipButton logical; whether the tip button for answer options should be
#'        displayed. The default is \code{FALSE}.
#' @param showSolutionButton logical; whether the solution button should be displayed.
#'        The default is \code{TRUE}.
#' @param width character; the width of the quiz frame area in pixels or percentage.
#'        The default is \code{"100\%"}.
#' @param height character; the height of the quiz frame area in pixels or percentage.
#'        The default is \code{"500px"}. If \code{scroll = FALSE}, the height is
#'        automatically determined based on content.
#' @param center logical; if \code{TRUE} (default), the quiz frame is centered
#'        when the width is less than \code{"100\%"}.
#' @param scroll logical; if \code{TRUE}, the \code{height} argument sets a fixed
#'        frame height with a scroll bar for overflowing content. Useful for HTML
#'        presentations. If \code{FALSE} (default), the height adjusts automatically.
#' @param clozeWidth character; the width of the cloze section in pixels or percentage.
#'        The default is \code{"100\%"}.
#' @param clozeHeight character or NULL; the minimum height of the cloze section.
#'        The default is \code{NULL} (auto). Set to e.g. \code{"250px"} for a fixed
#'        minimum height.
#' @param blanksWidth character; the width of blank input fields. The default is
#'        \code{"auto"}, which sizes fields based on the longest correct answer
#'        (minimum 50px). If the cloze text uses \code{<pre>} tags, a monospace font
#'        is used for measuring. Set to a fixed value like \code{"150px"} for a
#'        specific width, or \code{NULL} for browser default.
#' @param blanksAlign character; the alignment of text in filled blanks. One of
#'        \code{"center"} (default), \code{"left"}, or \code{"right"}.
#' @param fontFamily character; the font family for all text elements in CSS style.
#'        The default is \code{"'Helvetica Neue', Helvetica, Arial, sans-serif"}.
#' @param fontSize integer; the font size in pixels for the main text elements.
#'        Other properties are rescaled accordingly. The default is \code{16}.
#' @param titleFontSize integer; the font size in pixels for the title.
#'        The default is \code{20}.
#' @param descriptFontSize integer; the font size in pixels for the description.
#'        The default is \code{16}.
#' @param titleAlign character; the alignment of the title text. One of
#'        \code{"left"} (default), \code{"center"}, or \code{"right"}.
#' @param titleCol character; the title (and description) text color as hex color
#'        or R color name. The default is \code{"#FFFFFF"}.
#' @param titleBg character; the title box background color as hex color or
#'        R color name. The default is \code{"#7E7E7E"}.
#' @param questionCol character; the description text color. The default is
#'        \code{"#FFFFFF"}. Named \code{questionCol} for consistency with
#'        \code{\link{singleQuestion}} and \code{\link{multiQuestions}}, where
#'        this parameter controls the question container. In \code{fillBlanks},
#'        it controls the description container, which also provides visual
#'        feedback after submission (green for all correct, red for errors).
#' @param questionBg character; the background color of the description
#'        container. The default is \code{"#5F5F5F"}.
#' @param mainCol character; the text color of the cloze content area.
#'        The default is \code{"#1C1C1C"}.
#' @param mainBg character; the background color of the main content area.
#'        The default is \code{"#F7F7F7"}.
#' @param navButtonCol character; the submit button text color. The default is
#'        \code{"#FFFFFF"}.
#' @param navButtonBg character; the submit button background color. The default
#'        is \code{"#28A745"}.
#' @param tipButtonCol character; the tip button text color. The default is
#'        \code{"#1C1C1C"}.
#' @param tipButtonBg character; the tip button background color. The default is
#'        \code{"#F1F1F1"}.
#' @param solutionButtonCol character; the solution button text color. The default
#'        is \code{"#1C1C1C"}.
#' @param solutionButtonBg character; the solution button background color. The
#'        default is \code{"#F1F1F1"}.
#' @param tipAreaCol character; the text color of the tip area.
#'        The default is \code{"#1C1C1C"}.
#' @param tipAreaBg character; the background color of the tip answer options area.
#'        The default is \code{"#E7F9E7"}.
#' @param tipAreaBorder character; the border color of the tip answer options area.
#'        The default is \code{"#28A745"}.
#' @param solutionAreaCol character; the text color of the solution area.
#'        The default is \code{"#1C1C1C"}.
#' @param solutionAreaBg character; the background color of the solution area.
#'        The default is \code{"#D6EAF8"}. Note: in fillBlanks, solutions are shown
#'        directly in the input fields, so this parameter is reserved for future use.
#' @param solutionAreaBorder character; the border color of the solution area.
#'        The default is \code{"#3498DB"}. See note for \code{solutionAreaBg}.
#' @param theme an optional \code{\link{rquizTheme}} object. Theme values are
#'        used as defaults and are overridden by any explicitly passed arguments.
#'
#' @details
#'
#' \strong{Cloze text format}
#'
#' The full cloze text needs to be provided in one single string. Any word, symbol or other text item
#' that should be removed from the cloze and become an answer option has to be placed between an
#' opening 'tag' \code{$$!} and a closing 'tag' \code{!$$}. In the following example the words
#' \strong{programming} and \strong{statistical computing} will be replaced with blank fields and
#' converted into blank input fields:
#'
#' \emph{x = list(cloze = "R is a $$!programming!$$ language and free software environment for $$!statistical computing!$$ and graphics.")}
#'
#' To add more (but incorrect) answer options, simply add a character vector named \code{$addOptions} to the
#' input list.
#'
#'
#' \strong{Formatting of cloze text}
#'
#' The cloze string will be converted straight into html code. If you want to format the text in a
#' specific way, e.g. show some text parts in bold or italic or a specific color, use HTML tags with
#' inline CSS style:
#'
#' \emph{x = list(cloze = "R is a $$!programming!$$ <b>language</b> and <em>free</em> software <span
#' style='color:red'>environment</span> for $$!statistical computing!$$ and graphics.")}
#'
#' Normal text wraps automatically. For monospace code blocks, use \strong{<pre>}
#' tags — inside \code{<pre>}, line breaks require the \strong{<br>} tag
#' (normal line breaks are ignored).
#'
#'
#' @return An HTML widget object of class \code{fillBlanks} that can be
#'   rendered in R Markdown/Quarto documents, Shiny applications, or the
#'   RStudio viewer.
#'
#' @seealso \code{\link{checkFillBlanks}} for input validation,
#'   \code{\link{singleQuestion}} for choice quizzes,
#'   \code{\link{multiQuestions}} for multi-page quizzes,
#'   \code{\link{rquizTheme}} for reusable themes.
#'
#' @author
#' Saskia A. Otto
#'
#' @export
#'
#' @examples
#' \donttest{
#' # --- BASIC USAGE ---
#' txt <- list(
#'   cloze = "R is a $$!programming!$$ language and free
#'     software environment for $$!statistical computing!$$
#'     and graphics."
#' )
#'
#' ### Check if list has the correct format
#' checkFillBlanks(txt)  # passes
#'
#' ### Default settings (solution button shown)
#' fillBlanks(x = txt)
#'
#' ### Hide solution button
#' fillBlanks(x = txt, showSolutionButton = FALSE)
#'
#' ### Tip button with additional wrong options
#' txtWithOptions <- list(
#'   cloze = "R is a $$!programming!$$ language and free
#'     software environment for $$!statistical computing!$$
#'     and graphics.",
#'   addOptions = c("natural", "colloquial", "movies", "audio")
#' )
#' fillBlanks(x = txtWithOptions, showTipButton = TRUE)
#'
#' ### Title and description
#' fillBlanks(x = txt, title = "What is R?",
#'   description = "Can you complete the following sentence?")
#'
#' ### Changing the language
#' fillBlanks(x = txt, showTipButton = TRUE, language = "de")
#' fillBlanks(x = txt, showTipButton = TRUE, language = "fr")
#' fillBlanks(x = txt, showTipButton = TRUE, language = "es")
#'
#'
#' # --- CHANGING THE STYLE ---
#'
#' ### Window and cloze size
#' fillBlanks(x = txt, width = "50%")
#' fillBlanks(x = txt, width = "50%", center = FALSE)
#' # height only works with scroll = TRUE
#' fillBlanks(x = txt, width = "50%", height = "200px", scroll = TRUE)
#' fillBlanks(x = txt, clozeWidth = "50%")
#' fillBlanks(x = txt, clozeHeight = "300px")
#'
#' ### Blank field size and alignment
#' fillBlanks(x = txt, blanksWidth = "400px")
#' fillBlanks(x = txt, blanksAlign = "left")
#' fillBlanks(x = txt, blanksAlign = "right")
#'
#' ### Customizing the design: dark theme
#' fillBlanks(x = txtWithOptions,
#'   title = "What is R?", showTipButton = TRUE,
#'   fontFamily = "Georgia, serif",
#'   titleCol = "#E0E0E0", titleBg = "#1A1A2E",
#'   questionCol = "#FFFFFF", questionBg = "#16213E",
#'   mainCol = "#E0E0E0", mainBg = "#1A1B2E",
#'   navButtonCol = "#FFFFFF", navButtonBg = "#E94560",
#'   tipButtonCol = "#E0E0E0", tipButtonBg = "#2C2C3E",
#'   solutionButtonCol = "#E0E0E0", solutionButtonBg = "#2C2C3E",
#'   tipAreaCol = "#E0E0E0", tipAreaBg = "#1A2A1A",
#'   tipAreaBorder = "#4CAF50",
#'   solutionAreaCol = "#E0E0E0", solutionAreaBg = "#1A1A2E",
#'   solutionAreaBorder = "#5DADE2")
#'
#' ### Using a reusable theme
#' dark <- rquizTheme(
#'   titleCol = "#E0E0E0", titleBg = "#1A1A2E",
#'   questionCol = "#FFFFFF", questionBg = "#16213E",
#'   navButtonCol = "#FFFFFF", navButtonBg = "#E94560"
#' )
#' fillBlanks(x = txtWithOptions, theme = dark,
#'   title = "What is R?", showTipButton = TRUE)
#'
#'
#' # --- CODE SYNTAX EXAMPLE ---
#'
#' ### Use <pre> tags for monospace formatting
#' codequiz <- list(
#'   cloze = "<pre>myFunc <- $$!function()!$$ { <br>
#'     print('Hello, world!') <br>
#'   $$!}!$$ <br>
#'   $$!myFunc()!$$</pre>",
#'   addOptions = c("function", ")", "myFunc")
#' )
#' fillBlanks(x = codequiz,
#'   title = "How to define and call a function",
#'   blanksAlign = "left")
#' }
#'
fillBlanks <- function(x, title = NULL,
  description = NULL,
  language = "en", showTipButton = FALSE, showSolutionButton = TRUE,
  width = "100%", height = "500px", center = TRUE, scroll = FALSE,
  clozeWidth = "100%", clozeHeight = NULL,
  blanksWidth = "auto", blanksAlign = "center",
  fontFamily = "'Helvetica Neue', Helvetica, Arial, sans-serif",
  fontSize = 16, titleFontSize = 20, descriptFontSize = 16,
  titleAlign = "left",
  titleCol = "#FFFFFF", titleBg = "#7E7E7E",
  questionCol = "#FFFFFF", questionBg = "#5F5F5F",
  mainCol = "#1C1C1C", mainBg = "#F7F7F7",
  navButtonCol = "#FFFFFF", navButtonBg = "#28A745",
  tipButtonCol = "#1C1C1C", tipButtonBg = "#F1F1F1",
  solutionButtonCol = "#1C1C1C", solutionButtonBg = "#F1F1F1",
  tipAreaCol = "#1C1C1C", tipAreaBg = "#E7F9E7", tipAreaBorder = "#28A745",
  solutionAreaCol = "#1C1C1C", solutionAreaBg = "#D6EAF8", solutionAreaBorder = "#3498DB",
  theme = NULL) {

  # Apply theme (theme values are overridden by explicit arguments)
  if (!is.null(theme)) {
    if (!inherits(theme, "rquizTheme"))
      stop("`theme` must be created with rquizTheme(). See ?rquizTheme.", call. = FALSE)
    defaults <- formals(fillBlanks)
    call_args <- as.list(match.call())[-1]
    themeable <- setdiff(names(defaults), c("x", "title", "description", "theme"))
    for (nm in names(theme)) {
      if (nm %in% themeable && !nm %in% names(call_args)) {
        assign(nm, theme[[nm]])
      }
    }
  }

  # Data Validation ----------------------
  checkFillBlanks(x)
  # ---------------------------------------

  # Convert simple string to string containing all HTML elements
  conv_txt <- convertFillBlanks2HTML(x, blanksWidth, blanksAlign)

  # Get translations from central file
  tr <- get_translations(language)

  if (is.null(description)) description <- tr$description


  # Forward options using x
  x = list(
    convCloze = conv_txt$cloze,
    convAnswers = conv_txt$answers,
    convOptions = conv_txt$options,
    title = ifelse(is.null(title), "NULL", title),
    descript = ifelse(is.null(description), "NULL", description),
    language = language,
    showTipBtn = ifelse(showTipButton == TRUE, "true", "false"),
    showSolutionBtn = ifelse(showSolutionButton == TRUE, "true", "false"),
    txtSubmitBtn = tr$submit,
    txtTipBtnShow = tr$showTips,
    txtTipBtnHide = tr$hideTips,
    txtSolutionBtnShow = tr$showSolution,
    txtSolutionBtnHide = tr$hideSolution,
    tipIntro = tr$tipIntro,
    txtResultCorrect = tr$resultCorrect,
    txtResultWrong = tr$resultWrong,
    width = width,
    height = height,
    center = ifelse(center == TRUE, "true", "false"),
    scroll = ifelse(scroll == TRUE, "true", "false"),
    fontFamily = fontFamily,
    fontSize = fontSize,
    titleFontSize = titleFontSize,
    descriptFontSize = descriptFontSize,
    clozeWidth = clozeWidth,
    clozeHeight = ifelse(is.null(clozeHeight), "NULL", clozeHeight),
    blanksWidth = ifelse(is.null(blanksWidth), "NULL", blanksWidth),
    blanksAlign = blanksAlign,
    titleAlign = titleAlign,
    titleCol = titleCol,
    titleBg = titleBg,
    questionCol = questionCol,
    questionBg = questionBg,
    mainCol = mainCol,
    mainBg = mainBg,
    navBtnCol = navButtonCol,
    navBtnBg = navButtonBg,
    tipBtnCol = tipButtonCol,
    tipBtnBg = tipButtonBg,
    solutionBtnCol = solutionButtonCol,
    solutionBtnBg = solutionButtonBg,
    tipAreaCol = tipAreaCol,
    tipAreaBg = tipAreaBg,
    tipAreaBorder = tipAreaBorder,
    solutionAreaCol = solutionAreaCol,
    solutionAreaBg = solutionAreaBg,
    solutionAreaBorder = solutionAreaBorder
  )


  # Create widget
  htmlwidgets::createWidget(
    name = 'fillBlanks',
    x,
    width = width,
    height = if (scroll) height else NULL,
    package = 'rquiz',
    sizingPolicy = htmlwidgets::sizingPolicy(
      knitr.figure = FALSE,
      browser.fill = TRUE,
      knitr.defaultWidth = "100%",
      knitr.defaultHeight = if (scroll) 500 else "auto"
    )
  )


}

#' Shiny bindings for fillBlanks
#'
#' Output and render functions for using fillBlanks within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a fillBlanks quiz
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @return \code{fillBlanksOutput} returns an HTML output element for use
#'   in a Shiny UI definition. \code{renderFillBlanks} returns a
#'   server-side rendering function to be assigned to an output slot.
#'
#' @examples
#' if (interactive()) {
#' library(shiny)
#'
#' txt <- list(
#'   cloze = "R is a $$!programming!$$ language for $$!statistical computing!$$.",
#'   addOptions = c("natural", "cooking")
#' )
#'
#' ui <- fluidPage(
#'   fillBlanksOutput("quiz1")
#' )
#'
#' server <- function(input, output) {
#'   output$quiz1 <- renderFillBlanks({
#'     fillBlanks(x = txt, title = "Fill in the Blanks")
#'   })
#' }
#'
#' shinyApp(ui, server)
#' }
#'
#' @name fillBlanks-shiny
#'
#' @export
fillBlanksOutput <- function(outputId, width = '100%', height = '500px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'fillBlanks', width, height, package = 'rquiz')
}

#' @rdname fillBlanks-shiny
#' @export
renderFillBlanks <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, fillBlanksOutput, env, quoted = TRUE)
}

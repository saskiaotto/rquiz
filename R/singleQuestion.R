#' Create a single-question quiz (single-choice or multiple-choice)
#'
#' \code{singleQuestion} creates an interactive quiz with one question. It
#' supports both single-choice and multiple-choice modes, which are
#' auto-detected from the \code{answer} field (single integer = SC, vector of
#' integers = MC).
#'
#' In \strong{single-choice mode}, clicking an answer option gives immediate
#' visual feedback: green (correct) or red (wrong).
#'
#' In \strong{multiple-choice mode}, the user selects one or more options and
#' clicks Submit. If the answer is wrong, a feedback message indicates how
#' many correct and wrong selections were made. The Submit button is disabled
#' after each attempt and re-enabled when the selection changes, allowing the
#' user to adjust and retry. Optional Tip and Solution buttons provide
#' additional help.
#'
#' @param x A list containing 3 or 4 elements (which can be named for better
#'        readability):
#'        \itemize{
#'           \item \code{$question} A string providing the actual question.
#'           \item \code{$options} A character vector containing all answer options.
#'           \item \code{$answer} An integer indicating the correct answer option
#'             (single-choice) or a numeric vector of indices indicating all correct
#'             answer options (multiple-choice). The quiz mode is auto-detected from
#'             the length of this field.
#'           \item \code{$tip} (optional) A string providing a custom tip text, shown
#'             when \code{showTipButton = TRUE}. In multiple-choice mode, if omitted,
#'             the number of correct answers is shown as the default tip. In
#'             single-choice mode, the tip button only appears if a custom tip is
#'             provided.
#'        }
#'        Use \code{\link{checkSingleQuestion}} to validate the input before
#'        passing it.
#' @param title character; the title text. If set to \code{NULL} (default)
#'        the header box will not be shown.
#' @param language character; the language of the quiz interface. Sets button
#'        labels, feedback messages and other UI text automatically. Currently
#'        supported: \code{"en"} (English, default), \code{"de"} (German),
#'        \code{"fr"} (French), and \code{"es"} (Spanish). To request additional
#'        languages, please open an issue on GitHub.
#' @param shuffle logical; if \code{TRUE}, the answer options are displayed in a
#'        random order each time the widget is rendered. The correct answer mapping
#'        is preserved. The default is \code{FALSE}.
#' @param showTipButton logical; whether to show a tip button. If \code{TRUE}
#'        and \code{x} contains a 4th element (e.g. \code{$tip}), the tip text
#'        is displayed. In multiple-choice mode without a custom tip, the number
#'        of correct answers is shown as a default tip. In single-choice mode,
#'        the button is only shown if a custom tip text is provided in
#'        \code{x[[4]]}. The default is \code{FALSE}.
#' @param showSolutionButton logical; whether to show a solution button that
#'        reveals the correct answer(s). The default is \code{TRUE}.
#' @param width character; the width of the quiz frame area in pixels
#'        or percentage. The default is \code{"100\%"}.
#' @param height character; the height of the quiz frame area in pixels
#'        or percentage. The default is \code{"500px"}. If \code{scroll = FALSE},
#'        the height is automatically determined based on content.
#' @param center logical; if \code{TRUE} (default), the quiz frame is centered
#'        when the width is less than \code{"100\%"}.
#' @param scroll logical; if \code{TRUE}, the \code{height} argument sets a fixed
#'        frame height with a scroll bar for overflowing content. Useful for HTML
#'        presentations. If \code{FALSE} (default), the height adjusts automatically.
#' @param fontFamily character; the font family for all text elements in CSS style.
#'        The default is \code{"'Helvetica Neue', Helvetica, Arial, sans-serif"}.
#' @param fontSize integer; the font size in pixels for the answer option text.
#'        All other properties (margins, letter buttons, etc.) are rescaled
#'        accordingly. The default is \code{16}.
#' @param titleFontSize integer; the font size in pixels for the title.
#'        The default is \code{20}.
#' @param questionFontSize integer; the font size in pixels for the question
#'        text. The default is \code{16}.
#' @param titleAlign character; the alignment of the title text. One of
#'        \code{"left"}, \code{"center"} (default), or \code{"right"}.
#' @param titleCol character; the title text color as hex color or R color name.
#'        The default is \code{"#FFFFFF"}.
#' @param titleBg character; the title background color as hex color or
#'        R color name. The default is \code{"#7E7E7E"}.
#' @param questionCol character; the question text color as hex color or R color
#'        name. The default is \code{"white"}. This container also changes color
#'        to provide visual feedback (green for correct, red for wrong).
#' @param questionBg character; the question background color as hex color
#'        or R color name. The default is \code{"#5F5F5F"}.
#' @param mainCol character; the text color in the main content area (answer
#'        options). The default is \code{"#1C1C1C"}.
#' @param mainBg character; the background color of the main content area.
#'        The default is \code{"#F7F7F7"}.
#' @param optionBg character; the background color of the answer option rows.
#'        The hover color is automatically derived (30\% darker).
#'        The default is \code{"#ECECEC"}.
#' @param optionLabelBg character; the background color of the A/B/C/D option
#'        labels. The hover color is automatically derived (20\% darker).
#'        The default is \code{"#3498DB"}.
#' @param navButtonCol character; the navigation/submit button text color.
#'        The default is \code{"#FFFFFF"}.
#' @param navButtonBg character; the navigation/submit button background color.
#'        The default is \code{"#28A745"}.
#' @param tipButtonCol character; the tip button text color. The default is
#'        \code{"#1C1C1C"}.
#' @param tipButtonBg character; the tip button background color. The default is
#'        \code{"#F1F1F1"}.
#' @param solutionButtonCol character; the solution button text color. The default
#'        is \code{"#1C1C1C"}.
#' @param solutionButtonBg character; the solution button background color. The
#'        default is \code{"#F1F1F1"}.
#' @param tipAreaCol character; the text color of the tip text area. The
#'        default is \code{"#1C1C1C"}.
#' @param tipAreaBg character; the background color of the tip text area. The
#'        default is \code{"#E7F9E7"}.
#' @param tipAreaBorder character; the border color of the tip text area. The
#'        default is \code{"#28A745"}.
#' @param solutionAreaCol character; the text color of the solution text area.
#'        The default is \code{"#1C1C1C"}.
#' @param solutionAreaBg character; the background color of the solution text area.
#'        The default is \code{"#D6EAF8"}.
#' @param solutionAreaBorder character; the border color of the solution text area.
#'        The default is \code{"#3498DB"}.
#' @param theme an optional \code{\link{rquizTheme}} object. Theme values are
#'        used as defaults and are overridden by any explicitly passed arguments.
#'
#' @details
#' \strong{Text formatting:} Since quiz content is rendered as HTML, you can
#' use HTML tags in question and option strings: \code{<em>} for italics
#' (e.g. species names), \code{<strong>} for bold, \code{<code>} for inline
#' code, or \code{<span>} with inline CSS for colored text. Standard Markdown
#' formatting does \emph{not} work inside quiz strings.
#'
#'
#' @return An HTML widget object of class \code{singleQuestion} that can be
#'   rendered in R Markdown/Quarto documents, Shiny applications, or the
#'   RStudio viewer.
#'
#' @seealso \code{\link{checkSingleQuestion}} for input validation,
#'   \code{\link{multiQuestions}} for multi-page quizzes,
#'   \code{\link{fillBlanks}} for cloze quizzes,
#'   \code{\link{rquizTheme}} for reusable themes.
#'
#' @author
#' Saskia A. Otto
#'
#' @export
#'
#' @examples
#' \donttest{
#' # --- SINGLE-CHOICE MODE ---
#'
#' myQuestionSC <- list(
#'   question = "Which city hosted the 2024 Summer Olympics?",
#'   options = c("Athens", "London", "Paris", "Tokyo"),
#'   answer = 3  # (i.e. Paris)
#' )
#'
#' ### Check if list has the correct format
#' checkSingleQuestion(myQuestionSC)   # passes
#'
#' ### Default (includes solution button)
#' singleQuestion(x = myQuestionSC)
#'
#' ### With title and shuffled options
#' singleQuestion(x = myQuestionSC, title = "Sports Quiz", shuffle = TRUE)
#'
#' ### Without the solution button
#' singleQuestion(x = myQuestionSC, showSolutionButton = FALSE)
#'
#' ### With tip button (requires tip text in the question list)
#' myQuestionSCwithTip <- list(
#'   question = "Which city hosted the 2024 Summer Olympics?",
#'   options = c("Athens", "London", "Paris", "Tokyo"),
#'   answer = 3,
#'   tip = "Think about the Eiffel Tower."
#' )
#' singleQuestion(x = myQuestionSCwithTip, showTipButton = TRUE)
#'
#' ### Changing the window size
#' singleQuestion(x = myQuestionSC, width = "50%")
#' singleQuestion(x = myQuestionSC, width = "50%", center = FALSE)
#' # height works only with scroll = TRUE (useful for slide presentations):
#' singleQuestion(x = myQuestionSC, width = "50%",
#'   height = "300px", scroll = TRUE)
#'
#' ### Changing the language (UI text changes automatically)
#' singleQuestion(x = myQuestionSCwithTip, language = "de",
#'   showTipButton = TRUE)
#'
#' ### Customizing the design (dark theme):
#' singleQuestion(x = myQuestionSCwithTip,
#'   showTipButton = TRUE,
#'   title = "Sports Quiz",
#'   fontFamily = "Georgia, serif",
#'   fontSize = 20, titleFontSize = 14, titleAlign = "left",
#'   titleCol = "#E0E0E0", titleBg = "#1A1A2E",
#'   questionCol = "#FFFFFF", questionBg = "#16213E",
#'   mainCol = "#E0E0E0", mainBg = "#1A1B2E",
#'   optionBg = "#252540", optionLabelBg = "#0F3460",
#'   navButtonCol = "#FFFFFF", navButtonBg = "#E94560",
#'   tipButtonCol = "#E0E0E0", tipButtonBg = "#2C2C3E",
#'   solutionButtonCol = "#E0E0E0", solutionButtonBg = "#2C2C3E",
#'   tipAreaCol = "#E0E0E0", tipAreaBg = "#1A2A1A", tipAreaBorder = "#4CAF50",
#'   solutionAreaCol = "#E0E0E0", solutionAreaBg = "#1A1A2E",
#'   solutionAreaBorder = "#5DADE2")
#'
#'
#' # --- MULTIPLE-CHOICE MODE (auto-detected from answer vector) ---
#'
#' myQuestionMC <- list(
#'   question = "Which of the following are European capital cities?",
#'   options = c("Berlin", "Sydney", "Paris", "Tokyo", "Rome"),
#'   answer = c(1, 3, 5)  # Berlin, Paris, Rome
#' )
#'
#' ### Default (auto-detected as MC because answer has 3 elements)
#' singleQuestion(x = myQuestionMC)
#'
#' ### With title and shuffled options
#' singleQuestion(x = myQuestionMC,
#'   title = "Geography Quiz", shuffle = TRUE)
#'
#' ### Without the solution button
#' singleQuestion(x = myQuestionMC, showSolutionButton = FALSE)
#'
#' ### With tip button (auto-generated: shows number of correct answers)
#' singleQuestion(x = myQuestionMC, showTipButton = TRUE)
#'
#' ### With custom tip text
#' myQuestionMCwithTip <- list(
#'   question = "Which of the following are European capital cities?",
#'   options = c("Berlin", "Sydney", "Paris", "Tokyo", "Rome"),
#'   answer = c(1, 3, 5),
#'   tip = "Three of the five cities are in Europe."
#' )
#' singleQuestion(x = myQuestionMCwithTip, showTipButton = TRUE)
#'
#' ### Changing the window size
#' singleQuestion(x = myQuestionMC, width = "50%")
#' singleQuestion(x = myQuestionMC, width = "50%",
#'   height = "450px", scroll = TRUE)
#'
#' ### Changing the language (button labels change automatically)
#' singleQuestion(x = myQuestionMC, showTipButton = TRUE, language = "de")
#' singleQuestion(x = myQuestionMC, showTipButton = TRUE, language = "fr")
#' singleQuestion(x = myQuestionMC, showTipButton = TRUE, language = "es")
#'
#' ### Customizing the design (dark theme)
#' singleQuestion(x = myQuestionMCwithTip,
#'   showTipButton = TRUE,
#'   title = "Geography Quiz",
#'   fontFamily = "Georgia, serif",
#'   fontSize = 20, titleFontSize = 14, titleAlign = "left",
#'   titleCol = "#E0E0E0", titleBg = "#1A1A2E",
#'   questionCol = "#FFFFFF", questionBg = "#16213E",
#'   mainCol = "#E0E0E0", mainBg = "#1A1B2E",
#'   optionBg = "#252540", optionLabelBg = "#0F3460",
#'   navButtonCol = "#FFFFFF", navButtonBg = "#E94560",
#'   tipButtonCol = "#E0E0E0", tipButtonBg = "#2C2C3E",
#'   solutionButtonCol = "#E0E0E0", solutionButtonBg = "#2C2C3E",
#'   tipAreaCol = "#E0E0E0", tipAreaBg = "#1A2A1A", tipAreaBorder = "#4CAF50",
#'   solutionAreaCol = "#E0E0E0", solutionAreaBg = "#1A1A2E",
#'   solutionAreaBorder = "#5DADE2")
#'
#' ### Using a reusable theme
#' dark <- rquizTheme(
#'   titleCol = "#E0E0E0", titleBg = "#1A1A2E",
#'   questionCol = "#FFFFFF", questionBg = "#16213E",
#'   navButtonBg = "#E94560"
#' )
#' singleQuestion(x = myQuestionMC, theme = dark, title = "Themed Quiz")
#' }
#'
singleQuestion <- function(x,
  title = NULL, language = "en", shuffle = FALSE,
  showTipButton = FALSE, showSolutionButton = TRUE,
  width = "100%", height = "500px",
  center = TRUE, scroll = FALSE,
  fontFamily = "'Helvetica Neue', Helvetica, Arial, sans-serif",
  fontSize = 16, titleFontSize = 20, questionFontSize = 16,
  titleAlign = "center",
  titleCol = "#FFFFFF", titleBg = "#7E7E7E",
  questionCol = "white", questionBg = "#5F5F5F",
  mainCol = "#1C1C1C", mainBg = "#F7F7F7",
  optionBg = "#ECECEC", optionLabelBg = "#3498DB",
  navButtonCol = "#FFFFFF", navButtonBg = "#28A745",
  tipButtonCol = "#1C1C1C", tipButtonBg = "#F1F1F1",
  solutionButtonCol = "#1C1C1C", solutionButtonBg = "#F1F1F1",
  tipAreaCol = "#1C1C1C", tipAreaBg = "#E7F9E7", tipAreaBorder = "#28A745",
  solutionAreaCol = "#1C1C1C", solutionAreaBg = "#D6EAF8", solutionAreaBorder = "#3498DB",
  theme = NULL
  ) {

  # Apply theme (theme values are overridden by explicit arguments)
  if (!is.null(theme)) {
    if (!inherits(theme, "rquizTheme"))
      stop("`theme` must be created with rquizTheme(). See ?rquizTheme.", call. = FALSE)
    defaults <- formals(singleQuestion)
    call_args <- as.list(match.call())[-1]  # all explicitly passed args
    # Get all themeable param names (exclude x, title, theme)
    themeable <- setdiff(names(defaults), c("x", "title", "theme"))
    for (nm in names(theme)) {
      if (nm %in% themeable && !nm %in% names(call_args)) {
        assign(nm, theme[[nm]])
      }
    }
  }

  # Data Validation ----------------------
  # Support both named lists and positional lists
  if (!is.list(x)) {
    stop("'x' must be a list. See ?singleQuestion for the expected format.")
  }
  if (!is.null(names(x))) {
    checkSingleQuestion(x)
  } else {
    # Positional list: convert to named for validation
    if (!length(x) %in% c(3, 4)) {
      stop("'x' must have 3 or 4 elements: question, options, answer, and optionally tip.")
    }
    x_named <- list(question = x[[1]], options = x[[2]], answer = x[[3]])
    if (length(x) == 4) x_named$tip <- x[[4]]
    checkSingleQuestion(x_named)
  }
  # Auto-detect SC vs MC from answer length
  choice <- if (length(x[[3]]) > 1) "multiple" else "single"
  # ---------------------------------------

  qs <- x
  # Remove line breaks
  qs[[1]] <- gsub("\n", "", qs[[1]])
  qs[[2]] <- gsub("\n", "", qs[[2]])

  # Convert to JSON string
  if (choice == "single") {
    qs_string <- paste0('[ "', qs[[1]], '", ["',
      paste(qs[[2]], collapse = '", "'), '"], "',
      qs[[2]][ qs[[3]] ], '" ]')
  } else {
    # For multiple-choice: answer is a JSON array of correct answer texts
    correct_answers <- paste0('"', qs[[2]][ qs[[3]] ], '"', collapse = ", ")
    qs_string <- paste0('[ "', qs[[1]], '", ["',
      paste(qs[[2]], collapse = '", "'), '"], [',
      correct_answers, '] ]')
  }


  # Get translations

  tr <- get_translations(language)

  # Forward options using x
  x = list(
    question = qs_string,
    choice = choice,
    title = ifelse(is.null(title), "NULL", title),
    width = width,
    height = height,
    center = ifelse(center == TRUE, "true", "false"),
    scroll = ifelse(scroll == TRUE, "true", "false"),
    shuffle = ifelse(shuffle == TRUE, "true", "false"),
    fontFamily = fontFamily,
    fontSize = fontSize,
    titleFontSize = titleFontSize,
    questionFontSize = questionFontSize,
    titleAlign = titleAlign,
    titleCol = titleCol,
    titleBg = titleBg,
    questionCol = questionCol,
    questionBg = questionBg,
    mainCol = mainCol,
    mainBg = mainBg,
    optionBg = optionBg,
    optionLabelBg = optionLabelBg,
    showTipBtn = ifelse(isTRUE(showTipButton), "true", "false"),
    tipText = if (length(qs) >= 4 && is.character(qs[[4]])) qs[[4]] else "",
    showSolutionBtn = ifelse(showSolutionButton == TRUE, "true", "false"),
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
    solutionAreaBorder = solutionAreaBorder,
    txtSubmit = tr$submit,
    txtShowTips = tr$showTips,
    txtHideTips = tr$hideTips,
    txtShowSolution = tr$showSolution,
    txtHideSolution = tr$hideSolution,
    txtNumberOfCorrectAnswers = tr$numberOfCorrectAnswers,
    txtCorrectAnswers = tr$correctAnswers,
    txtFeedbackCorrectSelected = tr$feedbackCorrectSelected,
    txtFeedbackWrongOptions = tr$feedbackWrongOptions,
    txtFeedbackMissing = tr$feedbackMissing,
    txtOptionSingular = tr$optionSingular,
    txtOptionPlural = tr$optionPlural,
    txtAnswerSingular = tr$answerSingular,
    txtAnswerPlural = tr$answerPlural
  )

  # Create widget
  # When scroll = FALSE, let the widget auto-size (no fixed container height)
  widget_height <- if (scroll) height else NULL

  htmlwidgets::createWidget(
    name = 'singleQuestion',
    x,
    width = width,
    height = widget_height,
    package = 'rquiz',
    sizingPolicy = htmlwidgets::sizingPolicy(
      knitr.figure = FALSE,
      browser.fill = TRUE,
      knitr.defaultWidth = "100%",
      knitr.defaultHeight = if (scroll) 500 else "auto"
    )
  )
}

#' Shiny bindings for singleQuestion
#'
#' Output and render functions for using singleQuestion within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a singleQuestion.
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @examples
#' \dontrun{
#' library(shiny)
#'
#' ui <- fluidPage(
#'   singleQuestionOutput("quiz1")
#' )
#'
#' server <- function(input, output) {
#'   output$quiz1 <- renderSingleQuestion({
#'     singleQuestion(
#'       x = list("What is 2+2?", c("3", "4", "5"), 2),
#'       title = "Quick Quiz"
#'     )
#'   })
#' }
#'
#' shinyApp(ui, server)
#' }
#'
#' @name singleQuestion-shiny
#'
#' @export
singleQuestionOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'singleQuestion', width, height, package = 'rquiz')
}

#' @rdname singleQuestion-shiny
#' @export
renderSingleQuestion <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, singleQuestionOutput, env, quoted = TRUE)
}

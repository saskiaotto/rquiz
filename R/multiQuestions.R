#' Create a multi-page quiz with navigation, timer, and results
#'
#' \code{multiQuestions} creates an interactive quiz that presents multiple
#' questions one at a time with Previous/Next navigation. A timer tracks how
#' long the user takes (optional), and a results page shows the total score
#' with an optional 'Show solution' button to reveal correct answers. Supports
#' both single-choice and multiple-choice questions.
#'
#' The quiz mode is auto-detected: if \strong{any} question has multiple
#' correct answers (\code{length(answer) > 1}), all questions use checkboxes
#' (multiple-choice mode). Otherwise, radio buttons are used (single-choice).
#' An optional tip button can provide hints per question (custom text or,
#' in MC mode, the number of correct answers).
#'
#' @param x A list of question lists. Each sub-list should contain:
#'        \itemize{
#'           \item \code{$question} A character string with the question text.
#'           \item \code{$options} A character vector of answer options (min. 2).
#'           \item \code{$answer} An integer index (SC) or numeric vector of
#'             indices (MC) of the correct answer option(s).
#'           \item \code{$tip} (optional) A character string shown as a custom
#'             tip when \code{showTipButton = TRUE}.
#'        }
#'        Sub-lists can be named (e.g. \code{q1}, \code{q2}) for readability,
#'        but this is not required. Use \code{\link{checkMultiQuestions}} to
#'        validate the input before passing it.
#' @param title character; the title text. The default is \code{"Quiz"}.
#' @param language character; the language of the quiz interface. Sets button
#'        labels, navigation text, result page text and other UI elements
#'        automatically. Currently supported: \code{"en"} (English, default),
#'        \code{"de"} (German), \code{"fr"} (French), and \code{"es"} (Spanish).
#'        To request additional languages, please open an issue on GitHub.
#' @param shuffle logical; if \code{TRUE}, the order of questions is randomized
#'        each time the widget is rendered or the quiz is restarted with 'Try again'.
#'        The default is \code{FALSE}.
#' @param showTipButton logical; whether to show a tip button on each question
#'        page. If \code{TRUE} and the question list contains a 4th element
#'        (tip text), the custom tip is displayed. In multiple-choice mode without
#'        a custom tip, the number of correct answers is shown. In single-choice
#'        mode, the button only appears for questions with a custom tip.
#'        The default is \code{FALSE}.
#' @param showSolutionButton logical; if \code{TRUE} (default), a 'Show solution'
#'        button is displayed on the results page, allowing users to reveal the
#'        correct answers. If \code{FALSE}, only the score (0 or 1) per question
#'        is shown.
#' @param inclTimer logical; whether to include a timer (\code{TRUE}, default) or
#'        not. The timer starts counting immediately after the page is loaded.
#' @param width character; the width of the quiz frame area in pixels or percentage.
#'        The default is \code{"100\%"}.
#' @param height character; the height of the quiz frame area in pixels or
#'        percentage. The default is \code{"500px"}. If \code{scroll = FALSE},
#'        the height is automatically determined based on content.
#' @param center logical; if \code{TRUE} (default), the quiz frame is centered
#'        when the width is less than \code{"100\%"}.
#' @param scroll logical; if \code{TRUE}, the \code{height} argument sets a fixed
#'        frame height with a scroll bar for overflowing content. Useful for HTML
#'        presentations. If \code{FALSE} (default), the height adjusts automatically.
#' @param fontFamily character; the font family for all text elements in CSS style.
#'        The default is \code{"'Helvetica Neue', Helvetica, Arial, sans-serif"}.
#' @param fontSize integer; the font size in pixels for the main text elements.
#'        All other properties are rescaled accordingly. The default is \code{16}.
#' @param titleFontSize integer; the font size in pixels for the title.
#'        The default is \code{20}.
#' @param questionFontSize integer; the font size in pixels for the question text.
#'        The default is \code{16}.
#' @param titleAlign character; the alignment of the title text. One of \code{"left"}
#'        (default), \code{"center"}, or \code{"right"}.
#' @param titleCol character; the title text color as hex color or R color name.
#'        The default is \code{"#FFFFFF"}.
#' @param titleBg character; the title background color as hex color or
#'        R color name. The default is \code{"#5F5F5F"}.
#' @param questionCol character; the question text color. The default is
#'        \code{"#1C1C1C"}. The question is displayed in its own container
#'        between the title and the answer options.
#' @param questionBg character; the background color of the question container.
#'        The default is \code{"#F7F7F7"}.
#' @param mainCol character; the text color of the answer options and main
#'        content area. The default is \code{"#1C1C1C"}.
#' @param mainBg character; the background color of the main content area.
#'        The default is \code{"#F7F7F7"}.
#' @param optionBg character; the background color of the answer option blocks.
#'        The hover color is automatically derived (30\% darker).
#'        The default is \code{"#ECECEC"}.
#' @param timerCol character; the timer text color as hex color or R color name.
#'        The default is \code{"#1C1C1C"}.
#' @param navButtonCol character; the text color of the navigation buttons
#'        (Previous, Next, Try again). The default is \code{"#FFFFFF"}.
#' @param navButtonBg character; the background color of the navigation buttons
#'        (Previous, Next, Try again). The default is \code{"#28A745"}.
#' @param tipButtonCol character; the tip button text color.
#'        The default is \code{"#1C1C1C"}.
#' @param tipButtonBg character; the tip button background color.
#'        The default is \code{"#F1F1F1"}.
#' @param tipAreaCol character; the text color of the tip area.
#'        The default is \code{"#1C1C1C"}.
#' @param tipAreaBg character; the background color of the tip area.
#'        The default is \code{"#E7F9E7"}.
#' @param tipAreaBorder character; the border color of the tip area.
#'        The default is \code{"#28A745"}.
#' @param solutionButtonCol character; the 'Show solution' button text color.
#'        The default is \code{"#1C1C1C"}.
#' @param solutionButtonBg character; the 'Show solution' button background color.
#'        The default is \code{"#F1F1F1"}.
#' @param solutionAreaCol character; the text color of the solution answer
#'        areas on the results page. The default is \code{"#1C1C1C"}.
#' @param solutionAreaBg character; the background color of the solution answer
#'        areas on the results page. The default is \code{"#D6EAF8"}.
#' @param solutionAreaBorder character; the border color of the solution answer
#'        areas on the results page. The default is \code{"#3498DB"}.
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
#' @return An HTML widget object of class \code{multiQuestions} that can be
#'   rendered in R Markdown/Quarto documents, Shiny applications, or the
#'   RStudio viewer.
#'
#' @seealso \code{\link{checkMultiQuestions}} for input validation,
#'   \code{\link{singleQuestion}} for single-question quizzes,
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
#' ### Sub-lists can be named (e.g. q1, q2) for readability but don't have to.
#' sportQuiz <- list(
#'   q1 = list(
#'     question = "Which city hosted the 2024 Summer Olympics?",
#'     options = c("Athens", "London", "Paris", "Tokyo"),
#'     answer = 3  # i.e. Paris
#'   ),
#'   q2 = list(
#'     question = "Which of the following is NOT an official
#'       Olympic summer sport?",
#'     options = c("Beach Volleyball", "Baseball", "Football",
#'       "American Football", "Basketball", "Wrestling"),
#'     answer = 4
#'   ),
#'   q3 = list(
#'     question = "Which country has won the most Winter Olympic
#'       gold medals of all time?",
#'     options = c("USA", "Canada", "Germany",
#'       "Russia", "Sweden", "Norway"),
#'     answer = 6
#'   )
#' )
#'
#' ### Check if list has the correct format
#' checkMultiQuestions(sportQuiz)   # passes
#'
#' ### Default settings
#' multiQuestions(x = sportQuiz)
#'
#' ### Custom title, shuffled questions, no timer, no solution button
#' multiQuestions(x = sportQuiz, title = "Sports Quiz",
#'   shuffle = TRUE, inclTimer = FALSE, showSolutionButton = FALSE)
#'
#' ### With tip button (only questions with a tip element show tips in SC mode)
#' sportQuizWithTips <- list(
#'   q1 = list(
#'     question = "Which city hosted the 2024 Summer Olympics?",
#'     options = c("Athens", "London", "Paris", "Tokyo"),
#'     answer = 3,
#'     tip = "They speak French there."
#'   ),
#'   q2 = list(
#'     question = "Which sport was added to the Olympics
#'       at the 2024 Paris Games?",
#'     options = c("Skateboarding", "Breaking",
#'       "Surfing", "Sport Climbing"),
#'     answer = 2  # no tip for this question
#'   )
#' )
#' multiQuestions(x = sportQuizWithTips, showTipButton = TRUE)
#'
#'
#' # --- MULTIPLE-CHOICE MODE (auto-detected from answer vector) ---
#'
#' ### If ANY question has multiple correct answers, all use checkboxes.
#' geoQuiz <- list(
#'   q1 = list(
#'     question = "Which of the following cities are in Europe?",
#'     options = c("Berlin", "Tokyo", "Paris", "Sydney", "Rome"),
#'     answer = c(1, 3, 5),
#'     tip = "Three of the five cities are European capitals."
#'   ),
#'   q2 = list(
#'     question = "Which of these rivers flow through Germany?",
#'     options = c("Rhine", "Thames", "Danube", "Seine", "Elbe"),
#'     answer = c(1, 3, 5)
#'     # no custom tip: auto-generated "Number of correct answers: 3"
#'   )
#' )
#' ### Default settings
#' multiQuestions(x = geoQuiz)
#'
#' ### Adding a title and showing the tip button
#' multiQuestions(x = geoQuiz, title = "Geography Quiz",
#'   showTipButton = TRUE)
#'
#' ### Changing the language
#' multiQuestions(x = sportQuiz, title = "Sport-Quiz",
#'   language = "de")
#' multiQuestions(x = sportQuiz, title = "Quiz sportif",
#'   language = "fr", shuffle = TRUE)
#' multiQuestions(x = sportQuiz, title = "Cuestionario deportivo",
#'   language = "es")
#'
#'
#' # --- CHANGING THE STYLE ---
#'
#' ### Adjusting the window size
#' multiQuestions(x = sportQuiz, width = "50%")
#' multiQuestions(x = geoQuiz, width = "50%", center = FALSE)
#' # height only works with scroll = TRUE
#' multiQuestions(x = sportQuiz, width = "50%",
#'   height = "300px", scroll = TRUE)
#'
#' ### Customizing the design: dark theme
#' multiQuestions(x = sportQuizWithTips,
#'   title = "Sports Quiz", showTipButton = TRUE,
#'   fontFamily = "Georgia, serif",
#'   fontSize = 20, titleFontSize = 14, questionFontSize = 14,
#'   titleCol = "#E2E8F0", titleBg = "#2D2D44",
#'   questionCol = "#E2E8F0", questionBg = "#252540",
#'   mainCol = "#E2E8F0", mainBg = "#1A1B2E",
#'   optionBg = "#252540", timerCol = "#F687B3",
#'   navButtonCol = "#FFFFFF", navButtonBg = "#6C63FF",
#'   tipButtonCol = "#68D391", tipButtonBg = "#2D2D44",
#'   tipAreaCol = "#68D391", tipAreaBg = "#162616",
#'   tipAreaBorder = "#68D391",
#'   solutionButtonCol = "#63B3ED", solutionButtonBg = "#2D2D44",
#'   solutionAreaCol = "#63B3ED", solutionAreaBg = "#111827",
#'   solutionAreaBorder = "#4299E1")
#'
#' ### Using a reusable theme
#' dark <- rquizTheme(
#'   titleCol = "#E0E0E0", titleBg = "#1A1A2E",
#'   navButtonCol = "#FFFFFF", navButtonBg = "#E94560"
#' )
#' multiQuestions(x = sportQuiz, theme = dark, title = "Themed Sports Quiz")
#' multiQuestions(x = geoQuiz, theme = dark, title = "Themed Geography Quiz")
#' }
#'
multiQuestions <- function(x,
  title = "Quiz", language = "en", shuffle = FALSE,
  showTipButton = FALSE, showSolutionButton = TRUE, inclTimer = TRUE,
  width = "100%", height = "500px",
  center = TRUE, scroll = FALSE,
  fontFamily = "'Helvetica Neue', Helvetica, Arial, sans-serif",
  fontSize = 16, titleFontSize = 20, questionFontSize = 16,
  titleAlign = "left", titleCol = "#FFFFFF", titleBg = "#5F5F5F",
  questionCol = "#1C1C1C", questionBg = "#F7F7F7",
  mainCol = "#1C1C1C", mainBg = "#F7F7F7",
  optionBg = "#ECECEC", timerCol = "#1C1C1C",
  navButtonCol = "#FFFFFF", navButtonBg = "#28A745",
  tipButtonCol = "#1C1C1C", tipButtonBg = "#F1F1F1",
  tipAreaCol = "#1C1C1C", tipAreaBg = "#E7F9E7", tipAreaBorder = "#28A745",
  solutionButtonCol = "#1C1C1C", solutionButtonBg = "#F1F1F1",
  solutionAreaCol = "#1C1C1C", solutionAreaBg = "#D6EAF8", solutionAreaBorder = "#3498DB",
  theme = NULL)
  {

  # Apply theme (theme values are overridden by explicit arguments)
  if (!is.null(theme)) {
    if (!inherits(theme, "rquizTheme"))
      stop("`theme` must be created with rquizTheme(). See ?rquizTheme.", call. = FALSE)
    defaults <- formals(multiQuestions)
    call_args <- as.list(match.call())[-1]
    themeable <- setdiff(names(defaults), c("x", "title", "theme"))
    for (nm in names(theme)) {
      if (nm %in% themeable && !nm %in% names(call_args)) {
        assign(nm, theme[[nm]])
      }
    }
  }

  # Data Validation (also auto-assigns names if missing) ------
  x <- checkMultiQuestions(x)
  # ---------------------------------------

  # Auto-detect: if any question has multiple answers, all become MC
  has_mc <- any(vapply(x, function(q) length(q$answer) > 1, logical(1)))
  choice <- if (has_mc) "multiple" else "single"

  qs <- x
  # Convert to JSON string
  quest_string <- convert2JSON(qs, choice = choice)

  # Get translations
  tr <- get_translations(language)

  # Forward options using x
  x = list(
    questions = quest_string,
    choice = choice,
    title = title,
    width = width,
    height = height,
    center = ifelse(center == TRUE, "true", "false"),
    scroll = ifelse(scroll == TRUE, "true", "false"),
    shuffle = ifelse(shuffle == TRUE, "true", "false"),
    inclTimer = ifelse(inclTimer == TRUE, "true", "false"),
    showTipBtn = ifelse(showTipButton == TRUE, "true", "false"),
    showSolutionBtn = ifelse(showSolutionButton == TRUE, "true", "false"),
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
    timerCol = timerCol,
    navBtnCol = navButtonCol,
    navBtnBg = navButtonBg,
    tipBtnCol = tipButtonCol,
    tipBtnBg = tipButtonBg,
    tipAreaCol = tipAreaCol,
    tipAreaBg = tipAreaBg,
    tipAreaBorder = tipAreaBorder,
    solutionBtnCol = solutionButtonCol,
    solutionBtnBg = solutionButtonBg,
    solutionAreaCol = solutionAreaCol,
    solutionAreaBg = solutionAreaBg,
    solutionAreaBorder = solutionAreaBorder,
    txtPrevious = tr$previous,
    txtNext = tr[["next"]],
    txtTotalQuestions = tr$totalQuestions,
    txtTotalScore = tr$totalScore,
    txtScore = tr$score,
    txtQuestion = tr$question,
    txtCorrectAnswer = tr$correctAnswer,
    txtTryAgain = tr$tryAgain,
    txtShowTips = tr$showTips,
    txtHideTips = tr$hideTips,
    txtNumberOfCorrectAnswers = tr$numberOfCorrectAnswers,
    txtShowSolution = tr$showSolution,
    txtHideSolution = tr$hideSolution
  )

  # Create widget
  htmlwidgets::createWidget(
    name = 'multiQuestions',
    x,
    width = width,
    height = if (scroll) height else NULL,
    package = 'rquiz',
    sizingPolicy = htmlwidgets::sizingPolicy(
      knitr.figure = FALSE,
      browser.fill = TRUE,
      knitr.defaultWidth = "100%",
      knitr.defaultHeight = if (scroll) 450 else "auto"
    )
  )
}

#' Shiny bindings for multiQuestions
#'
#' Output and render functions for using multiQuestions within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a multiQuestions quiz
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @return \code{multiQuestionsOutput} returns an HTML output element for use
#'   in a Shiny UI definition. \code{renderMultiQuestions} returns a
#'   server-side rendering function to be assigned to an output slot.
#' 
#' @examples
#' if (interactive()) {
#' library(shiny)
#'
#' x <- list(
#'   q1 = list(
#'     question = "What is 2+2?",
#'     options = c("3", "4", "5"),
#'     answer = 2
#'   ),
#'   q2 = list(
#'     question = "What is 3*3?",
#'     options = c("6", "9", "12"),
#'     answer = 2
#'   )
#' )
#'
#' ui <- fluidPage(
#'   multiQuestionsOutput("quiz1")
#' )
#'
#' server <- function(input, output) {
#'   output$quiz1 <- renderMultiQuestions({
#'     multiQuestions(x = x, title = "Math Quiz")
#'   })
#' }
#'
#' shinyApp(ui, server)
#' }
#'
#' @name multiQuestions-shiny
#'
#' @export
multiQuestionsOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'multiQuestions', width, height, package = 'rquiz')
}

#' @rdname multiQuestions-shiny
#' @export
renderMultiQuestions <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, multiQuestionsOutput, env, quoted = TRUE)
}

#' Create a reusable quiz theme
#'
#' Defines a set of design parameters that can be applied to any rquiz function
#' (\code{\link{singleQuestion}}, \code{\link{multiQuestions}}, \code{\link{fillBlanks}}).
#' Parameters not recognized by a particular quiz type are silently ignored.
#' Explicit values passed directly to a quiz function always override theme values.
#'
#' @param language character; language for UI text (\code{"en"}, \code{"de"},
#'        \code{"fr"}, \code{"es"}).
#' @param shuffle logical; whether to randomize options/question order.
#' @param showTipButton logical; whether to show a tip button.
#' @param showSolutionButton logical; whether to show a solution button.
#' @param width character; widget width (CSS value).
#' @param height character; widget height (CSS value).
#' @param center logical; whether to center the widget.
#' @param scroll logical; whether to use a fixed height with scrollbar.
#' @param fontFamily character; font stack for all text.
#' @param fontSize numeric; base font size in pixels.
#' @param titleFontSize numeric; title font size in pixels.
#' @param titleAlign character; title text alignment.
#' @param titleCol character; title text color.
#' @param titleBg character; title background color.
#' @param questionCol character; text color of the question container
#'   (singleQuestion, multiQuestions) or description container (fillBlanks).
#'   This container also provides visual feedback (green/red) in singleQuestion
#'   and fillBlanks.
#' @param questionBg character; background color of the question/description
#'   container (all quiz types).
#' @param questionFontSize numeric; question font size (singleQuestion, multiQuestions).
#' @param mainCol character; text color of the main content area and answer
#'   options (all quiz types).
#' @param mainBg character; background color of the main content area (all quiz types).
#' @param optionBg character; background color of answer option rows/blocks
#'   (singleQuestion, multiQuestions). Hover is auto-derived (30\% darker).
#' @param optionLabelBg character; A/B/C label background (singleQuestion only).
#' @param timerCol character; timer text color (multiQuestions only).
#' @param navButtonCol character; navigation/submit button text color (all quiz types).
#' @param navButtonBg character; navigation/submit button background color (all quiz types).
#' @param tipButtonCol character; tip button text color.
#' @param tipButtonBg character; tip button background color.
#' @param solutionButtonCol character; solution button text color.
#' @param solutionButtonBg character; solution button background color.
#' @param tipAreaCol character; tip area text color.
#' @param tipAreaBg character; tip area background color.
#' @param tipAreaBorder character; tip area border color.
#' @param solutionAreaCol character; solution area text color.
#' @param solutionAreaBg character; solution area background color.
#' @param solutionAreaBorder character; solution area border color.
#' @param descriptFontSize numeric; description font size (fillBlanks only).
#'
#' @return A named list of class \code{"rquizTheme"} containing all specified
#'   parameters. Only non-NULL values are included.
#'
#' @seealso \code{\link{singleQuestion}}, \code{\link{multiQuestions}},
#'   \code{\link{fillBlanks}} — all accept a \code{theme} argument.
#'
#' @export
#'
#' @examples
#' # Create a dark theme with shared + quiz-specific settings
#' dark <- rquizTheme(
#'   fontFamily = "Georgia, serif",
#'   fontSize = 20,
#'   titleCol = "#E0E0E0", titleBg = "#1A1A2E",
#'   questionCol = "#FFFFFF", questionBg = "#16213E",
#'   mainCol = "#E0E0E0", mainBg = "#1A1B2E",
#'   optionBg = "#252540", optionLabelBg = "#0F3460",
#'   navButtonCol = "#FFFFFF", navButtonBg = "#E94560",
#'   tipButtonCol = "#E0E0E0", tipButtonBg = "#2C2C3E",
#'   solutionButtonCol = "#E0E0E0", solutionButtonBg = "#2C2C3E",
#'   tipAreaCol = "#E0E0E0", tipAreaBg = "#1A2A1A",
#'   tipAreaBorder = "#4CAF50",
#'   solutionAreaCol = "#E0E0E0", solutionAreaBg = "#1A1A2E",
#'   solutionAreaBorder = "#5DADE2"
#' )
#'
#' \donttest{
#' # Apply to singleQuestion:
#' singleQuestion(
#'   x = list(
#'     question = "Which ocean is the largest?",
#'     options = c("Atlantic", "Indian", "Pacific", "Arctic"),
#'     answer = 3
#'   ),
#'   theme = dark, title = "Geography Quiz"
#' )
#'
#' # Apply to multiQuestions (uses mainCol, mainBg, navButtonBg, etc.):
#' multiQuestions(
#'   x = list(
#'     q1 = list(
#'       question = "What is the capital of Japan?",
#'       options = c("Seoul", "Tokyo", "Beijing"),
#'       answer = 2
#'     ),
#'     q2 = list(
#'       question = "Which river is the longest?",
#'       options = c("Amazon", "Nile", "Yangtze"),
#'       answer = 2
#'     )
#'   ),
#'   theme = dark, title = "Geography Quiz"
#' )
#'
#' # Apply to fillBlanks:
#' fillBlanks(
#'   x = list(
#'     cloze = "The $$!Nile!$$ is the longest river in $$!Africa!$$."
#'   ),
#'   theme = dark, title = "Geography Quiz"
#' )
#'
#' # Explicit values override the theme:
#' singleQuestion(
#'   x = list(
#'     question = "Which ocean is the largest?",
#'     options = c("Atlantic", "Indian", "Pacific", "Arctic"),
#'     answer = 3
#'   ),
#'   theme = dark, titleBg = "#FF0000"
#' )
#' }
#'
rquizTheme <- function(
  language = NULL, shuffle = NULL,
  showTipButton = NULL, showSolutionButton = NULL,
  width = NULL, height = NULL, center = NULL, scroll = NULL,
  fontFamily = NULL, fontSize = NULL,
  titleFontSize = NULL, titleAlign = NULL,
  titleCol = NULL, titleBg = NULL,
  questionCol = NULL, questionBg = NULL,
  questionFontSize = NULL,
  mainCol = NULL, mainBg = NULL,
  optionBg = NULL, optionLabelBg = NULL,
  timerCol = NULL,
  navButtonCol = NULL, navButtonBg = NULL,
  tipButtonCol = NULL, tipButtonBg = NULL,
  solutionButtonCol = NULL, solutionButtonBg = NULL,
  tipAreaCol = NULL, tipAreaBg = NULL, tipAreaBorder = NULL,
  solutionAreaCol = NULL, solutionAreaBg = NULL, solutionAreaBorder = NULL,
  descriptFontSize = NULL
) {
  # Collect all non-NULL arguments
  args <- as.list(environment())
  theme <- args[!vapply(args, is.null, logical(1))]
  structure(theme, class = "rquizTheme")
}

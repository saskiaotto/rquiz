#' Validate a single question object
#'
#' Checks that a question list is correctly structured for use in
#' \code{\link{singleQuestion}}. Validates required fields, answer index
#' bounds, and detects question type automatically.
#'
#' @param x A named list with at least the following elements:
#'   \describe{
#'     \item{question}{A character string with the question text.}
#'     \item{options}{A character vector of answer options (min. 2).}
#'     \item{answer}{An integer vector of correct answer index/indices
#'       (1-based). Length > 1 is interpreted as multiple-choice.}
#'     \item{tip}{(optional) A character string shown as a hint.}
#'   }
#'
#' @return The input \code{x} invisibly if all checks pass.
#'
#' @seealso \code{\link{singleQuestion}} which calls this function internally,
#'   \code{\link{checkMultiQuestions}} for validating lists of questions.
#'
#' @export
#'
#' @examples
#' # Single-choice question
#' q_sc <- list(
#'   question = "Which planet is closest to the Sun?",
#'   options  = c("Venus", "Mercury", "Mars"),
#'   answer   = 2L,
#'   tip      = "It's also the smallest planet."
#' )
#' checkSingleQuestion(q_sc)
#'
#' # Multiple-choice question (auto-detected from answer length)
#' q_mc <- list(
#'   question = "Which are noble gases?",
#'   options  = c("Helium", "Oxygen", "Neon", "Iron"),
#'   answer   = c(1L, 3L)
#' )
#' checkSingleQuestion(q_mc)
checkSingleQuestion <- function(x) {

  helpref <- "See ?checkSingleQuestion or ?singleQuestion for examples."

  # Must be a list
  if (!is.list(x))
    stop("`x` must be a named list.\n  ", helpref, call. = FALSE)

  # Required fields
  required <- c("question", "options", "answer")
  missing_fields <- setdiff(required, names(x))
  if (length(missing_fields) > 0)
    stop("The question list must have named elements: 'question', 'options', ",
      "and 'answer' (plus optionally 'tip'). Missing: ",
      paste(missing_fields, collapse = ", "), ".\n",
      "  Example: list(question = \"What is 2+2?\", ",
      "options = c(\"3\", \"4\", \"5\"), answer = 2)\n",
      "  ", helpref,
      call. = FALSE)

  # Check for unknown elements
  allowed <- c("question", "options", "answer", "tip")
  unknown <- setdiff(names(x), allowed)
  if (length(unknown) > 0)
    stop("Unknown element(s): ", paste0("'", unknown, "'", collapse = ", "), ".\n",
      "  Allowed elements are: 'question', 'options', 'answer', and optionally 'tip'.\n",
      "  ", helpref,
      call. = FALSE)

  # question must be a non-empty string
  if (!is.character(x$question) || nchar(trimws(x$question)) == 0)
    stop("`question` must be a non-empty character string.\n  ", helpref,
      call. = FALSE)

  # options: character vector, min. 2
  if (!is.character(x$options) || length(x$options) < 2)
    stop("`options` must be a character vector with at least 2 elements.\n  ",
      helpref, call. = FALSE)

  # answer: numeric/integer, no NAs
  if (!is.numeric(x$answer) || anyNA(x$answer))
    stop("`answer` must be a numeric vector without NAs.\n  ", helpref,
      call. = FALSE)

  n_opts <- length(x$options)
  if (any(x$answer < 1) || any(x$answer > n_opts))
    stop("`answer` index out of range (1-", n_opts, ").\n  ", helpref,
      call. = FALSE)

  if (anyDuplicated(x$answer))
    stop("`answer` contains duplicate indices.\n  ", helpref, call. = FALSE)

  # MC-specific: at least one wrong option must exist
  if (length(x$answer) > 1 && length(x$answer) == n_opts)
    warning("All options are marked correct \u2014 no wrong answers in MC question.\n  ",
      helpref, call. = FALSE)

  # tip: if present, must be character
  if (!is.null(x$tip) && (!is.character(x$tip) || length(x$tip) != 1))
    stop("`tip` must be a single character string.\n  ", helpref, call. = FALSE)

  invisible(x)
}

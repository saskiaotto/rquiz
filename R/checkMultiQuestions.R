#' Validate a list of question objects
#'
#' Checks that all questions in a list are correctly structured for use in
#' \code{\link{multiQuestions}}. Each question is validated via
#' \code{\link{checkSingleQuestion}}. The list elements can be named (e.g.
#' \code{q1}, \code{q2}) or unnamed — unnamed elements are automatically
#' assigned names \code{q1}, \code{q2}, etc.
#'
#' @param x A list of question lists, each conforming to the structure
#'   described in \code{\link{checkSingleQuestion}}.
#'
#' @return The input \code{x} (with names assigned if needed) invisibly if all
#'   checks pass.
#'
#' @seealso \code{\link{multiQuestions}} which calls this function internally,
#'   \code{\link{checkSingleQuestion}} for validating individual questions.
#'
#' @export
#'
#' @examples
#' questions <- list(
#'   q1 = list(
#'     question = "Which planet is closest to the Sun?",
#'     options  = c("Venus", "Mercury", "Mars"),
#'     answer   = 2L
#'   ),
#'   q2 = list(
#'     question = "Which are noble gases?",
#'     options  = c("Helium", "Oxygen", "Neon", "Iron"),
#'     answer   = c(1L, 3L)
#'   )
#' )
#' checkMultiQuestions(questions)
checkMultiQuestions <- function(x) {

  helpref <- "See ?checkMultiQuestions or ?multiQuestions for examples."

  if (!is.list(x) || length(x) == 0)
    stop("`x` must be a non-empty list of question lists.\n  ", helpref,
      call. = FALSE)

  # Detect if user passed a single flat question instead of a list of questions
  # (i.e. x has elements named 'question', 'options', 'answer')
  if (all(c("question", "options", "answer") %in% names(x))) {
    stop(
      "`x` looks like a single question, not a list of questions.\n",
      "  Wrap it in an outer list: list(q1 = list(question = ..., options = ..., answer = ...))\n",
      "  ", helpref,
      call. = FALSE
    )
  }

  # Check that each element is itself a list (not an atomic vector)
  not_lists <- !vapply(x, is.list, logical(1))
  if (any(not_lists)) {
    stop(
      "Each element of `x` must be a question list (with 'question', 'options', 'answer').\n",
      "  Element(s) ", paste(which(not_lists), collapse = ", "),
      " are not lists.\n",
      "  ", helpref,
      call. = FALSE
    )
  }

  # Auto-assign names if missing or incomplete
  if (is.null(names(x))) {
    names(x) <- paste0("q", seq_along(x))
  } else {
    empty <- nchar(names(x)) == 0
    if (any(empty)) {
      names(x)[empty] <- paste0("q", which(empty))
    }
  }

  # Validate each question and collect ALL errors
  errors <- character(0)
  warnings_list <- character(0)

  for (nm in names(x)) {
    tryCatch(
      withCallingHandlers(
        checkSingleQuestion(x[[nm]]),
        warning = function(w) {
          warnings_list <<- c(warnings_list, paste0("Question '", nm, "': ", conditionMessage(w)))
          invokeRestart("muffleWarning")
        }
      ),
      error = function(e) {
        errors <<- c(errors, paste0("Question '", nm, "': ", conditionMessage(e)))
      }
    )
  }

  # Show all warnings
  for (w in warnings_list) warning(w, call. = FALSE)

  # Report all errors at once
  if (length(errors) > 0) {
    stop(paste(errors, collapse = "\n"), call. = FALSE)
  }

  invisible(x)
}

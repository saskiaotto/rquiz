#' Returns a JSON-formatted string
#'
#' \code{convert2JSON} is a helper function for the \code{\link{multiQuestions}}
#' quiz function. It converts its input list into a Javascript object and returns
#' it as JSON text. This text can then be read by the multiQuestions Javascript code.
#'
#' @param x The input list of the \code{\link{multiQuestions}} function, which is
#'        a list of lists, each containing 3 or 4 elements (question, options,
#'        answer, and optionally tip).
#' @param choice A character string specifying the quiz mode. Either \code{"single"}
#'        (default) or \code{"multiple"} for multiple-choice.
#'
#' @return
#' The function returns a JSON-formatted string containing a JS object of all
#' questions.
#'
#' @seealso \code{\link{multiQuestions}}
#'
#' @importFrom stats setNames
#' @keywords internal
#'
#'
convert2JSON <- function(x, choice = "single") {

  questions <- lapply(seq_along(x), function(i) {
    lett <- letters[1:length(x[[i]][[2]])]

    # Question-specific data validation
    if (length(lett) < 2) {
      stop(paste0("Question ", i, " requires at least 2 answer options."))
    }
    if (any(!x[[i]][[3]] %in% 1:length(x[[i]][[2]]))) {
      stop(paste0("The index of the correct answer in question ", i,
        " exceeds the number of answer options."))
    }

    # Remove line breaks in the first 2 list elements
    question_clean <- gsub("\n", "", x[[i]][[1]])
    options_clean <- gsub("\n", "", x[[i]][[2]])

    # Build named options list (a = "opt1", b = "opt2", ...)
    options_named <- setNames(as.list(as.character(options_clean)), lett)

    # Build answer: string for single-choice, array for multiple-choice
    if (choice == "single") {
      answer <- as.character(options_clean[x[[i]][[3]]])
    } else {
      answer <- as.list(as.character(options_clean[x[[i]][[3]]]))
    }

    # Extract optional tip text (4th element)
    tip_text <- if (length(x[[i]]) >= 4 && is.character(x[[i]][[4]])) x[[i]][[4]] else ""

    list(
      id = i,
      question = question_clean,
      options = list(options_named),
      answer = answer,
      tip = tip_text,
      score = 0,
      status = ""
    )
  })

  as.character(jsonlite::toJSON(questions, auto_unbox = TRUE))
}

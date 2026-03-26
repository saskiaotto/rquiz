#' Validate a fill-in-the-blank question object
#'
#' Checks that a cloze question list is correctly structured for use in
#' \code{\link{fillBlanks}}. Validates required fields, cloze markers, and
#' optional additional options.
#'
#' @param x A named list with at least the following element:
#'   \describe{
#'     \item{cloze}{A character string containing the cloze text with blank
#'       markers. Each blank must be enclosed between \code{$$!} (opening tag)
#'       and \code{!$$} (closing tag), e.g.
#'       \code{"R is a $$!programming!$$ language"}.}
#'     \item{addOptions}{(optional) A character vector of additional distractor
#'       options displayed as answer choices alongside the correct answers.}
#'   }
#'
#' @return The input \code{x} invisibly if all checks pass.
#'
#' @seealso \code{\link{fillBlanks}} which calls this function internally.
#'
#' @export
#'
#' @examples
#' # Valid cloze text
#' txt <- list(
#'   cloze = "R is a $$!programming!$$ language for $$!statistical computing!$$.",
#'   addOptions = c("natural", "colloquial")
#' )
#' checkFillBlanks(txt)
#'
#' # Minimal (without addOptions)
#' txt2 <- list(cloze = "The capital of France is $$!Paris!$$.")
#' checkFillBlanks(txt2)
#'
checkFillBlanks <- function(x) {

  helpref <- "See ?checkFillBlanks or ?fillBlanks for examples."

  # Must be a list
  if (!is.list(x)) {
    stop(
      "`x` must be a named list with at least a 'cloze' element.\n",
      "  Example: list(cloze = \"R is a $$!programming!$$ language.\")\n",
      "  ", helpref,
      call. = FALSE
    )
  }

  # Check for unnamed elements (common mistake: forgetting to name addOptions)
  if (length(x) > 0 && !is.null(names(x))) {
    unnamed <- which(nchar(names(x)) == 0)
    if (length(unnamed) > 0) {
      stop(
        "All elements of `x` must be named. Element(s) at position ",
        paste(unnamed, collapse = ", "), " have no name.\n",
        "  Allowed names are: 'cloze' (required) and 'addOptions' (optional).\n",
        "  ", helpref,
        call. = FALSE
      )
    }
  }

  # Check for unexpected elements
  allowed <- c("cloze", "addOptions")
  unknown <- setdiff(names(x), allowed)
  if (length(unknown) > 0) {
    stop(
      "Unknown element(s) in `x`: ", paste0("'", unknown, "'", collapse = ", "), ".\n",
      "  Allowed elements are: 'cloze' (required) and 'addOptions' (optional).\n",
      "  ", helpref,
      call. = FALSE
    )
  }

  # Must have 'cloze' element
  if (!"cloze" %in% names(x)) {
    stop(
      "`x` must contain a named element 'cloze' with the cloze text.\n",
      "  Example: list(cloze = \"R is a $$!programming!$$ language.\")\n",
      "  ", helpref,
      call. = FALSE
    )
  }

  # 'cloze' must be a non-empty string
  if (!is.character(x$cloze) || length(x$cloze) != 1 || nchar(trimws(x$cloze)) == 0) {
    stop(
      "`cloze` must be a single non-empty character string.\n",
      "  ", helpref,
      call. = FALSE
    )
  }

  # Must contain at least one blank marker pair $$!...!$$
  has_open <- grepl("$$!", x$cloze, fixed = TRUE)
  has_close <- grepl("!$$", x$cloze, fixed = TRUE)

  if (!has_open || !has_close) {
    stop(
      "The 'cloze' text must contain at least one blank marker.\n",
      "  Mark blanks with $$! and !$$, e.g. \"R is a $$!programming!$$ language.\"\n",
      "  ", helpref,
      call. = FALSE
    )
  }

  # Check that opening and closing tags are balanced
  n_open <- lengths(regmatches(x$cloze, gregexpr("\\$\\$!", x$cloze)))
  n_close <- lengths(regmatches(x$cloze, gregexpr("!\\$\\$", x$cloze)))
  if (n_open != n_close) {
    stop(
      "Unbalanced blank markers: found ", n_open, " opening ($$!) and ",
      n_close, " closing (!$$) tags.\n",
      "  ", helpref,
      call. = FALSE
    )
  }

  # 'addOptions' if present must be a character vector
  if ("addOptions" %in% names(x)) {
    if (!is.character(x$addOptions) || length(x$addOptions) == 0) {
      stop(
        "`addOptions` must be a non-empty character vector of distractor options.\n",
        "  ", helpref,
        call. = FALSE
      )
    }
  }

  invisible(x)
}

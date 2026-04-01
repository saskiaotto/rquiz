#' Convert cloze text to HTML
#'
#' \code{convertFillBlanks2HTML} is a helper function for the \code{\link{fillBlanks}}
#' quiz function. It converts the input list containing the cloze text into
#' HTML strings with blank input fields. These strings are then used by the
#' fillBlanks JavaScript code and appended to the HTML cloze and option
#' div elements.
#'
#' @param x The input list of the \code{\link{fillBlanks}} function, which contains
#'          2 **named** elements:
#'      \itemize{
#'         \item \code{$cloze} A string containing the full text **including** the words,
#'                signs or items to be removed. These text parts should be indicated
#'                by placing them between an opening 'tag' \code{$$!} and a closing 'tag'
#'                \code{!$$}. Anything inside these tags will be removed from the cloze text
#'                and shown as answer options at the bottom of the widget (if tip button is
#'                displayed).
#'         \item \code{$addOptions} A character vector containing additional
#'                answer options to show in the tip section.
#'      }
#' @param blanksWidth character; a string providing the width (in pixels) of the blank fields.
#'        This is defined by the user in the function \code{\link{fillBlanks}}. If
#'        set to \code{NULL}, the width is chosen by the system.
#' @param blanksAlign character; the default alignment of the answer options once placed into
#'        the correct blank field is \code{"center"}. Other options are \code{"left"} and
#'        \code{"right"}. The former is more suitable for coding syntax. This is
#'        defined by the user in the function \code{\link{fillBlanks}}.
#'
#' @return
#' A list with 3 named elements:
#' \describe{
#'   \item{\code{cloze}}{An HTML string of the cloze text with input fields
#'     replacing the \code{$$!...!$$} markers.}
#'   \item{\code{answers}}{A character vector of the correct answers (extracted
#'     from the markers).}
#'   \item{\code{options}}{An HTML string of span elements for all answer
#'     options (correct + additional), randomized in order.}
#' }
#'
#' @seealso \code{\link{fillBlanks}}, \code{\link{checkFillBlanks}}
#'
#' @keywords internal
#'
convertFillBlanks2HTML <- function(x, blanksWidth, blanksAlign) {

  # Clean string: replace all "\n"
  clean_x <- gsub("\n", "", x$cloze)

  # Split string
  pattern <- "!$$"
  split_end <- unlist(strsplit(clean_x, pattern, fixed = TRUE))
  pattern <- "$$!"
  split_start <- strsplit(split_end, pattern, fixed = TRUE)
  which_incl <- grepl(pattern, split_end, fixed = TRUE)

  cloze_vec <- vector("numeric")
  opt_vec <- vector("numeric")

  # Create style string for input fields
  if (!is.null(blanksWidth) && blanksWidth != "auto") {
    style1 <- paste0("min-width:", blanksWidth)
  } else {
    style1 <- NULL
  }
  if (!is.null(blanksAlign)) {
    style2 <- paste0("text-align:", blanksAlign)
  } else {
    style2 <- NULL
  }
  style12 <- paste(style1, style2, sep = "; ")
  if (nchar(style12) > 0) {
    style <- paste0("style='", style12, "'")
  } else {
    style <- ""
  }

  counter <- 1
  for (i in seq_along(which_incl)) {
    # Get cloze elements
    if (!isTRUE(which_incl[i])) {
      cloze_vec <- c(cloze_vec, split_start[[i]][1])
    } else {
      if (length(split_start[[i]]) > 1) {
        cloze_vec <- c(cloze_vec, split_start[[i]][1])
        cloze_vec <- c(cloze_vec,
          paste0("<input type='text' class='fbq-target' data-accept='",
            counter, "' aria-label='Blank ", counter, "' ",
            style, ">&nbsp;</span>") )
        counter <- counter+1
      }
    }
    # Get options
    if (isTRUE(which_incl[i])) {
      if (length(split_start[[i]]) == 1) {
        opt_vec <- c(opt_vec, split_start[[i]][1])
      } else {
        opt_vec <- c(opt_vec, split_start[[i]][2])
      }
    }
  }

  cloze_txt <- paste(cloze_vec, collapse = "")

  correct_answers <- opt_vec

  # Generate option text
  if(length(x) == 2) {
    opt_vec_full <- c(opt_vec, x$addOptions)
  } else {
    opt_vec_full <- opt_vec
  }

  opt_txt <- vector("character", length(opt_vec_full))
  for (i in seq_along(opt_vec_full)) {
    opt_txt[i] <- paste0("<span class='fbq-option'>",
      opt_vec_full[i], "</span>")
  }

  # Randomize order
  rand <- sample(1:length(opt_vec_full))
  opt_txt <- paste(opt_txt[rand], collapse = " ")

  # Return list
  out <- list(
    cloze = cloze_txt,
    answers = correct_answers,
    options = opt_txt
  )

  # End of function
  return(out)
}

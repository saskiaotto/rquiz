#' Get translations for a given language
#'
#' Reads the central translations JSON file and returns the translations
#' for the specified language. Falls back to English if the language is
#' not found.
#'
#' @param language character; a language code (e.g. \code{"en"}, \code{"de"},
#'        \code{"fr"}, \code{"es"}).
#'
#' @return A named list of translated strings.
#'
#' @keywords internal
get_translations <- function(language = "en") {
  json_path <- system.file("translations.json", package = "rquiz")
  if (json_path == "") {
    stop("translations.json not found in the rquiz package.")
  }
  all_translations <- jsonlite::fromJSON(json_path, simplifyVector = FALSE)

  if (!language %in% names(all_translations)) {
    warning(paste0("Language '", language, "' not found in translations. ",
      "Falling back to English ('en'). Available languages: ",
      paste(names(all_translations), collapse = ", ")))
    language <- "en"
  }

  all_translations[[language]]
}

test_that("get_translations returns named list for all supported languages", {
  for (lang in c("en", "de", "fr", "es")) {
    tr <- get_translations(lang)
    expect_type(tr, "list")
    expect_true(length(tr) > 0)
  }
})

test_that("get_translations contains all required keys", {
  required_keys <- c(
    "submit", "showTips", "hideTips", "showSolution", "hideSolution",
    "previous", "next", "tryAgain",
    "totalQuestions", "totalScore", "score", "question",
    "correctAnswer", "correctAnswers",
    "numberOfCorrectAnswers", "tipIntro", "description",
    "resultCorrect", "resultWrong",
    "feedbackCorrectSelected", "feedbackWrongOptions", "feedbackMissing",
    "optionSingular", "optionPlural", "answerSingular", "answerPlural"
  )
  for (lang in c("en", "de", "fr", "es")) {
    tr <- get_translations(lang)
    for (key in required_keys) {
      expect_true(key %in% names(tr),
        info = paste0("Key '", key, "' missing in language '", lang, "'"))
    }
  }
})

test_that("get_translations falls back to English with warning for unknown language", {
  expect_warning(tr <- get_translations("xx"), "not found")
  tr_en <- get_translations("en")
  expect_equal(tr$submit, tr_en$submit)
})

test_that("English translations have expected values", {
  tr <- get_translations("en")
  expect_equal(tr$submit, "Submit")
  expect_equal(tr$showTips, "Show tips")
  expect_equal(tr$hideTips, "Hide tips")
  expect_equal(tr$showSolution, "Show solution")
  expect_equal(tr$hideSolution, "Hide solution")
  expect_equal(tr$tryAgain, "Try again")
  expect_equal(tr$description, "Fill in the blanks.")
})

test_that("German translations have expected values", {
  tr <- get_translations("de")
  expect_equal(tr$submit, "Absenden")
  expect_equal(tr$description, "F\u00fclle die L\u00fccken.")
})

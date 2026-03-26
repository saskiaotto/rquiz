# Valid test inputs (named lists as required by checkMultiQuestions)
valid_x <- list(
  q1 = list(question = "What is 2+2?", options = c("3", "4", "5"), answer = 2),
  q2 = list(question = "What is 3+3?", options = c("5", "6", "7"), answer = 2)
)

valid_mc <- list(
  q1 = list(question = "Which are even?", options = c("1", "2", "3", "4"), answer = c(2, 4)),
  q2 = list(question = "Which are odd?", options = c("1", "2", "3"), answer = c(1, 3))
)

# --- Widget creation ---

test_that("multiQuestions returns an htmlwidget object", {
  w <- multiQuestions(x = valid_x)
  expect_s3_class(w, "htmlwidget")
  expect_s3_class(w, "multiQuestions")
})

test_that("multiQuestions auto-detects multiple-choice", {
  w <- multiQuestions(x = valid_mc)
  expect_s3_class(w, "multiQuestions")
  expect_equal(w$x$choice, "multiple")
})

test_that("multiQuestions auto-detects single-choice", {
  w <- multiQuestions(x = valid_x)
  expect_equal(w$x$choice, "single")
})

test_that("multiQuestions detects MC if any question has multiple answers", {
  mixed <- list(
    q1 = list(question = "SC question?", options = c("A", "B", "C"), answer = 1),
    q2 = list(question = "MC question?", options = c("X", "Y", "Z"), answer = c(1, 3))
  )
  w <- multiQuestions(x = mixed)
  expect_equal(w$x$choice, "multiple")
})

# --- Parameter validation errors ---

test_that("multiQuestions errors when x is not a list", {
  expect_error(multiQuestions(x = "not a list"), "non-empty list")
})

test_that("multiQuestions auto-names unnamed questions", {
  unnamed <- list(list(question = "Q?", options = c("A", "B"), answer = 1))
  w <- multiQuestions(x = unnamed)
  expect_s3_class(w, "htmlwidget")
})

test_that("multiQuestions errors when answer is not numeric", {
  bad <- list(q1 = list(question = "Q?", options = c("A", "B"), answer = "A"))
  expect_error(multiQuestions(x = bad), "numeric")
})

test_that("multiQuestions errors when answer index out of range", {
  bad <- list(q1 = list(question = "Q?", options = c("A", "B"), answer = 5))
  expect_error(multiQuestions(x = bad), "out of range")
})

test_that("multiQuestions reports errors in multiple questions at once", {
  bad <- list(
    q1 = list(
      "Which planet?",
      options = c("Venus", "Mercury", "Mars"),
      answer = 2,
      tips = "smallest planet"
    ),
    q2 = list(
      question = "Which are noble gases?",
      options = c("Helium", "Oxygen", "Neon", "Iron"),
      c(1, 3)
    )
  )
  expect_error(multiQuestions(x = bad), "q1.*q2")
})

test_that("multiQuestions errors on flat question list", {
  bad <- list(
    question = "Which planet?",
    options = c("Venus", "Mercury"),
    answer = 2,
    question = "Which gas?",
    options = c("Helium", "Neon"),
    answer = c(1, 2)
  )
  expect_error(multiQuestions(x = bad), "single question.*not a list of questions")
})

test_that("multiQuestions error messages reference help pages", {
  expect_error(multiQuestions(x = "bad"), "checkMultiQuestions|multiQuestions")
})

# --- Defaults ---

test_that("multiQuestions default title is 'Quiz'", {
  w <- multiQuestions(x = valid_x)
  expect_equal(w$x$title, "Quiz")
})

test_that("multiQuestions default showSolutionButton is TRUE", {
  w <- multiQuestions(x = valid_x)
  expect_equal(w$x$showSolutionBtn, "true")
})

test_that("multiQuestions default inclTimer is TRUE", {
  w <- multiQuestions(x = valid_x)
  expect_equal(w$x$inclTimer, "true")
})

test_that("multiQuestions default shuffle is FALSE", {
  w <- multiQuestions(x = valid_x)
  expect_equal(w$x$shuffle, "false")
})

# --- Language support ---

test_that("multiQuestions passes English translations by default", {
  w <- multiQuestions(x = valid_x)
  expect_equal(w$x$txtPrevious, "Previous")
  expect_equal(w$x$txtNext, "Next")
  expect_equal(w$x$txtTryAgain, "Try again")
  expect_equal(w$x$txtTotalScore, "Total Score")
  expect_equal(w$x$txtScore, "Score")
  expect_equal(w$x$txtShowSolution, "Show solution")
})

test_that("multiQuestions passes German translations", {
  w <- multiQuestions(x = valid_x, language = "de")
  expect_equal(w$x$txtPrevious, "Zur\u00fcck")
  expect_equal(w$x$txtNext, "Weiter")
  expect_equal(w$x$txtTryAgain, "Nochmal")
  expect_equal(w$x$txtTotalScore, "Gesamtpunktzahl")
})

test_that("multiQuestions passes French translations", {
  w <- multiQuestions(x = valid_x, language = "fr")
  expect_equal(w$x$txtPrevious, "Pr\u00e9c\u00e9dent")
  expect_equal(w$x$txtNext, "Suivant")
})

test_that("multiQuestions passes color parameters correctly", {
  w <- multiQuestions(x = valid_x, titleCol = "#FF0000", mainBg = "#AABBCC")
  expect_equal(w$x$titleCol, "#FF0000")
  expect_equal(w$x$mainBg, "#AABBCC")
})

test_that("multiQuestions passes custom title", {
  w <- multiQuestions(x = valid_x, title = "My Quiz")
  expect_equal(w$x$title, "My Quiz")
})

test_that("multiQuestions nav button colors have correct defaults", {
  w <- multiQuestions(x = valid_x)
  expect_equal(w$x$navBtnCol, "#FFFFFF")
  expect_equal(w$x$navBtnBg, "#28A745")
})

test_that("multiQuestions nav button colors can be customized", {
  w <- multiQuestions(x = valid_x, navButtonCol = "#000000", navButtonBg = "#3498DB")
  expect_equal(w$x$navBtnCol, "#000000")
  expect_equal(w$x$navBtnBg, "#3498DB")
})

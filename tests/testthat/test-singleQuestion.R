# Valid test inputs
valid_sc <- list(
  question = "What is 2+2?",
  options = c("3", "4", "5"),
  answer = 2
)

valid_mc <- list(
  question = "Which are even?",
  options = c("1", "2", "3", "4"),
  answer = c(2, 4)
)

valid_mc_tip <- list(
  question = "Which are even?",
  options = c("1", "2", "3", "4"),
  answer = c(2, 4),
  tip = "Two of them are even."
)

# --- Widget creation ---

test_that("singleQuestion returns an htmlwidget object", {
  w <- singleQuestion(x = valid_sc)
  expect_s3_class(w, "htmlwidget")
  expect_s3_class(w, "singleQuestion")
})

test_that("singleQuestion auto-detects multiple-choice from answer length", {
  w <- singleQuestion(x = valid_mc)
  expect_s3_class(w, "singleQuestion")
  expect_equal(w$x$choice, "multiple")
})

test_that("singleQuestion auto-detects single-choice from answer length", {
  w <- singleQuestion(x = valid_sc)
  expect_equal(w$x$choice, "single")
})

test_that("singleQuestion works with 4-element list (tip)", {
  w <- singleQuestion(x = valid_mc_tip)
  expect_s3_class(w, "singleQuestion")
})

# --- Parameter validation errors ---

test_that("singleQuestion errors when x is not a list", {
  expect_error(singleQuestion(x = "not a list"), "must be a list")
})

test_that("singleQuestion errors when x has wrong number of elements", {
  expect_error(singleQuestion(x = list("a", "b")), "3 or 4")
  expect_error(
    singleQuestion(x = list("a", "b", 1, "c", "d")),
    "3 or 4"
  )
})

test_that("singleQuestion errors when answer is not numeric", {
  bad <- list(question = "Q?", options = c("A", "B"), answer = "A")
  expect_error(singleQuestion(x = bad), "numeric")
})

test_that("singleQuestion errors when answer index out of range", {
  bad <- list(question = "Q?", options = c("A", "B"), answer = 5)
  expect_error(singleQuestion(x = bad), "out of range")
})

test_that("singleQuestion errors on duplicate answer indices", {
  bad <- list(question = "Q?", options = c("A", "B", "C"), answer = c(1, 1))
  expect_error(singleQuestion(x = bad), "duplicate")
})

test_that("singleQuestion errors when named elements are missing", {
  bad <- list(
    "What is 2+2?",
    c("3", "4", "5"),
    answer = 2
  )
  expect_error(singleQuestion(x = bad), "Missing.*question|Missing.*options")
})

test_that("singleQuestion errors on unknown elements (e.g. typo 'tips')", {
  bad <- list(question = "Q?", options = c("A", "B"), answer = 1, tips = "hint")
  expect_error(singleQuestion(x = bad), "Unknown element")
})

test_that("singleQuestion error messages reference help pages", {
  expect_error(singleQuestion(x = "bad"), "checkSingleQuestion|singleQuestion")
})

# --- Defaults and language ---

test_that("singleQuestion passes language translations to widget", {
  w <- singleQuestion(x = valid_mc, language = "de")
  expect_equal(w$x$txtSubmit, "Absenden")
  expect_equal(w$x$txtShowTips, "Tipps anzeigen")
  expect_equal(w$x$txtShowSolution, "L\u00f6sung anzeigen")
})

test_that("singleQuestion passes English translations by default", {
  w <- singleQuestion(x = valid_mc)
  expect_equal(w$x$txtSubmit, "Submit")
  expect_equal(w$x$txtShowTips, "Show tips")
})

test_that("singleQuestion passes custom tip text from x$tip", {
  w <- singleQuestion(x = valid_mc_tip)
  expect_equal(w$x$tipText, "Two of them are even.")
})

test_that("singleQuestion default tip text is empty when no tip provided", {
  w <- singleQuestion(x = valid_mc)
  expect_equal(w$x$tipText, "")
})

test_that("singleQuestion shuffle defaults to false", {
  w <- singleQuestion(x = valid_sc)
  expect_equal(w$x$shuffle, "false")
})

test_that("singleQuestion passes color parameters correctly", {
  w <- singleQuestion(x = valid_sc, titleCol = "#FF0000", titleBg = "#00FF00")
  expect_equal(w$x$titleCol, "#FF0000")
  expect_equal(w$x$titleBg, "#00FF00")
})

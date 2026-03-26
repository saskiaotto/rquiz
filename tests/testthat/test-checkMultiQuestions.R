# --- Valid inputs ---

test_that("checkMultiQuestions passes for valid named list", {
  x <- list(
    q1 = list(question = "Q1?", options = c("A", "B"), answer = 1),
    q2 = list(question = "Q2?", options = c("C", "D"), answer = 2)
  )
  expect_invisible(checkMultiQuestions(x))
})

test_that("checkMultiQuestions passes for unnamed list (auto-names assigned)", {
  x <- list(
    list(question = "Q1?", options = c("A", "B"), answer = 1),
    list(question = "Q2?", options = c("C", "D"), answer = 2)
  )
  result <- checkMultiQuestions(x)
  expect_equal(names(result), c("q1", "q2"))
})

test_that("checkMultiQuestions passes for mixed SC and MC questions", {
  x <- list(
    q1 = list(question = "SC?", options = c("A", "B"), answer = 1),
    q2 = list(question = "MC?", options = c("A", "B", "C"), answer = c(1, 3))
  )
  expect_invisible(checkMultiQuestions(x))
})

# --- Flat list detection ---

test_that("checkMultiQuestions detects flat list (single question not wrapped)", {
  x <- list(
    question = "Q?",
    options = c("A", "B"),
    answer = 1
  )
  expect_error(checkMultiQuestions(x), "single question.*not a list of questions")
})

test_that("checkMultiQuestions detects flat list with duplicate names", {
  x <- list(
    question = "Q1?", options = c("A", "B"), answer = 1,
    question = "Q2?", options = c("C", "D"), answer = 2
  )
  expect_error(checkMultiQuestions(x), "single question")
})

# --- Non-list elements ---

test_that("checkMultiQuestions errors when elements are not lists", {
  x <- list(q1 = "not a list", q2 = list(question = "Q?", options = c("A", "B"), answer = 1))
  expect_error(checkMultiQuestions(x), "must be a question list")
})

# --- Empty input ---

test_that("checkMultiQuestions errors on empty list", {
  expect_error(checkMultiQuestions(list()), "non-empty")
})

test_that("checkMultiQuestions errors on non-list input", {
  expect_error(checkMultiQuestions("not a list"), "non-empty")
})

# --- Multiple errors collected ---

test_that("checkMultiQuestions reports errors from multiple questions at once", {
  x <- list(
    q1 = list(
      "Missing question name",
      options = c("A", "B"),
      answer = 2,
      tips = "wrong name"
    ),
    q2 = list(
      question = "Q2?",
      options = c("C", "D"),
      c(1, 3)  # unnamed answer
    )
  )
  err <- tryCatch(checkMultiQuestions(x), error = function(e) conditionMessage(e))
  # Both q1 and q2 should be mentioned
  expect_match(err, "q1")
  expect_match(err, "q2")
})

# --- Partially named lists ---

test_that("checkMultiQuestions auto-names partially unnamed elements", {
  x <- list(
    myQ = list(question = "Q1?", options = c("A", "B"), answer = 1),
    list(question = "Q2?", options = c("C", "D"), answer = 2)
  )
  result <- checkMultiQuestions(x)
  expect_equal(names(result), c("myQ", "q2"))
})

# --- Questions with tips ---

test_that("checkMultiQuestions passes with tip in some questions", {
  x <- list(
    q1 = list(question = "Q1?", options = c("A", "B"), answer = 1,
              tip = "Hint for Q1"),
    q2 = list(question = "Q2?", options = c("C", "D"), answer = 2)
  )
  expect_invisible(checkMultiQuestions(x))
})

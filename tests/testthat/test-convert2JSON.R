test_that("convert2JSON returns valid JSON string for single-choice", {
  x <- list(
    q1 = list("What is 2+2?", c("3", "4", "5"), 2)
  )
  result <- convert2JSON(x, choice = "single")
  expect_type(result, "character")
  expect_length(result, 1)
  # Should be parseable as JSON
  parsed <- jsonlite::fromJSON(result, simplifyVector = FALSE)
  expect_length(parsed, 1)
  expect_equal(parsed[[1]]$question, "What is 2+2?")
  expect_equal(parsed[[1]]$answer, "4")
})

test_that("convert2JSON returns array answer for multiple-choice", {
  x <- list(
    q1 = list("Which are even?", c("1", "2", "3", "4"), c(2, 4))
  )
  result <- convert2JSON(x, choice = "multiple")
  parsed <- jsonlite::fromJSON(result, simplifyVector = FALSE)
  expect_type(parsed[[1]]$answer, "list")
  expect_equal(unlist(parsed[[1]]$answer), c("2", "4"))
})

test_that("convert2JSON handles multiple questions", {
  x <- list(
    q1 = list("Q1?", c("A", "B"), 1),
    q2 = list("Q2?", c("C", "D", "E"), 3)
  )
  result <- convert2JSON(x)
  parsed <- jsonlite::fromJSON(result, simplifyVector = FALSE)
  expect_length(parsed, 2)
  expect_equal(parsed[[1]]$id, 1)
  expect_equal(parsed[[2]]$id, 2)
  expect_equal(parsed[[1]]$answer, "A")
  expect_equal(parsed[[2]]$answer, "E")
})

test_that("convert2JSON removes newlines from question and options", {
  x <- list(
    q1 = list("What\nis this?", c("Option\nA", "Option B"), 1)
  )
  result <- convert2JSON(x)
  expect_false(grepl("\n", result))
})

test_that("convert2JSON errors when answer index exceeds options", {
  x <- list(
    q1 = list("Q?", c("A", "B"), 5)
  )
  expect_error(convert2JSON(x), "exceeds")
})

test_that("convert2JSON errors when fewer than 2 options", {
  x <- list(
    q1 = list("Q?", c("Only one"), 1)
  )
  expect_error(convert2JSON(x), "at least 2")
})

test_that("convert2JSON sets score to 0 and status to empty", {
  x <- list(
    q1 = list("Q?", c("A", "B"), 1)
  )
  result <- convert2JSON(x)
  parsed <- jsonlite::fromJSON(result, simplifyVector = FALSE)
  expect_equal(parsed[[1]]$score, 0)
  expect_equal(parsed[[1]]$status, "")
})

test_that("convert2JSON handles special characters in questions and options", {
  x <- list(
    q1 = list(
      'What is the "best" answer?',
      c("It's A", 'Option "B"', "C \\ D"),
      1
    )
  )
  result <- convert2JSON(x)
  # Should produce valid JSON despite quotes and backslashes
  parsed <- jsonlite::fromJSON(result, simplifyVector = FALSE)
  expect_equal(parsed[[1]]$question, 'What is the "best" answer?')
  expect_equal(parsed[[1]]$answer, "It's A")
})

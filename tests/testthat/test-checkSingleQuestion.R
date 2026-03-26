# --- Valid inputs ---

test_that("checkSingleQuestion passes for valid SC question", {
  q <- list(question = "What is 2+2?", options = c("3", "4", "5"), answer = 2)
  expect_invisible(checkSingleQuestion(q))
})

test_that("checkSingleQuestion passes for valid MC question", {
  q <- list(
    question = "Which are prime?",
    options = c("2", "4", "7", "9"),
    answer = c(1, 3)
  )
  expect_invisible(checkSingleQuestion(q))
})

test_that("checkSingleQuestion passes with optional tip", {
  q <- list(
    question = "Capital of France?",
    options = c("Berlin", "Paris"),
    answer = 2,
    tip = "Think about the Eiffel Tower."
  )
  expect_invisible(checkSingleQuestion(q))
})

# --- Missing fields ---

test_that("checkSingleQuestion errors on missing 'question' field", {
  q <- list(options = c("A", "B"), answer = 1)
  expect_error(checkSingleQuestion(q), "Missing.*question")
})

test_that("checkSingleQuestion errors on missing 'options' field", {
  q <- list(question = "Q?", answer = 1)
  expect_error(checkSingleQuestion(q), "Missing.*options")
})

test_that("checkSingleQuestion errors on missing 'answer' field", {
  q <- list(question = "Q?", options = c("A", "B"))
  expect_error(checkSingleQuestion(q), "Missing.*answer")
})

test_that("checkSingleQuestion errors on multiple missing fields", {
  q <- list(options = c("A", "B"))
  expect_error(checkSingleQuestion(q), "Missing.*question.*answer|Missing.*answer.*question")
})

test_that("checkSingleQuestion errors on unnamed list (positional elements)", {
  q <- list("What is 2+2?", c("3", "4", "5"), 2)
  expect_error(checkSingleQuestion(q), "Missing|named")
})

test_that("checkSingleQuestion errors on partially named list", {
  q <- list(
    "What is 2+2?",
    options = c("3", "4", "5"),
    answer = 2
  )
  expect_error(checkSingleQuestion(q), "Missing.*question")
})

# --- Wrong types ---

test_that("checkSingleQuestion errors when x is not a list", {
  expect_error(checkSingleQuestion("not a list"), "named list")
})

test_that("checkSingleQuestion errors when question is empty", {
  q <- list(question = "  ", options = c("A", "B"), answer = 1)
  expect_error(checkSingleQuestion(q), "non-empty")
})

test_that("checkSingleQuestion errors when options has only 1 element", {
  q <- list(question = "Q?", options = "A", answer = 1)
  expect_error(checkSingleQuestion(q), "at least 2")
})

test_that("checkSingleQuestion errors when answer is character", {
  q <- list(question = "Q?", options = c("A", "B"), answer = "A")
  expect_error(checkSingleQuestion(q), "numeric")
})

test_that("checkSingleQuestion errors when answer contains NA", {
  q <- list(question = "Q?", options = c("A", "B"), answer = NA_real_)
  expect_error(checkSingleQuestion(q), "without NAs")
})

# --- Answer index issues ---

test_that("checkSingleQuestion errors when answer index is out of range (too high)", {
  q <- list(question = "Q?", options = c("A", "B"), answer = 3)
  expect_error(checkSingleQuestion(q), "out of range")
})

test_that("checkSingleQuestion errors when answer index is 0", {
  q <- list(question = "Q?", options = c("A", "B"), answer = 0)
  expect_error(checkSingleQuestion(q), "out of range")
})

test_that("checkSingleQuestion errors when answer has duplicates", {
  q <- list(question = "Q?", options = c("A", "B", "C"), answer = c(1, 1))
  expect_error(checkSingleQuestion(q), "duplicate")
})

# --- MC warnings ---

test_that("checkSingleQuestion warns when all options are correct", {
  q <- list(question = "Q?", options = c("A", "B"), answer = c(1, 2))
  expect_warning(checkSingleQuestion(q), "All options are marked correct")
})

# --- Unknown elements ---

test_that("checkSingleQuestion errors on unknown elements", {
  q <- list(question = "Q?", options = c("A", "B"), answer = 1, tips = "hint")
  expect_error(checkSingleQuestion(q), "Unknown.*tips")
})

# --- Tip validation ---

test_that("checkSingleQuestion errors when tip is not a single string", {
  q <- list(question = "Q?", options = c("A", "B"), answer = 1, tip = c("a", "b"))
  expect_error(checkSingleQuestion(q), "single character string")
})

test_that("checkSingleQuestion errors when tip is numeric", {
  q <- list(question = "Q?", options = c("A", "B"), answer = 1, tip = 42)
  expect_error(checkSingleQuestion(q), "single character string")
})

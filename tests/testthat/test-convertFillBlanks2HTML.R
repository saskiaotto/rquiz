test_that("convertFillBlanks2HTML returns list with cloze, answers, options", {
  x <- list(cloze = "R is a $$!programming!$$ language.")
  result <- convertFillBlanks2HTML(x, blanksWidth = NULL, blanksAlign = "center")
  expect_type(result, "list")
  expect_true(all(c("cloze", "answers", "options") %in% names(result)))
})

test_that("convertFillBlanks2HTML extracts correct answers", {
  x <- list(cloze = "A $$!cat!$$ sat on a $$!mat!$$.")
  result <- convertFillBlanks2HTML(x, blanksWidth = NULL, blanksAlign = "center")
  expect_equal(result$answers, c("cat", "mat"))
})

test_that("convertFillBlanks2HTML creates input fields in cloze HTML", {
  x <- list(cloze = "A $$!cat!$$ sat on a $$!mat!$$.")
  result <- convertFillBlanks2HTML(x, blanksWidth = NULL, blanksAlign = "center")
  # Should contain 2 input elements
  n_inputs <- length(gregexpr("fbq-target", result$cloze)[[1]])
  expect_equal(n_inputs, 2)
  # Should contain data-accept attributes
  expect_true(grepl("data-accept='1'", result$cloze, fixed = TRUE))
  expect_true(grepl("data-accept='2'", result$cloze, fixed = TRUE))
})

test_that("convertFillBlanks2HTML includes addOptions in options HTML", {
  x <- list(
    cloze = "R is a $$!programming!$$ language.",
    addOptions = c("cooking", "dancing")
  )
  result <- convertFillBlanks2HTML(x, blanksWidth = NULL, blanksAlign = "center")
  # All 3 options (1 correct + 2 additional) should appear
  expect_true(grepl("programming", result$options))
  expect_true(grepl("cooking", result$options))
  expect_true(grepl("dancing", result$options))
})

test_that("convertFillBlanks2HTML applies blanksAlign style", {
  x <- list(cloze = "A $$!test!$$ here.")
  result <- convertFillBlanks2HTML(x, blanksWidth = NULL, blanksAlign = "left")
  expect_true(grepl("text-align:left", result$cloze))
})

test_that("convertFillBlanks2HTML applies blanksWidth as min-width", {
  x <- list(cloze = "A $$!test!$$ here.")
  result <- convertFillBlanks2HTML(x, blanksWidth = "200px", blanksAlign = "center")
  expect_true(grepl("min-width:200px", result$cloze))
})

test_that("convertFillBlanks2HTML handles auto blanksWidth", {
  x <- list(cloze = "A $$!test!$$ here.")
  result <- convertFillBlanks2HTML(x, blanksWidth = "auto", blanksAlign = "center")
  # auto should NOT set a min-width style
  expect_false(grepl("min-width", result$cloze))
})

test_that("convertFillBlanks2HTML removes newlines from cloze text", {
  x <- list(cloze = "A $$!test!$$\n here.")
  result <- convertFillBlanks2HTML(x, blanksWidth = NULL, blanksAlign = "center")
  expect_false(grepl("\n", result$cloze))
})

test_that("convertFillBlanks2HTML generates fbq-option spans", {
  x <- list(cloze = "A $$!cat!$$ and a $$!dog!$$.")
  result <- convertFillBlanks2HTML(x, blanksWidth = NULL, blanksAlign = "center")
  expect_true(grepl("fbq-option", result$options))
  # Should contain both options
  expect_true(grepl("cat", result$options))
  expect_true(grepl("dog", result$options))
})

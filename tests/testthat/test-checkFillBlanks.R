# --- Valid inputs ---

test_that("checkFillBlanks passes for valid cloze with addOptions", {
  x <- list(
    cloze = "R is a $$!programming!$$ language for $$!statistical computing!$$.",
    addOptions = c("natural", "colloquial")
  )
  expect_invisible(checkFillBlanks(x))
})

test_that("checkFillBlanks passes for minimal cloze (without addOptions)", {
  x <- list(cloze = "The capital of France is $$!Paris!$$.")
  expect_invisible(checkFillBlanks(x))
})

test_that("checkFillBlanks passes when element order is reversed", {
  x <- list(
    addOptions = c("natural", "colloquial"),
    cloze = "R is a $$!programming!$$ language."
  )
  expect_invisible(checkFillBlanks(x))
})

# --- Missing cloze ---

test_that("checkFillBlanks errors when cloze is missing (unnamed list)", {
  x <- list("R is a $$!programming!$$ language.")
  expect_error(checkFillBlanks(x), "cloze")
})

test_that("checkFillBlanks errors when cloze is misspelled", {
  x <- list(clozed = "R is a $$!programming!$$ language.")
  expect_error(checkFillBlanks(x), "Unknown.*clozed")
})

# --- Unknown elements ---

test_that("checkFillBlanks errors on unnamed elements", {
  x <- list(
    cloze = "R is a $$!programming!$$ language.",
    c("natural", "colloquial")
  )
  expect_error(checkFillBlanks(x), "named")
})

test_that("checkFillBlanks errors on wrong element name", {
  x <- list(
    cloze = "R is a $$!programming!$$ language.",
    options = c("natural", "colloquial")  # should be addOptions
  )
  expect_error(checkFillBlanks(x), "Unknown.*options")
})

# --- Empty/invalid cloze ---

test_that("checkFillBlanks errors on empty cloze (whitespace only)", {
  x <- list(cloze = "  ")
  expect_error(checkFillBlanks(x), "non-empty")
})

test_that("checkFillBlanks errors on non-character cloze", {
  x <- list(cloze = 42)
  expect_error(checkFillBlanks(x), "non-empty character")
})

# --- Missing markers ---

test_that("checkFillBlanks errors when no $$!...!$$ markers are present", {
  x <- list(cloze = "R is a programming language.")
  expect_error(checkFillBlanks(x), "marker|\\$\\$!")
})

# --- addOptions validation ---

test_that("checkFillBlanks errors when addOptions is not character", {
  x <- list(
    cloze = "R is a $$!programming!$$ language.",
    addOptions = c(1, 2, 3)
  )
  expect_error(checkFillBlanks(x), "character")
})

# --- Non-list input ---

test_that("checkFillBlanks errors when x is not a list", {
  expect_error(checkFillBlanks("not a list"), "named list")
})

# Valid test inputs
valid_x <- list(
  cloze = "R is a $$!programming!$$ language.",
  addOptions = c("cooking", "dancing")
)

valid_simple <- list(
  cloze = "A $$!cat!$$ sat on a $$!mat!$$."
)

# --- Widget creation ---

test_that("fillBlanks returns an htmlwidget object", {
  w <- fillBlanks(x = valid_x)
  expect_s3_class(w, "htmlwidget")
  expect_s3_class(w, "fillBlanks")
})

test_that("fillBlanks works with simple cloze (no addOptions)", {
  w <- fillBlanks(x = valid_simple)
  expect_s3_class(w, "fillBlanks")
})

# --- Parameter validation errors ---

test_that("fillBlanks errors when x is not a list", {
  expect_error(fillBlanks(x = "not a list"), "must be a named list")
})

test_that("fillBlanks errors when x has unknown elements", {
  bad <- list(cloze = "$$!a!$$", addOptions = "b", extra = "c")
  expect_error(fillBlanks(x = bad), "Unknown element")
})

test_that("fillBlanks errors when list has wrong names", {
  bad <- list(text = "$$!a!$$", opts = "b")
  expect_error(fillBlanks(x = bad), "Unknown element")
})

test_that("fillBlanks errors when list is missing 'cloze'", {
  bad <- list(text = "$$!a!$$")
  expect_error(fillBlanks(x = bad), "Unknown element|must contain.*cloze")
})

test_that("fillBlanks errors when no cloze markers present", {
  bad <- list(cloze = "No markers here")
  expect_error(fillBlanks(x = bad), "blank marker")
})

test_that("fillBlanks errors when unnamed list (no 'cloze' name)", {
  bad <- list("R is a $$!programming!$$ language.")
  expect_error(fillBlanks(x = bad), "must contain.*cloze")
})

test_that("fillBlanks errors when cloze element has typo in name", {
  bad <- list(clozed = "R is a $$!programming!$$ language.")
  expect_error(fillBlanks(x = bad), "Unknown element")
})

test_that("fillBlanks errors when addOptions is unnamed", {
  bad <- list(cloze = "R is a $$!programming!$$ language.",
              c("natural", "colloquial"))
  expect_error(fillBlanks(x = bad), "must be named|Unknown")
})

test_that("fillBlanks errors when cloze is empty/whitespace", {
  bad <- list(cloze = "  ")
  expect_error(fillBlanks(x = bad), "non-empty")
})

test_that("fillBlanks errors on unbalanced markers", {
  bad <- list(cloze = "R is a $$!programming language.")
  expect_error(fillBlanks(x = bad), "blank marker")
})

test_that("fillBlanks accepts reversed element order", {
  txt <- list(
    addOptions = c("natural"),
    cloze = "R is a $$!programming!$$ language."
  )
  w <- fillBlanks(x = txt)
  expect_s3_class(w, "htmlwidget")
})

test_that("fillBlanks error messages reference help pages", {
  expect_error(fillBlanks(x = "bad"), "checkFillBlanks|fillBlanks")
  expect_error(fillBlanks(x = list(wrong = "a")), "checkFillBlanks|fillBlanks")
})

# --- Description and language ---

test_that("fillBlanks sets English description by default", {
  w <- fillBlanks(x = valid_x)
  expect_equal(w$x$descript, "Fill in the blanks.")
})

test_that("fillBlanks sets German description when language='de'", {
  w <- fillBlanks(x = valid_x, language = "de")
  expect_equal(w$x$descript, "F\u00fclle die L\u00fccken.")
})

test_that("fillBlanks sets French description when language='fr'", {
  w <- fillBlanks(x = valid_x, language = "fr")
  expect_equal(w$x$descript, "Remplissez les blancs.")
})

test_that("fillBlanks allows custom description", {
  w <- fillBlanks(x = valid_x, description = "Custom text")
  expect_equal(w$x$descript, "Custom text")
})

test_that("fillBlanks passes empty description as string", {
  w <- fillBlanks(x = valid_x, description = "")
  expect_equal(w$x$descript, "")
})

# --- Language translations ---

test_that("fillBlanks passes English button texts by default", {
  w <- fillBlanks(x = valid_x)
  expect_equal(w$x$txtSubmitBtn, "Submit")
  expect_equal(w$x$txtTipBtnShow, "Show tips")
  expect_equal(w$x$txtSolutionBtnShow, "Show solution")
})

test_that("fillBlanks passes German button texts", {
  w <- fillBlanks(x = valid_x, language = "de")
  expect_equal(w$x$txtSubmitBtn, "Absenden")
  expect_equal(w$x$txtTipBtnShow, "Tipps anzeigen")
  expect_equal(w$x$txtSolutionBtnShow, "L\u00f6sung anzeigen")
})

test_that("fillBlanks passes Spanish button texts", {
  w <- fillBlanks(x = valid_x, language = "es")
  expect_equal(w$x$txtSubmitBtn, "Enviar")
  expect_equal(w$x$txtSolutionBtnShow, "Mostrar soluci\u00f3n")
})

# --- Other defaults ---

test_that("fillBlanks title defaults to NULL (passed as 'NULL' string)", {
  w <- fillBlanks(x = valid_x)
  expect_equal(w$x$title, "NULL")
})

test_that("fillBlanks passes custom title", {
  w <- fillBlanks(x = valid_x, title = "My Quiz")
  expect_equal(w$x$title, "My Quiz")
})

test_that("fillBlanks scroll defaults to FALSE", {
  w <- fillBlanks(x = valid_x)
  expect_equal(w$x$scroll, "false")
})

test_that("fillBlanks passes color parameters correctly", {
  w <- fillBlanks(x = valid_x, titleCol = "#FF0000", titleBg = "#00FF00")
  expect_equal(w$x$titleCol, "#FF0000")
  expect_equal(w$x$titleBg, "#00FF00")
})

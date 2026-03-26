# --- rquizTheme creation ---

test_that("rquizTheme returns an rquizTheme object", {
  th <- rquizTheme(fontSize = 20)
  expect_s3_class(th, "rquizTheme")
  expect_equal(th$fontSize, 20)
})

test_that("rquizTheme only includes non-NULL values", {
  th <- rquizTheme(titleCol = "red")
  expect_equal(length(th), 1)
  expect_equal(th$titleCol, "red")
})

test_that("rquizTheme accepts all parameter types", {
  th <- rquizTheme(
    fontSize = 20, fontFamily = "Georgia",
    titleCol = "#FFF", titleBg = "#000",
    optionLabelBg = "#333",
    navButtonBg = "#444",
    descriptFontSize = 14
  )
  expect_equal(th$fontSize, 20)
  expect_equal(th$optionLabelBg, "#333")
  expect_equal(th$navButtonBg, "#444")
  expect_equal(th$descriptFontSize, 14)
})

# --- Theme application to singleQuestion ---

test_that("singleQuestion applies theme values", {
  th <- rquizTheme(fontSize = 24, titleCol = "#FF0000")
  q <- list(question = "Q?", options = c("A", "B"), answer = 1)
  w <- singleQuestion(x = q, theme = th)
  expect_equal(w$x$fontSize, 24)
  expect_equal(w$x$titleCol, "#FF0000")
})

test_that("singleQuestion explicit args override theme", {
  th <- rquizTheme(fontSize = 24, titleCol = "#FF0000")
  q <- list(question = "Q?", options = c("A", "B"), answer = 1)
  w <- singleQuestion(x = q, theme = th, titleCol = "#00FF00")
  expect_equal(w$x$titleCol, "#00FF00")  # explicit wins
  expect_equal(w$x$fontSize, 24)  # from theme
})

test_that("singleQuestion applies navButtonBg from theme", {
  th <- rquizTheme(navButtonBg = "#444")
  q <- list(question = "Q?", options = c("A", "B"), answer = 1)
  w <- singleQuestion(x = q, theme = th)
  expect_equal(w$x$navBtnBg, "#444")
})

# --- Theme application to multiQuestions ---

test_that("multiQuestions applies theme values", {
  th <- rquizTheme(fontSize = 24, navButtonBg = "#3498DB")
  q <- list(q1 = list(question = "Q?", options = c("A", "B"), answer = 1))
  w <- multiQuestions(x = q, theme = th)
  expect_equal(w$x$fontSize, 24)
  expect_equal(w$x$navBtnBg, "#3498DB")
})

test_that("multiQuestions explicit args override theme", {
  th <- rquizTheme(fontSize = 24, navButtonBg = "#3498DB")
  q <- list(q1 = list(question = "Q?", options = c("A", "B"), answer = 1))
  w <- multiQuestions(x = q, theme = th, navButtonBg = "#FF0000")
  expect_equal(w$x$navBtnBg, "#FF0000")  # explicit wins
})

# --- Theme application to fillBlanks ---

test_that("fillBlanks applies theme values", {
  th <- rquizTheme(fontSize = 24, titleCol = "#FF0000")
  txt <- list(cloze = "R is $$!great!$$.")
  w <- fillBlanks(x = txt, theme = th)
  expect_equal(w$x$fontSize, 24)
  expect_equal(w$x$titleCol, "#FF0000")
})

test_that("fillBlanks explicit args override theme", {
  th <- rquizTheme(fontSize = 24)
  txt <- list(cloze = "R is $$!great!$$.")
  w <- fillBlanks(x = txt, theme = th, fontSize = 12)
  expect_equal(w$x$fontSize, 12)  # explicit wins
})

# --- Error handling ---

test_that("quiz functions error on invalid theme", {
  q <- list(question = "Q?", options = c("A", "B"), answer = 1)
  expect_error(
    singleQuestion(x = q, theme = list(fontSize = 20)),
    "rquizTheme"
  )
})

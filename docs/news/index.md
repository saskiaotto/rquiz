# Changelog

## rquiz 1.0.0

Complete overhaul of the package, including new features, accessibility
improvements, unified design, and CRAN-ready packaging. Migrated from
GitLab (private) to GitHub (public) and submitted to CRAN.

### Breaking changes

- Renamed `fillGaps()` to
  [`fillBlanks()`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
  for consistency with the “fill-in-the-blank” terminology used
  throughout the documentation.

- Shiny render functions renamed to follow camelCase convention:
  `rendersingleQuestion` -\> `renderSingleQuestion`,
  `rendermultiQuestions` -\> `renderMultiQuestions`, `renderFillGaps`
  -\> `renderFillBlanks`.

- Parameter naming unified across all quiz functions: all color
  parameters now use the short form (`Col`/`Bg`), e.g. `titleCol`,
  `titleBg`, `questionCol`, `questionBg`, `mainCol`, `mainBg`,
  `optionBg`.

- Renamed `submitButtonCol`/`submitButtonBg` to
  `navButtonCol`/`navButtonBg` in
  [`singleQuestion()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md)
  and
  [`fillBlanks()`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
  for consistency with
  [`multiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md).

- Removed `answersCol`, `answersBg`, and `hoverBg` parameters from
  [`multiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md).
  Use `mainCol` and `optionBg` instead. Hover color is now auto-derived
  (30% darker).

- [`convert2JSON()`](https://saskiaotto.github.io/rquiz/reference/convert2JSON.md)
  is no longer exported (internal function only).

- Default for `scroll` changed to `FALSE` in all quiz functions. Set
  `scroll = TRUE` explicitly for HTML slide presentations.

- Default for `showSolutionButton` changed to `TRUE` in all quiz
  functions.

### New features

- Added multiple-choice support to
  [`singleQuestion()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md)
  and
  [`multiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md).
  The mode is auto-detected from the answer vector.

- [`singleQuestion()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md)
  in multiple-choice mode shows Submit, Show tips, and Show solution
  buttons with customizable colors.

- Added `shuffle` parameter to
  [`singleQuestion()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md)
  (shuffles answer options) and
  [`multiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md)
  (shuffles question order, including on “Try again”).

- Added `language` parameter to all quiz functions. Built-in support for
  English (`"en"`), German (`"de"`), French (`"fr"`), and Spanish
  (`"es"`). Translations stored in `inst/translations.json`.

- Added
  [`rquizTheme()`](https://saskiaotto.github.io/rquiz/reference/rquizTheme.md)
  for creating reusable themes that can be applied to any quiz function
  via the `theme` parameter. Explicit arguments always override theme
  values.

- Added input validation functions:
  [`checkSingleQuestion()`](https://saskiaotto.github.io/rquiz/reference/checkSingleQuestion.md),
  [`checkMultiQuestions()`](https://saskiaotto.github.io/rquiz/reference/checkMultiQuestions.md),
  and
  [`checkFillBlanks()`](https://saskiaotto.github.io/rquiz/reference/checkFillBlanks.md).
  These are called internally but also exported for manual use.

- Added `titleAlign` parameter to all quiz functions.

- Added `mainCol`/`mainBg` parameters to
  [`singleQuestion()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md)
  and
  [`fillBlanks()`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
  (already existed in
  [`multiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md)).

- Added `optionBg` parameter to
  [`singleQuestion()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md)
  for styling answer option rows (already existed in
  [`multiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md)
  as `answersBg`).

- Added `questionCol` parameter to
  [`multiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md)
  for independent question text color. Also added
  `questionCol`/`questionBg` to
  [`fillBlanks()`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
  for the description container.

- Added `questionFontSize` parameter to
  [`singleQuestion()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md).

- Added `blanksWidth = "auto"` mode to
  [`fillBlanks()`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
  that automatically sizes input fields based on the longest correct
  answer (minimum 50px).

- Added `description` parameter to
  [`fillBlanks()`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
  with automatic default text based on language setting.

- [`fillBlanks()`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
  description container now provides visual feedback (green/red) after
  submission.

- [`multiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md)
  now remembers selected answers when navigating back to previous
  questions.

- Added tip button support to
  [`multiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md)
  (per-question tips, with auto-generated tip for MC questions showing
  number of correct answers).

- Added tip and solution button support to
  [`singleQuestion()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md)
  in single-choice mode.

### Accessibility

- Added ARIA attributes: `role`, `tabindex`, `aria-label`,
  `aria-checked` on interactive elements; `aria-expanded` and
  `aria-controls` on toggle buttons (Tip/Solution).

- Added keyboard navigation: Tab through options and buttons,
  Enter/Space to select options, focus management on page transitions.

- Added CSS `:focus` outlines for keyboard users (hidden for mouse
  clicks via `:focus-visible`).

- Click event propagation stopped inside quiz widgets to prevent
  conflicts with slide frameworks (e.g. slidy).

### Improvements

- Removed jQuery dependency: all JavaScript code now uses Vanilla JS.
  This eliminates the bundled jQuery 3.5.1, jQuery UI, and jQuery UI
  Touch Punch libraries, reducing the package size.

- Replaced fragile [`paste0()`](https://rdrr.io/r/base/paste.html)-based
  JSON generation in
  [`convert2JSON()`](https://saskiaotto.github.io/rquiz/reference/convert2JSON.md)
  with
  [`jsonlite::toJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html).
  Special characters in questions (quotes, backslashes) are now
  correctly escaped.

- Unified HTML structure across all three quiz types: consistent class
  naming (title, question, main, options, buttons), consistent padding,
  font sizes, and container hierarchy.

- Unified design defaults across all three quiz types (consistent
  colors, button styles, border-radius, responsive layout).

- Fixed widget scoping: all DOM queries are now scoped to the widget
  container, preventing conflicts when multiple quiz widgets appear on
  the same page.

- Fixed unscoped CSS selectors that could affect elements outside the
  quiz (e.g. in ioslides presentations).

- Responsive button layout: buttons wrap to next line on narrow screens.

- Added pkgdown website with vignette, interactive gallery, and demo
  files for Quarto, Slidy, and RevealJS.

- Changed license from CC BY 4.0 to MIT for CRAN compatibility.

- Migrated repository from GitLab to GitHub
  (<https://github.com/saskiaotto/rquiz>).

## rquiz 0.3.0

- Removed `dragAndDrop()` due to persistent touch/interaction issues on
  tablets and in slide presentations.
- Added `fillGaps()` as a replacement: a fill-in-the-blank cloze quiz
  where users type answers into input fields instead of dragging items.

## rquiz 0.2.0

- Added `dragAndDrop()`: a cloze drag-and-drop quiz where users drag
  answer options to blank fields in the text.

## rquiz 0.1.0

- Initial release of the package with two quiz types:
  - [`singleQuestion()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md):
    Single-choice quiz with immediate feedback.
  - [`multiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md):
    Multi-page quiz with timer and results page.
- Built with a mix of vanilla JavaScript and jQuery/jQuery UI.
- Used in Data Science lectures at Universitat Hamburg since 2020.

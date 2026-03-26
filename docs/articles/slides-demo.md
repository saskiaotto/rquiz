# Demo Files for Documents and Presentations

## Overview

**rquiz** widgets work in HTML documents and slide presentations,
including [Quarto](https://quarto.org/) HTML documents,
[revealJS](https://quarto.org/docs/presentations/revealjs/)
presentations, and
[slidy](https://bookdown.org/yihui/rmarkdown/slidy-presentation.html)
presentations. The package includes three ready-to-use demo files that
showcase all quiz types with different themes:

| Demo | Format | Topic | Theme |
|----|----|----|----|
| [Quarto HTML Document](https://saskiaotto.github.io/rquiz/quarto-html-demo.md) | Quarto `.qmd` | Data Science in R | Light (Quarto-style) |
| [Slidy Presentation](https://saskiaotto.github.io/rquiz/slidy-demo.md) | R Markdown `.Rmd` | Marine Biology | Dark (Ocean) |
| [RevealJS Presentation](https://saskiaotto.github.io/rquiz/revealjs-demo.md) | Quarto `.qmd` | Zheng Yi Sao | Dark (Gold/Pink) |

Each demo contains all three quiz types —
[`singleQuestion()`](https://saskiaotto.github.io/rquiz/reference/singleQuestion.md),
[`multiQuestions()`](https://saskiaotto.github.io/rquiz/reference/multiQuestions.md),
and
[`fillBlanks()`](https://saskiaotto.github.io/rquiz/reference/fillBlanks.md)
— shown first with default settings and then with a custom theme applied
via
[`rquizTheme()`](https://saskiaotto.github.io/rquiz/reference/rquizTheme.md).
The demos also illustrate how to modify a theme for specific quiz types.

## Using the Demo Files as Templates

The demo files are included in the package. Copy them to your working
directory and adapt them to your needs:

### Quarto HTML Document (Data Science in R)

``` r

demo_file <- system.file("examples", "quarto-html-demo.qmd", package = "rquiz")
file.copy(demo_file, "quarto-html-demo.qmd")

# Render with Quarto (requires Quarto to be installed)
quarto::quarto_render("quarto-html-demo.qmd")
```

### Slidy Presentation (Marine Biology)

``` r

demo_file <- system.file("examples", "slidy-demo.Rmd", package = "rquiz")
file.copy(demo_file, "slidy-demo.Rmd")

# Render (uses rmarkdown, no extra packages needed)
rmarkdown::render("slidy-demo.Rmd")
```

### RevealJS Presentation (Zheng Yi Sao)

``` r

demo_file <- system.file("examples", "revealjs-demo.qmd", package = "rquiz")
file.copy(demo_file, "revealjs-demo.qmd")

# Render with Quarto (requires Quarto to be installed)
quarto::quarto_render("revealjs-demo.qmd")
```

## Key Settings for Presentations

How the quiz fits into a slide depends on the presentation framework:

- **Slidy**: Slides automatically expand to fit the quiz content, so
  `scroll = TRUE` is usually **not** needed.
- **RevealJS (Quarto)**: Slides have a fixed size. You can either add
  `{.scrollable}` to individual slides, enable scrolling globally in the
  YAML header, or set `scroll = TRUE` with a fixed `height` inside the
  quiz function.
- **Other frameworks**: If the quiz overflows beyond the visible slide
  area, set `scroll = TRUE` and adjust `height` to fit your slide
  layout.

``` r

# Example: fixed height with scrollbar
singleQuestion(
  x = list(
    question = "Which ocean is the largest?",
    options = c("Atlantic", "Indian", "Pacific", "Arctic"),
    answer = 3
  ),
  scroll = TRUE,
  height = "400px"
)
```

## Tips

- **Height**: Start with `"400px"` and adjust. Slides with a title need
  less height than full-page slides.
- **Tip/Solution buttons**: The extra content appears inside the
  scrollable area — no need to worry about overflow.
- **One quiz per slide**: For the best experience, place one quiz per
  slide.
- **Keyboard navigation**: When a quiz element is focused (via Tab),
  keyboard events stay within the quiz. Click outside the quiz or press
  Escape to return to slide navigation.
- **Slidy mouse clicks**: Slidy intercepts mouse clicks for slide
  navigation. rquiz handles this automatically by stopping click
  propagation inside the quiz area.
- **Text formatting**: To style text within questions (e.g. species
  names in italics or function names as code), use HTML tags such as
  `<em>`, `<strong>`, `<code>`, or `<span>` with inline CSS directly in
  the question or answer option strings. See the [Creating
  Quizzes](https://saskiaotto.github.io/rquiz/articles/creating-quizzes.md)
  vignette for details.

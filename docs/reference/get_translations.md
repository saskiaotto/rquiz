# Get translations for a given language

Reads the central translations JSON file and returns the translations
for the specified language. Falls back to English if the language is not
found.

## Usage

``` r
get_translations(language = "en")
```

## Arguments

- language:

  character; a language code (e.g. `"en"`, `"de"`, `"fr"`, `"es"`).

## Value

A named list of translated strings.

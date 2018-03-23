
<!-- README.md is generated from README.Rmd. Please edit that file -->

# redcapdd

[![Travis-CI Build
Status](https://travis-ci.org/Sage-Bionetworks/redcapdd.svg?branch=master)](https://travis-ci.org/Sage-Bionetworks/redcapdd)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

The goal of redcapdd is to generate properly formatted data dictionaries
for upload to REDCap.

## Installation

``` r
devtools::install_github("Sage-Bionetworks/redcapdd")
```

## Examples

You can create a new field with `create_fields()`. The result will have
all of the columns required in a REDCap data dictionary.

When called with no arguments, `create_fields()` provides a one-row data
frame containing all NAs.

``` r
library("redcapdd")
create_fields()
#> # A tibble: 1 x 18
#>   `Variable / Fie… `Form Name` `Section Header` `Field Type` `Field Label`
#> * <lgl>            <lgl>       <lgl>            <lgl>        <lgl>        
#> 1 NA               NA          NA               NA           NA           
#> # ... with 13 more variables: `Choices, Calculations, OR Slider
#> #   Labels` <lgl>, `Field Note` <lgl>, `Text Validation Type OR Show
#> #   Slider Number` <lgl>, `Text Validation Min` <lgl>, `Text Validation
#> #   Max` <lgl>, `Identifier?` <lgl>, `Branching Logic (Show field only
#> #   if...)` <lgl>, `Required Field?` <lgl>, `Custom Alignment` <lgl>,
#> #   `Question Number (surveys only)` <lgl>, `Matrix Group Name` <lgl>,
#> #   `Matrix Ranking?` <lgl>, `Field Annotation` <lgl>
```

You can provide as much information as you want to populate the field;
`create_fields()` will fill out the rest of the columns with NAs.

``` r
x <- list(
  `Variable / Field Name` = "patient_name",
  `Field Label` = "Patient name"
)

create_fields(x)
#> # A tibble: 1 x 18
#>   `Variable / Fie… `Form Name` `Section Header` `Field Type` `Field Label`
#>   <chr>            <lgl>       <lgl>            <lgl>        <chr>        
#> 1 patient_name     NA          NA               NA           Patient name 
#> # ... with 13 more variables: `Choices, Calculations, OR Slider
#> #   Labels` <lgl>, `Field Note` <lgl>, `Text Validation Type OR Show
#> #   Slider Number` <lgl>, `Text Validation Min` <lgl>, `Text Validation
#> #   Max` <lgl>, `Identifier?` <lgl>, `Branching Logic (Show field only
#> #   if...)` <lgl>, `Required Field?` <lgl>, `Custom Alignment` <lgl>,
#> #   `Question Number (surveys only)` <lgl>, `Matrix Group Name` <lgl>,
#> #   `Matrix Ranking?` <lgl>, `Field Annotation` <lgl>
```

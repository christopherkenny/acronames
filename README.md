
<!-- README.md is generated from README.Rmd. Please edit that file -->

# acronames

<!-- badges: start -->
<!-- badges: end -->

The goal of acronames is to …

## Installation

You can install the released version of `acronames` from
[GitHub](github.com) with:

``` r
devtools::install_packages_github("acronames")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(acronames)
acronames(required = 
           list('Harvard', 
                c('Automated', 'Algorithmic'), 
                'Redistricting', 
                c('Team', 'Project', 'Group')), 
         optional = list('Methodology')
         )
#> [1] "argh"  "harp"  "hart"  "rath"  "tahr"  "tharm"
```

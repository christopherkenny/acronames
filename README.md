
<!-- README.md is generated from README.Rmd. Please edit that file -->

# acroname

<!-- badges: start -->
<!-- badges: end -->

The goal of acroname is to …

## Installation

You can install the released version of `acroname` from
[GitHub](github.com) with:

``` r
devtools::install_.packages_github("acroname")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(acroname)
acroname(required = 
           list('Harvard', 
                c('Automated', 'Algorithmic'), 
                'Redistricting', 
                c('Team', 'Project', 'Group')), 
         optional = list('Methodology')
         )
#> [1] "argh"  "harp"  "hart"  "rath"  "tahr"  "tharm"
```

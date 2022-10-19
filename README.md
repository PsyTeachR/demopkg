
<!-- README.md is generated from README.Rmd. Please edit that file -->

# demopkg

<!-- badges: start -->
<!-- badges: end -->

The goal of demopkg is to practice making a package.

## Installation

You can install the development version of demopkg like so:

``` r
devtools::install_github("psyteachr/demopkg")
```

``` r
library(demopkg)
```

### Coding Club

This demo package can be used to allow people to catch up with the
[Coding Club](https://psyteachr.github.io/intro-r-pkgs/) sessions.

To clone this package project to your computer, download the zip file
using the green Code button above.

Alternatively, you can run the following code. Set `destdir` to the
directory where you want to save this project directory (defaults to
your current working directory).

``` r
# set fork = TRUE if you want to fork to your github 
usethis::create_from_github("psyteachr/demopkg", 
                            destdir = "./",
                            fork = FALSE)
```

The list below shows what is currently included in the package.

1.  [Setting
    up](https://psyteachr.github.io/intro-r-pkgs/01-setup.html): package
    structure, DESCRIPTION file, license, and README
2.  [Adding
    data](https://psyteachr.github.io/intro-r-pkgs/02-data.html):
    dataset `self_res_att` included
3.  [Custom
    functions](https://psyteachr.github.io/intro-r-pkgs/03-functions.html):
    added functions `round0()` and `apa_t_pair()`

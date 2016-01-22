[![Build Status](https://travis-ci.org/kos59125/DYM.svg?branch=master)](https://travis-ci.org/kos59125/DYM)

DYM
===

Adds 'Did you mean' feature in the R interactive.


Installation
------------

[DYM package is now on CRAN](http://cran.r-project.org/package=DYM)!
You can install the packege with the following command.

```r
install.packages("DYM")
```

Otherwise, you can get the latest version of the package from this repository:

```r
#install.packages("devtools")

devtools::install_github("kos59125/DYM")
```

Examples
--------

```r
> library(DYM)
Run options(error = DYM()) to enable 'Did you mean' feature
> options(error = DYM())
> t_test
Error: object 't_test' not found
Did you mean: 't.test'
> map
Error: object 'map' not found
Did you mean: ['mad', 'Map', 'max']
```

Hints
-----

If you have `~/.Rprofile` file to load on startup,
append the following line to enable the feature:

```r
options(error = DYM::DYM())
```

See `help(DYM)` for function parameters.

How does this work?
-------------------

[My blog post](http://blog.recyclebin.jp/archives/4439) explains how this package work (in Japanese/日本語).


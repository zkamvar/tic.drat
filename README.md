# tic.drat

[![Travis-CI Build Status](https://travis-ci.org/ropenscilabs/tic.drat.svg?branch=master)](https://travis-ci.org/ropenscilabs/tic.drat) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ropenscilabs/tic.drat?branch=master&svg=true)](https://ci.appveyor.com/project/ropenscilabs/tic.drat) [![Coverage Status](https://codecov.io/gh/ropenscilabs/tic.drat/branch/master/graph/badge.svg)](https://codecov.io/github/ropenscilabs/tic.drat?branch=master)

A minimal example for a [_drat_ repository](https://github.com/ropenscilabs/tic.drat.repo) created and uploaded by _tic_, hosting source and binary macOS packages.
_tic_ is an R package for CI-agnostic workflow definitions for various R projects. 
See its [documentation](https://ropenscilabs.github.io/tic/) for more information.

## Comparing to a conventional setup

Only a few files are added or changed to enable integration with _tic_:

- [`tic.R`](tic.R): This file describes the CI workflow.
- [`.travis.yml`](.travis.yml): This file translates between CI stages of Travis CI and _tic_ stages.
- [`appveyor.yml`](appveyor.yml): This file translates between CI stages of AppVeyor and _tic_ stages.
- [`.Rbuildignore`](.Rbuildignore): The files listed above are not part of a built R package and must be excluded.

## Set up an operational fork of this repository

If you want to experiment with _travis_ and _tic_ in this repo, you can fork it.

1. Use `usethis::create_from_github()` to automatically create a fork of this repo.
    If you use RStudio, a new RStudio project will open. 
    You may need to set up your SSH credentials first. See [this guide](http://happygitwithr.com/ssh-keys.html) if you're having problems. 
    (It's definitely worth getting this function running as it saves you so much time in the future!) 
    Alternatively, fork this repo on Github and then create a new R Project within RStudio (File -> New Project -> Version Control -> Github). 
1. Run `travis::use_tic()` to set up all requirements needed for the CI integration of your package.

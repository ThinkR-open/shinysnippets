# hide this file
usethis::use_build_ignore("dev_history.R")

# Create
colin::fill_desc("shinysnippets", "RStudio Snippets for Shiny devs", "A series of shiny related RStudio Snippets.", "shinysnippets")
colin::init_docs()
usethis::use_code_of_conduct()

usethis::use_build_ignore("readmefigs/")

# Tests
usethis::use_testthat()
usethis::use_test("snippet")

# Dev
attachment::att_amend_desc()

# pkgdown
file.copy("reference/figures/thinkr-hex-shinysnippets.png",
          "logo.png")
pkgdown::build_favicons(overwrite = TRUE)
file.remove("logo.png")
usethis::use_build_ignore("pkgdown")

usethis::use_git_ignore("docs")
usethis::use_build_ignore("reference")
usethis::use_git_ignore("man/figures/*")
# chameleon::build_pkgdown(
  # yml = system.file("pkgdown", "_pkgdown.yml", package = 'thinkridentity'))
pkgdown::build_site()

# CI
usethis::use_github_actions()
usethis::use_github_action(name = "check-standard")
usethis::use_github_actions_badge("R-CMD-check")
usethis::use_github_action(name = "pkgdown")

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("module snippet uses the modern moduleServer API (#14)", {
  path <- system.file("snippets.txt", package = "shinysnippets")
  if (!nzchar(path)) skip("shinysnippets package not installed")
  txt <- paste(readLines(path), collapse = "\n")

  expect_true(
    grepl("moduleServer", txt, fixed = TRUE),
    info = "module snippet should use moduleServer()"
  )
  expect_false(
    grepl("callModule", txt, fixed = TRUE),
    info = "module snippet should no longer use deprecated callModule()"
  )
})

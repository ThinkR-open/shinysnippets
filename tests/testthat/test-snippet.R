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
  expect_true(
    grepl("function(input, output, session)", txt, fixed = TRUE),
    info = "module snippet should keep the server function signature"
  )
  # The final tabstop ${0} must land in the server body so users can type
  # the module logic right after expanding the snippet.
  server_chunk <- regmatches(
    txt,
    regexpr(
      "function\\(input, output, session\\)\\{[\\s\\S]*?\\}",
      txt,
      perl = TRUE
    )
  )
  expect_true(
    length(server_chunk) == 1L && grepl("${0}", server_chunk, fixed = TRUE),
    info = "module snippet should expose ${0} inside the moduleServer body"
  )
})

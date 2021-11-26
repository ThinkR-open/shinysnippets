
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shinysnippets <img src="man/figures/thinkr-hex-shinysnippets.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![R build
status](https://github.com/ThinkR-open/shinysnippets/workflows/R-CMD-check/badge.svg)](https://github.com/ThinkR-open/shinysnippets/actions)
<!-- badges: end -->

The goal of shinysnippets is to save development time while taking
advantage of Rstudio snippets for Shiny applications.

## Installation of snippets

### Via the package

You can install the dev of {shinysnippets} from GitHub:

``` r
remotes::install_github("Thinkr-open/shinysnippets")
```

Then run:

``` r
shinysnippets::add_snippets()
```

You’ll be asked to validate the writing of the snippets in
`~/.R/snippets/r.snippets`.

Restart RStudio to make these snippets effective.

### Manually

Copy and paste these snippets to Tools \> Global Options \> Code \>
Editing \> Edit Snippets.

## Snippets list

### Modules

    snippet module
        mod_${1:name}_ui <- function(id) {
            ns <- NS(id)
            tagList(
                ${0}
            )
        }

        mod_${1:name}_server <- function(id) {
            moduleServer(id, function(input, output, session) {
            ns <- session\$ns
                
            })
        }
        
        # Copy in UI
        #mod_${1:name}_ui("${1:name}_ui")
        
        # Copy in server
        #mod_${1:name}_server("${1:name}_ui")

![](man/figures/module_snippet.gif)

### observeEvent

    snippet observe_event
        observeEvent( ${1:event} , {
        
        })

![](man/figures/observeEvent_snippet.gif)

### sidebar_page

    snippet sidebar_page
        library(shiny)
        
        ui <- fluidPage(
          titlePanel( "${1:title}" ), 
          
          sidebarLayout(
            sidebarPanel(
            
            ),
            mainPanel(
            
            )
          )
        )
        
        server <- function(input, output, session) {
          
        }
        
        shinyApp(ui, server)

![](man/figures/sidebarpage.gif)

### withProgress

    snippet with_progress
        withProgress( message = "${1:message}" , {
        
        })

![](man/figures/with_progress_snippet.gif)

Please note that the ‘shinysnippets’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.

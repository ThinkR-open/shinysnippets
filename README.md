
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shinysnippets <img src="reference/figures/thinkr-hex-shinysnippets.png" align="right" alt="" width="120" />

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
        ${1:name}ui <- function(id){
            ns <- NS(id)
            tagList(
            
                )
            }
    
        ${1:name} <- function(input, output, session){
            ns <- session\$ns
        }
        
        # Copy in UI
        ${1:name}ui("${1:name}ui")
        
        # Copy in server
        callModule(${1:name}, "${1:name}ui")

![](reference/figures/module_snippet.gif)

### observeEvent

    snippet observe_event
        observeEvent( ${1:event} , {
        
        })

![](reference/figures/observeEvent_snippet.gif)

### sidebar\_page

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

![](reference/figures/sidebarpage.gif)

### withProgress

    snippet with_progress
        withProgress( message = "${1:message}" , {
        
        })

![](reference/figures/with_progress_snippet.gif)

Please note that the ‘shinysnippets’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.

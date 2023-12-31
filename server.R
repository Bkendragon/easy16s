options(shiny.maxRequestSize = 30 * 1024 ^ 2)

suppressMessages(suppressWarnings(library(shinydashboard)))
suppressMessages(suppressWarnings(library(shinymeta)))
suppressMessages(suppressWarnings(library(phyloseq)))
suppressMessages(suppressWarnings(library(phyloseq.extended)))
suppressMessages(suppressWarnings(library(ggplot2)))
suppressMessages(suppressWarnings(library(dplyr)))
suppressMessages(suppressWarnings(library(DT)))
suppressMessages(suppressWarnings(library(magrittr)))
suppressMessages(suppressWarnings(library(factoextra)))

shinyServer
(function(input, output, session)
{  
  source("internals.R")
  source("panels/dataInput.R", local = TRUE)
  source("panels/Summary-server.R", local = TRUE)
  source("panels/table-server.R", local = TRUE)
  source("panels/barplot-server.R", local = TRUE)
  source("panels/heatmap-server.R", local = TRUE)
  source("panels/rarefactionCurve-server.R", local = TRUE)
  source("panels/richnessA-server.R", local = TRUE)
  source("panels/richnessB-server.R", local = TRUE)
  source("panels/pca-server.R", local = TRUE)
  source("panels/deseq-server.R", local = TRUE)
  source("panels/tree-server.R", local = TRUE)

  physeq <- reactiveVal()
  raw_physeq <- reactiveVal()
  select_physeq <- reactiveVal()
  transform_physeq <- reactiveVal()
  
  showModal(dataInput())

  observeEvent(input$dataButton, {
    showModal(dataInput())
  })
  
  observeEvent(input$filterButton, {
    showModal(filterSample())
  })
  
  observeEvent(input$transformButton, {
    showModal(transformSample())
  })
  
  observeEvent(input$downloadButton, {
    showModal(dataDownload())
  })
  
  observeEvent(input$plotButton, {
    showModal(plotDownload())
  })
  
})

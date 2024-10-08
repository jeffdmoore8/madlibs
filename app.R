library(shiny)

generate_story <- function(noun, verb, adjective, adverb) {
  glue::glue("
    Once upon a time, there was a {adjective} {noun} who loved to
    {verb} {adverb}. It was the funniest thing ever!
  ")
}

ui <- fluidPage(
  titlePanel("Mad Libs Game"),
  sidebarLayout(
    sidebarPanel(
      textInput("noun1", "Enter a noun:", ""),
      textInput("verb", "Enter a verb:", ""),
      textInput("adjective", "Enter an adjective:", ""),
      textInput("adverb", "Enter an adverb:", "")

    ),
    mainPanel(
      h3("Your Mad Libs Story:"),
      textOutput("story")
    )
  )
)

server <- function(input, output) {
  story <- reactive({
    generate_story(req(input$noun1), req(input$verb), req(input$adjective), req(input$adverb))
  })
  output$story <- renderText({
    story()
  })
}

shinyApp(ui = ui, server = server)

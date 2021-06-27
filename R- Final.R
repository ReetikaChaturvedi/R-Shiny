#  Read in Police Crash Data Set
PolData<-read.csv("Records_data.csv")

ui <- fluidPage(
  leafletOutput("mymap",height = 1000)
)

server <- function(input,output, session){
  
  data <- reactive({
    x <- PolData
  })
  
  output$mymap <- renderLeaflet({
    PolData <- data()
    
    m <- leaflet(data = PolData) %>%
      addTiles() %>%
      addMarkers(lng = ~Longitude,
                 lat = ~Latitude,
                 popup = paste("Latitude", PolData$Latitude, "<br>",
                               "Longitude:", PolData$Longitude))
    
  })
}

shinyApp(ui, server)
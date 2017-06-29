library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

   # Application title
   titlePanel("DDMoRe repository metadata builder"),

   # Sidebar with a slider input for number of bins
   sidebarLayout(
      sidebarPanel(
        selectInput(inputId = "DataType",
                    label = "Type of Data",
                    choices = c("PK",
                                "PD",
                                "PBPK",
                                "QSP",
                                "Other data type"),
                    multiple = TRUE),

        selectInput(inputId = "Species",
                    label = "Species",
                    choices = c("Human",
                                "Mouse",
                                "Rat",
                                "Dog",
                                "Primate",
                                "Other Species"),
                    selected = "Human",
                    multiple = FALSE),

        selectInput(inputId = "AgeCat",
                    label = "Age Category",
                    choices = c("Adult",
                                "Pediatric",
                                "Elderly",
                                "Other age category"),
                    selected = "Adult",
                    multiple = FALSE),

        selectInput(inputId = "AgeClass",
                    label = "Age Class",
                    choices = c("Preterm",
                                "0-27 days",
                                "28 days - 23 months",
                                "2 - 11 years",
                                "12 - 17 years",
                                "18 - 64 years",
                                "65 - 74 years",
                                "75 - 84 years",
                                ">85 years"),
                    selected = "18 - 64 years",
                    multiple = FALSE),

        selectInput(inputId = "Population",
                    label = "Population",
                    choices = c("Healthy Volunteers",
                                "Patients",
                                "Liver impairment",
                                "Renal impairment",
                                "Obese",
                                "Ethnic origin",
                                "Other population"),
                    selected = "Healthy Volunteers",
                    multiple = FALSE),

        selectInput(inputId = "Ethnicity",
                    label = "Ethnicity",
                    choices = c("Caucasian",
                                "Asian",
                                "Japanese",
                                "Chinese",
                                "African",
                                "Hispanic",
                                "Indian",
                                "Other ethnicity"),
                    multiple = TRUE),

        selectInput(inputId = "Gender",
                    label = "Gender",
                    choices = c("Male",
                                "Female"),
                    multiple = TRUE),

        selectInput(inputId = "Indication",
                    label = "Indication",
                    choices = c("Allergy / respiratory",
                                "Cardiovascular",
                                "CNS",
                                "Infection",
                                "Inflammation",
                                "Metabolic",
                                "Oncology",
                                "Pain",
                                "Rare diseases"),
                    multiple = FALSE),

        textInput(inputId = "DrugClass",
                  label = "Drug Class",
                  value = "",
                  width = "140")
      ),

      # Show a plot of the generated distribution
      mainPanel(
         textOutput("Description")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

   output$Description <- renderText({
     paste(
       paste("[DataType]",paste(input$DataType, collapse = ", ")),
       paste("[Species]",input$Species),
       paste("[AgeCategory]",input$AgeCat),
       paste("[AgeRange]",input$AgeClass),
       paste("[Population]",input$Population),
       paste("[Ethnicity]",paste(input$Ethnicity, collapse = ", ")),
       paste("[Gender]",paste(input$Gender, collapse = ", ")),
       paste("[Indication]",input$Indication),
       paste("[DrugClass]",input$DrugClass),
       sep = "; ")
   })
}

# Run the application
shinyApp(ui = ui, server = server)


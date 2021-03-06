library(shiny)
library(shinythemes)
library(leaflet)
library(shinydashboard)
library(DT)

shinyUI(
    navbarPage(theme = shinytheme('yeti'),
               "Vancouver Property Analysis App",
        tabPanel('Home', icon = icon('home'),
                 fluidPage(
                     fluidRow(
                         h1(class = 'text-center', 'Vancouver Property Analysis App'),
                         column(2, 
                                selectInput('municipality_input', 'Municipality',
                                            c('Vancouver' = 'Vancouver CMA', 
                                              'Arbutus-Ridge' = 'Arbutus-Ridge',
                                              'Downtown' = 'Downtown',
                                              'Dunbar-Southlands' = 'Dunbar-Southlands',
                                              'Fairview' = 'Fairview',
                                              'Grandview-Woodland' = 'Grandview-Woodland',
                                              'Hastings-Sunrise' = 'Hastings-Sunrise',
                                              'Kensington-Cedar Cottage' = 'Kensington-Cedar Cottage',
                                              'Kerrisdale' = 'Kerrisdale',
                                              'Kitsilano' = 'Kitsilano',
                                              'Marpole' = 'Marpole',
                                              'Mount Pleasant' = 'Mount Pleasant',
                                              'Oakridge' = 'Oakrdige',
                                              'Renfrew-Collingwood' = 'Renfrew-Collingwood',
                                              'Riley Park' = 'Riley Park',
                                              'Shaughnessy' = 'Shaughnessy',
                                              'South Cambie' = 'South Cambie',
                                              'Strathcona' = 'Strathcona',
                                              'Sunset' = 'Sunset',
                                              'Victoria-Fraserview' = 'Victoria-Fraserview',
                                              'West End' = 'West End',
                                              'West Point Grey' = 'West Point Grey'
                                              ),
                                            selected = 'Downtown')),
                         column(10, 
                                tabsetPanel(
                                    tabPanel("Property Values", leafletOutput(height = 500, 'property_map')),
                                    tabPanel("Incomes", leafletOutput(height = 500, 'income_map')),
                                    tabPanel("Affordability Gap", leafletOutput(height = 500, 'gap_map'))
                                ))
                         ),
                     fluidRow(
                         column(2,
                                h3(class = 'text-center'),
                                selectInput('social_input', 'Socio-Demographic Variable',
                                            c('Age' = 'age_group', 
                                              'Household Size' = 'household_size',
                                              'House Type' = 'house_type',
                                              'Immigration Status' = 'num_people'),
                                            selected = 'age_group')),
                         column(10, h3(class = 'text-center', plotOutput("neigh_barplot")))
                     ),
                     fluidRow(
                         column(2),
                         column(5, h6(icon("exclamation-circle"), uiOutput("van_gap"),align = "center"),
                                    h6(icon("home"), uiOutput("van_value"),align = "center"),
                                    h6(icon("money-bill-wave"), uiOutput("van_income"),align = "center")),
                         
                         column(5,  h6(icon("exclamation-circle"), uiOutput("neigh_gap"),align = "center"),
                                    h6(icon("home"), uiOutput("neigh_value"),align = "center"),
                                    h6(icon("money-bill-wave"), uiOutput("neigh_income"),align = "center"))
                         
                     )
                    )
                 ),
        tabPanel('Individual Level Data', icon = icon('table'), 
                 fluidPage(
                     DTOutput('property_table')
                 ))
    )
)
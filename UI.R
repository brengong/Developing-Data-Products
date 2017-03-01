


shinyUI(pageWithSidebar(
  headerPanel("Select portfolio to invest in"),
  sidebarPanel(
    #numericInput('id1', 'Numeric input, labeled id1', 0, min = 0, max = 10, step = 1),
    checkboxGroupInput("id2", "Select Portfolio", 
                       c("Portfolio 1000" = "1000",
                         "Portfolio 1000Growth" = "1000Growth",
                         "Portfolio 1000Value" = "1000Value",
                         "Portfolio 2000" = "2000",
                         "Portfolio 2000Growth" = "2000Growth",
                         "Portfolio 2000Value" = "2000Value",
                         "Portfolio 3000" = "3000",
                         "Portfolio 3000Growth" = "3000Growth",
                         "Portfolio 3000Value" = "3000Value",
                         "Portfolio Global" = "Global",
                         "Portfolio GlobalGrowth" = "GlobalGrowth",
                         "Portfolio GlobalValue" = "GlobalValue",
                         "Portfolio Microcap" = "Microcap",
                         "Portfolio MicrocapGrowth" = "MicrocapGrowth",
                         "Portfolio MicrocapValue" = "MicrocapValue",
                         "Portfolio Midcap" = "Midcap",
                         "Portfolio MidcapGrowth" = "MidcapGrowth",
                         "Portfolio MidcapValue" = "MidcapValue",
                         "Portfolio Top200" = "Top200",
                         "Portfolio Top200Growth" = "Top200Growth",
                         "Portfolio Top200Value" = "Top200Value",
                         "Portfolio Top50MegaCap" = "Top50MegaCap",
                         "Portfolio WorldCap" = "WorldCap"
                       )),
    dateInput("date", "Start Date:"),
    submitButton('Submit')
  ),
  mainPanel(
    h3('This application normalizes your investment in the stock market to the starting price of the investment date and determines the porportion of gains or losses that accrue over time.'),
    # h4('You entered'),
    # verbatimTextOutput("oid1"),
    h4('Portfolio Selected'),
    verbatimTextOutput("oid2"),
    h4("Start Date Entered"),
    verbatimTextOutput("odate"),
    plotOutput('plott')
  )
))

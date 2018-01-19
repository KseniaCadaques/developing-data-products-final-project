library(shiny) 
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Black-Scholes Call and Put Option Price Calculator by Ksenia Kharitonova"),
                
                sidebarPanel(
                        numericInput('shareprice', 'Share price in $', 10, min = 0),
                        numericInput('strikeprice', 'Strike price in $', 15, min = 0),
                        numericInput('rfrate', 'Annualized risk-free rate in %', 10, min = 0, max = 100, step = 1),
                        numericInput('timeperiod', 'Time period in years', 1, min = 0, max = 50, step = 0.5),
                        numericInput('sigma', 'Sigma or standard deviation of the stock\'s returns in %', 10, min = 0, max = 100, step = 1),
                        submitButton('Submit')
                ), 
                mainPanel(
                fluidPage(
                        withMathJax(),
                        p('As a financial analyst I propose a handy calculator for the call and put option prices based on the Black-Scholes formulae.'),
                        p('Enter all the required values in the left panel (current share price, strike price in dollars, annualized risk-free rate and standard deviation of the stock\'s returns in %, time period in years) and click "Submit!"'),
                        uiOutput('ex1'),
                        uiOutput('ex2'),
                        tags$div(class="header", checked=NA,
                                 tags$p("You can read the rest of the formulae and the detailed description of the model here:"),
                                 tags$a(href="https://en.wikipedia.org/wiki/Black_Scholes_model", "The Black-Scholes Model Wikipedia Page")
                        ),
                        tags$div(class="header", checked=NA,
                                 tags$p("Thank you for the R implementation:"),
                                 tags$a(href="http://www.theresearchkitchen.com/archives/106", "Rory Winston, Research Kitchen")
                        ),
                        h4('Your Call Option Price in $ is:'),
                        verbatimTextOutput("calloption"),
                        h4('Your Put Option Price in $ is:'),
                        strong(verbatimTextOutput("putoption"))
                        
                        
                ))
                
        )   
)
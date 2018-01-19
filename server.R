library(shiny) 

## rsconnect::deployApp('C:\\Users\\Usuari\\Documents\\Studies\\Coursera\\Data Science\\09 Developing data products\\project')

blackscholes <- function(S, X, rf, timeperiod, sigma) {
        values <- c(2)
        
        d1 <- (log(S/X)+(rf/100+(sigma/100)^2/2)*timeperiod)/(sigma/100*sqrt(timeperiod))
        d2 <- d1 - sigma/100 * sqrt(timeperiod)
        
        values[1] <- S*pnorm(d1) - X*exp(-rf*timeperiod)*pnorm(d2)
        values[2] <- X*exp(-rf*timeperiod) * pnorm(-d2) - S*pnorm(-d1)
        
        values
}

shinyServer(
        function(input, output) {
                
                output$shareprice <- renderPrint({input$shareprice})
                output$strikeprice <- renderPrint({input$strikeprice})
                output$rfrate <- renderPrint({input$rfrate})
                output$timeperiod <- renderPrint({input$timeperiod})
                output$sigma <- renderPrint({input$sigma})
                output$calloption <- renderPrint({blackscholes(input$shareprice,input$strikeprice,input$rfrate,input$timeperiod,input$sigma)[1]})
                output$putoption <- renderPrint({blackscholes(input$shareprice,input$strikeprice,input$rfrate,input$timeperiod,input$sigma)[2]})
                output$ex1 <- renderUI({
                        withMathJax(helpText('$$ C(S_{t},t)=N(d_{1})S_{t}-N(d_{2})Ke^{-r(T-t)}$$'))})
                output$ex2 <- renderUI({
                        withMathJax(helpText('$$ P(S{_t}, t)=N(-d_{2})Ke^{-r(T-t)}-N(-d_{1})S_{t}$$'))})
                #output$ex3 <- renderUI({
                #        withMathJax(helpText('$$latex d_{1}={\frac  {1}{\sigma {\sqrt  {T}}}}\left[\ln \left({\frac  {S_{0}}{K}}\right)+\left(r+{\frac  {1}{2}}\sigma ^{2}\right)T\right]$$'))})
                #output$ex4 <- renderUI({
                #        withMathJax(helpText('$$latex d_{2}=d_{1}-\sigma {\sqrt  {T}}$$'))})
        } 
)
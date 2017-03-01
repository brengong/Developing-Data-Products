


library(data.table)
library(dplyr)
library(reshape2)
library(tidyr)
library(lubridate)
library(readr)
library(ggplot2)
library(GGally)
library(ggthemes)
library(quantmod)
library(gridExtra)
library(sqldf)
library(shiny)
library(plotly)
# setwd("C:/Users/Brendan/Desktop/developing data products second attempt/stock prices shiny app")

russellstack <- fread("russellstack.csv")[,.(portfolio=factor(portfolio), pdate=ymd(pdate), idxwdiv=idxwdiv)]


mkgraph <- function(rs,ports=c("1000","2000","3000"), pd="1899-12-31")
{ 
  pd <- ymd(pd)
  minrdte <- min(rs$pdate)
  mindte <- ifelse (pd <= minrdte, minrdte, tail(rs[which(rs$pdate<pd)]$pdate,1))
  
  slug <- rs[portfolio %in% ports & pdate >= mindte][,.(pdate=pdate, grdollar=idxwdiv/idxwdiv[1],N=.N),by="portfolio"]
  
  #printfnct(slug)
  
  g1 <- ggplot(slug, 
               aes(y=grdollar, x=pdate, color=portfolio)) +
    geom_line() +
    theme_economist_white() +
    theme(plot.title = element_text(size = 10,colour="black")) +  
    theme(axis.text=element_text(size=rel(0.5)),axis.title=element_text(size=rel(0.6))) +  
    theme(legend.text = element_text(size=rel(0.7)), legend.title=element_text(size=rel(.7)), legend.position="bottom", legend.box="horizontal") + 
    scale_linetype_manual(breaks=c("idxwdiv","idxwodiv"), values=c(1,3)) +
    scale_color_brewer(palette="Dark2") +
    ggtitle(paste("Russell Portfolios -- ", min(slug$pdate)," to ", max(slug$pdate), "\n\n",sep="")) +
    ylab("\nGrowth of $1") +
    xlab("Date\n")
  print(g1)
  #ggplotly(g1)
}

library(shiny)
shinyServer(
  function(input, output){
    # output$oid1 <- renderPrint({input$id1})
    output$oid2 <- renderPrint({input$id2})
    output$odate <- renderPrint({input$date})
    output$plott <- renderPlot({
      #portfoli <- input$id2
      mkgraph(russellstack,input$id2, input$date)})
  }
)

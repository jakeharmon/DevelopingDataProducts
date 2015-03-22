shinyUI(pageWithSidebar(
  headerPanel('Wine: k-means clustering to predict grape variety'),
  sidebarPanel(
    helpText("Select X and Y predictors."),
    selectInput('xcol', 'X-Axis Predictor', names(wine[,-1])),
    selectInput('ycol', 'Y-Axis Predictor', names(wine[,-1]),
                selected=names(wine[,-1])[[2]]),
    numericInput('clusters', 'Cluster count', 3,
                 min = 3, max = 3,),
    helpText("Clusters should not be editable as there are only 3 groups to be predicted")
  ),
  mainPanel(
    plotOutput('plotKmeans'),
    helpText("The results show how a k-means algorithm attempts categorize the dataset into 3 clusters by color"),
    helpText("These 3 clusters are the predictions of the three different grape varieties represented in the dataset"),
    helpText("The results also show the correct Type label.(Type in the dataset)"),
    helpText("Therefore, the user can use the this app to figure out which 2 predictors give the kmeans algorithm the best chance to group by variety"),
    tags$p(),
    helpText("For more info about the rattle$wine dataset, see"),
    tags$a("http://www.inside-r.org/packages/cran/rattle/docs/wine")
  )
))
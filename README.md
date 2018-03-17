# Ass4_ShinyApp
A shiny app and some slides for Assignment 4 of the course "Developing Data Products"
See the app here: https://mjfilipski.shinyapps.io/Ass4_ShinyApp/

## What the App does:
- The app renders a plot of the "WorldPhones" dataset available in R
- It plots the number of phones, by year, by continent, for the period 1951:1961
- For each continent, it displays:  
    * the trendline on the graph,
    * the slope of the trendline (growth rate) in a table below
- The plot and table are _reactive_: the user is able to _select_ which continents to display,
and watch the outputs change accordingly.

## How to use it:
- The user can click checkboxes on the left-hand side of the screen
- Checked continents have their data displayed, unchecked do not.
- User can compare the different rates  of growth in telephone usage between continents,
both visually and numerically

## How the App does it:
- The app relies on the Shiny framework, with a ui.R and a server.R file.
- The ui.R file arranges the different components in space, and lets the user select continents
- The server.R file generates a sub-dataset reactively, according to the continents selected.  
It then computes trendlines and generates the plot/table for that subdataset.
- Code is attached in this repo

## Reproducible Pitch
- The file ReproducibePitch.Rpres was made using R Studio's R presentation framework
- It contains 5 slides to explain how the app functions   
- It also generates the "ReproduciblePitch.md" file, which renders markdown output, and is
the better way to read it directly on github

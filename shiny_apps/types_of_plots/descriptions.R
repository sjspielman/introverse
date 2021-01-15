# Descriptions of plots for p() in shiny app.
library(shiny)

## Penguins text -------------------------------------------------------
penguins_text <- shiny::tagList(
  
  p("To demonstrate the different types of plots, we will use the glorious", 
    a("{palmerpenguins} package's", href = "https://github.com/allisonhorst/palmerpenguins"), 
    tags$code("penguins"), "dataset. As the source describes,"
    ),
  tags$blockquote(
    "Data were collected and made available by", 
    a('Dr. Kristen Gorman', href = '(https://www.uaf.edu/cfos/people/faculty/detail/kristen-gorman.php'),'and the', a('Palmer Station, Antarctica LTER', href = 'https://pal.lternet.edu/'),'a member of the', a('Long Term Ecological Research Network.', href = 'https://lternet.edu/')
    ),

  tags$img(src = "img/lter_penguins.png", width = "50%"),
  div(style = "font-size:0.8em;", 
    p("Artwork by", a("@allison_horst", href="https://github.com/allisonhorst/palmerpenguins"))
  ),
  br(),
  
  p("The dataset contains physical measurements from penuins of three species (Adelie, Chinstrap, and Gentoo), which live on three different islands in Antarctica (Biscoe, Dream, and Torsergen). Measurements were taken once during the years 2007-2009. The dataset eight different variables, as folows:"),
  tags$ul(
    tags$li("Three categorical variables:"),
    tags$ul(
      tags$li(tags$code("species")),
      tags$li(tags$code("island")),
      tags$li(tags$code("sex"))
     ),
    tags$li("Four numeric continuous variables:"),
    tags$ul(
      tags$li(tags$code("bill_length_mm")),
      tags$li(tags$code("bill_depth_mm")),
      tags$li(tags$code("flipper_length_mm")),
      tags$li(tags$code("body_mass_g")),
   ),   
   tags$li("One numeric discrete variable,", tags$code("year"))
  ),
  p("You'll also notice below that many of the data points say 'NA' instead of containing a value. The NAs represent missing data that is simply not part of the dataset. There are many reasons why data points are missing, but it doesn't necessarily mean there is something 'wrong' with the dataset! Sometimes, information is just not known."),
  br(),
  p("Explore the dataset below, and use it to make and understand different types of data visualizations in the subsequent tabs."),
  br()
  
)

## Histogram text -------------------------------------------------------------
histogram_text <- shiny::tagList(
  br(),
  p("Histograms display numeric distributions. They are one of the most common plots we use to visualize a single distribution, but they can also used to compare multiple distributions to each other. Along the x-axis, we plot the values of the numeric variable, and along the y-axis, we plot a bar whose height is the number of times that value appears in the dataset. For example, in the simplest circumstance, if our dataset is: [10, 10, 11, 11, 11, 15], we would plot a bar at x=10 with a height y=2, a bar at x=11 with a height y=1, and a bar at x=15 with a height y=1."), 

  p("Unfortunately, circumstances are usually not so simple. Numeric distributions often have decimals! Imagine if this were our dataset of numbers: [10.05, 10.1, 10.111, 10.117, 10.121, 10.122, 10.123, ...]. We would need a bunch of bars at height y=1 for each different tiny tiny decimal! That plot would be utterly impossible to interpret or understand."),

  p("Therefore, to make a histogram, we", tags$b("bin"), "the data along the x-axis. We create mini range chunks in our data to put on the x-axis, and on the y-axis we plot a bar whose height is how many datapoints are within the bin. For example, consider this dataset: [10.1, 11.2, 11.6, 13.5, 14.4, 14.8, 17.2, 17.5]. If we create bins with a range of 2 ('bin width'), we'd have four bins: values 10-12 (>=10 but <12): [10.1, 11.2, 11.6], values 12-14 [13.5], values 14-16 [14.4, 14.8], and finally values 16-18 [17.2, 17.5]. Our plot would have three bars of heights y=3, y=1, y=2, and y=2."),

  p("Choosing an appropriate bin width is key to building a histogram that finds a balance between seeing as many values as possible while still being able to see the shape of and identify trends in the data."),
 
  #
  #shiny::tags$blockquote(
  #  p("You'll notice in the ", tags$code("penguins"), "dataset that 'count' is not a variable in the dataset - it's not a column! It is actually a", tags$em("data transformation"), ", specifically a count of the number of observations."
  #  )
  #),
  
  shiny::tags$blockquote(
    p("Histograms look very similar to barplots that show counts! How are they different? In histograms, the x-axis variable is", tags$b("numeric continuous"), ", but in barplots showing counts, the x-axis variable is either a ", tags$b("categorical or numeric discrete"), "Histograms are, in effect, a special type of barplot that place", tags$b("binned"), "continuous numeric values on the x-axis, instead of the variable's values themselves."
      )
  )
)

# Boxplot text ----------------------------------------------------------------

boxplot_text <- tagList(
  p("Boxplots are very commonly used to compare multiple distributions to one another, specifically to visualize how the distribution of a given numeric variable varies across categories of another discrete variable. Also known as box-and-whisker plots, these plots essentially 'collapse' a distribution into a", tags$b("five-number summary"), "of the data: the minimum value, the first and third quartiles, the median, and the maximum value. The area inside the box represents the", tags$b("interquartile range (IQR)"), "which contains the middle 50% of the data values. The line in the middle of the box represents the data's", tags$b("median"), "value, and the length of the lines ('whiskers') represents the minimum and maximum values, usually. Sometimes a dataset has outliers (values that lie exceedingly far from the median - there is no one single definition of calculating outliers!), and these are represented as small points above the 'maximum' and below the 'minimum'.", tags$b("Luckily, the computer will calculate and draw all of this for you!")),
  br(),
  tags$img(src = "img/boxplot.png", width = "60%"),
  br(),
  p("Boxplots are very useful for getting an overall sense of data range, median, and distribution symmetry, but there is a lot of information that these plots inherently cannot tell us. For example, you cannot tell the modality of a distribution (unimodal, bimodal, etc.) from a boxplot, and it can be challenging to get a true sense of data skew from a boxplot. In fact, one reason boxplots were popularized is because they provided quick ways to draw a whole bunch of numbers by hand, before computers could help us with our data visualization.")
)





density_text <- tagList(
  p("Like a smoothed histogram and can be interpreted in a similar way - higher peaks represent areas along the x axis where more data is concentrated. the y-axis though is not count (how many observations), but it is kind of a statistical transformation of the count called kernel density. For many, the look of this plot will be most intuitive about interpreting a dsitribution, and you don't need to udnertand the nitty-gritty details of what kerney density is to be able to identify trends. Be aware, however, that referring to the y axis is not meaningful - we would not say something like a certain value has a density of 0.5. We might say there is a higher density of points in a lower or upper region, but not a specific density value.")
)

violin_text <- tagList(
  p("The child of a boxplot and a density plot. Each is a density plot, but turned sideways and mirrored. It is usually presented like a boxplot, with different subsets (categories) of a numeric variable displayed across the x-axis. Some people really like this plot, and some people really hate it. When you first see them they are strange looking and unappealing, but for many like myself, they grow on you overtime.")
)

jitter_text <- tagList(
  
  p("All the points at once!")
)

sina_text <- tagList(
  p("The child of a violin and jitter plot! It's the same as a jitter plot, except points are specifically arranged based on density like a violin plot. These are possibly the most compreshensive plot - you see all the values based on their height, and you see the shape of the distribution. Much like violin and strip, these are really a love it or hate it proposition.")
)



barplot_text <- tagList(
  p("Many plots contain bars and they show different things. Either way the height of the bar represents some value, commonly the count of a categorical variable. These days there are many boutique/small-batch ways of representing categorical data and relationships but barplots are the old school and generally most common."),
  br(),
  p("Many often use barplots to summarize distribtuions of numeric data by plotting mean and error bars. while very common, these types of plots cannot at all convey the underlying distribution of the data. Below is an example of such a barplot: The height of each bar represents the mean flipper length for each penguin species, and the total length of each error bar represents that distribution's standard deviation. In essense, then, this plot is just a fancy way to state two numbers. This type of plot is useful if your visualization goal is only to compare means and spread, but if you want to explore any other aspects of the data, this type of plot will be more or less useless.")
  
)



scatter_text <- tagList(
  p("scatterplots are not strip plots.")
)
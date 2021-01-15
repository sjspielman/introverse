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
  
  p("The dataset contains physical measurements from penuins of three species (Adelie, Chinstrap, and Gentoo), which live on three different islands in Antarctica (Biscoe, Dream, and Torsergen). Measurements were taken from penguins on these islands during the years 2007-2009. The dataset eight different variables (aka columns!), as follows:"),
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
  p("Explore the dataset below, and use it to make and understand different types of data visualizations in the subsequent tabs. You'll also notice below that many of the data entries say", tags$em("NA"), "instead of containing a value. The",  tags$em("NAs"), "represent missing data that is simply not part of the dataset. There are many reasons why data points are missing, but it doesn't necessarily mean there is something 'wrong' with the dataset! Sometimes, information is just not known."),
  br()
  
)


## Fundamentals of Data Visualization links ----------------------------------
histogram_dataviz <- tagList(
  br(),
  tags$blockquote(
    "Histograms are introduced in", a("Chapter 7 of", tags$em("Fundamentals of Data Visualization"), href = "https://clauswilke.com/dataviz/histograms-density-plots.html")
  ),
  br()
)

density_dataviz <- tagList(
  br(),
  tags$blockquote(
    "Density plots are introduced in", a("Chapter 7 of", tags$em("Fundamentals of Data Visualization"), href = "https://clauswilke.com/dataviz/histograms-density-plots.html")
  ),
  br()
)

barplot_dataviz <- tagList(
  br(),
  tags$blockquote(
    "Barplots are introduced in", a("Chapters 6", href = "https://clauswilke.com/dataviz/visualizing-amounts.html"), "and",  a("10 of", tags$em("Fundamentals of Data Visualization"), href = "https://clauswilke.com/dataviz/visualizing-proportions.html")
  ),
  br()
)

jitter_dataviz <- tagList(
  br(),
  tags$blockquote(
    "Strip/jitter plots are introduced in", a("Chapter 9 of", tags$em("Fundamentals of Data Visualization"), href = "https://clauswilke.com/dataviz/boxplots-violins.html")
  ),
  br()
)

violin_dataviz <- tagList(
  br(),
  tags$blockquote(
    "Violin plots are introduced in", a("Chapter 9 of", tags$em("Fundamentals of Data Visualization"), href = "https://clauswilke.com/dataviz/boxplots-violins.html")
  ),
  br()
)


sina_dataviz <- tagList(
  br(),
  tags$blockquote(
    "Sina plots are introduced in", a("Chapter 9 of", tags$em("Fundamentals of Data Visualization"), href = "https://clauswilke.com/dataviz/boxplots-violins.html")
  ),
  br()
)

boxplot_dataviz <- tagList(
  br(),
  tags$blockquote(
    "Boxplots are introduced in", a("Chapter 9 of", tags$em("Fundamentals of Data Visualization"), href = "https://clauswilke.com/dataviz/boxplots-violins.html")
  ),
  br()
)

scatter_dataviz <- tagList(
  br(),
  tags$blockquote(
    "Scatterplots are introduced in", a("Chapter 9 of", tags$em("Fundamentals of Data Visualization"), href = "https://clauswilke.com/dataviz/visualizing-associations.html")
  ),
  br()
)


## Histogram text -------------------------------------------------------------
histogram_text <- shiny::tagList(
  br(),
  p("Histograms display numeric distributions. They are one of the most common plots we use to visualize a single distribution, but they can also used to compare multiple distributions to each other (as shown in the faceted histogram). Along the x-axis, we plot the values of the numeric variable, and along the y-axis, we plot a bar whose height is the number of times that value appears in the dataset. For example, in the simplest circumstance, if our dataset is: [10, 10, 11, 11, 11, 15], we would plot a bar at x=10 with a height y=2, a bar at x=11 with a height y=1, and a bar at x=15 with a height y=1. Therefore, the y-axis does not display a variable that is actually in our dataset - it displays a", tags$b("statistical transformation"), "of the data, namely counts in each bin."), 

  p("Unfortunately, circumstances are usually not so simple. Numeric distributions often have decimals! Imagine if this were our dataset of numbers: [10.05, 10.1, 10.111, 10.117, 10.121, 10.122, 10.123, ...]. We would need a bunch of bars at height y=1 for each different tiny tiny decimal! That plot would be utterly impossible to interpret or understand."),

  p("Therefore, to make a histogram, we", tags$b("bin"), "the data along the x-axis. We create mini range chunks in our data to put on the x-axis, and on the y-axis we plot a bar whose height is how many datapoints are within the bin. For example, consider this dataset: [10.1, 11.2, 11.6, 13.5, 14.4, 14.8, 17.2, 17.5]. If we create bins with a range of 2 ('bin width'), we'd have four bins: values 10-12 (>=10 but <12): [10.1, 11.2, 11.6], values 12-14 [13.5], values 14-16 [14.4, 14.8], and finally values 16-18 [17.2, 17.5]. Our plot would have three bars of heights y=3, y=1, y=2, and y=2."),

  p("Choosing an appropriate bin width is key to building a histogram that finds a balance between seeing as many values as possible while still being able to see the shape of and identify trends in the data."),
  
  shiny::tags$blockquote(
    p("Histograms look very similar to barplots that show counts! How are they different? In histograms, the x-axis variable is", tags$b("numeric continuous"), ", but in barplots showing counts, the x-axis variable is either a ", tags$b("categorical or numeric discrete"), "Histograms are, in effect, a special type of barplot that place", tags$b("binned"), "continuous numeric values on the x-axis, instead of the variable's values themselves."
      )
  )
)

# Boxplot text ----------------------------------------------------------------
boxplot_text <- tagList(
  p("Boxplots are very commonly used to compare multiple distributions to one another, specifically to visualize how the distribution of a given numeric variable varies across categories of another discrete variable. Also known as box-and-whisker plots, these plots essentially 'collapse' a distribution into a", tags$b("five-number summary"), "of the data: the minimum value, the first and third quartiles, the median, and the maximum value. The area inside the box represents the", tags$b("interquartile range (IQR)"), "which contains the middle 50% of the data. In other words, if there are 30 points in a dataset, the IQR shows the range of the middle 15 (half of 30) values. The line in the middle of the box represents the data's", tags$b("median"), "value, and the length of the vertical lines ('whiskers') represents the minimum and maximum values...usually. Sometimes a dataset has outliers (values that lie exceedingly far from the median - there many different ways outliers are determined!). Outliers are represented as small points above the 'maximum' and below the 'minimum' whiskers.", tags$b(tags$em("Luckily, the computer will calculate and draw all of this for you!"))),
  br(),
  tags$img(src = "img/boxplot.png", width = "60%"),
  br(),
  p("Boxplots are very useful for getting an overall sense of data range, median, and distribution symmetry, but there is a lot of information that these plots inherently cannot tell us. For example, you cannot tell the modality of a distribution (unimodal, bimodal, etc.) from a boxplot, and it can be challenging to get a true sense of data skew from a boxplot. In fact, one reason boxplots were popularized is because they provided quick ways to draw a whole bunch of numbers by hand, before computers could help us with our data visualizations.")
)




## Density text ----------------------------------------------
density_text <- tagList(
  p("Density plots are visually like a 'smoothened' histogram and can be interpreted in much the same way -  higher peaks in the distribution represent areas along the x-axis where more data is concentrated, aka there are more observations. Unlike a histogram, however, the y-axis is not a count of how many observations. Instead, the y-axis displays a different type of", tags$b("statistical transforamtion"), " called the", tags$b("kernel density."), "Many people find that this type of plot is very intuitive to interpret, and you really don't need to understand the nitty-gritty details of what kernel density is to be able to discern trends in the distribution. Be aware, however, that referring to the y-axis values is not really meaningful - we would not say something like, 'a certain x-axis value has a density of 0.2.' We might say there is a higher density/concentration of values in a certain area along the x-axis, but we do not refer to the specific y-axis density values.")
)

## Violin text ----------------------------------------------
violin_text <- tagList(
  p("Violin plots are a hybrid child of a density plot and a boxplot, named for their highly similar appearance to violins. Fundamentally, each violin is just a density plot that has been turned on its side and mirrored - notice how each violin is symmetrical along its vertical axis! Violin plots are often presented like boxplots, with different subsets (categories) of the given numeric variable displayed across the x-axis. This dataviz style tends to be a 'love-it-or-hate-it' kind of plot. When you first see a violin plot, it looks very strange and often unappealing, but for many like myself, this type of visualization can grow on you over time!")
)

## Jitter text ----------------------------------------------
jitter_text <- tagList(
  p("Strip plots, also known as jitter plots, are used to visualize multiple and compare distributions, in a similar style to boxplots and violin plots. However, strip plots consist of the literal points in the data - not a shape (like a box or violin!) mean to represent the data. It literally IS the data! Each point you see represents a single point in the actual dataset, and the height of the point along the y-axis represents its value. Within a category, the spread of the points along the x-axis is not actually meaningful - points are randomly placed along the x-axis", tags$b("so that you can actually see all of the points."), "This random scattering along the x-axis is known as 'jittering' - the points are 'jittered' along the x-axis. If the points were NOT jittered, it would be extremely difficult, if even possible, to clearly see all the values in the data. To see this in action, turn off the jittering in the side menu, and you will find it much harder to see the data."),
  p("You might also notice that any time you change the plot settings (color or displaying jittering), the specific x-axis coordinates of the points change. This is a direct consequence of their", tags$b("random"), "placement along the x-axis. The y-axis values will always be consistent with the data being examine since these represent the actual dataset values. We would not want to randomly jitter those!")
)

## Sina text ----------------------------------------------
sina_text <- tagList(
  p("Sina (pronounced 'sigh-nah') plots are yet another hybrid child of two plots: violin and strip plots. Sina plots are just like strip plots, except rather than randomly jittering points along the x-axis, points are specifically arranged based on density to give an overall shape of a violin plot. You therefore can see both the shape of the distribution as well as the individual values in the data. Sina plots are therefore a very comprehensive way to fully and transparently represent the entire scope of a numeric distribution.")
)



## Barplot text ----------------------------------------------
barplot_text <- tagList(
  p("Barplots are a very commonly used dataviz where the height of each bar represents a particular value. One of their most important uses is visualizing the number of observations in a discrete or categorical variable: The x-axis will show the different categories, and the y-axis bar will represent how many observations are in that category. Barplots are therefore similar to histograms but with the key (somewhat pendantic but also important!) distinction: Histograms specifically show binned distributions of a continuous numeric variable. For a categorical or discrete numeric variable, there is no need for binning (no decimals!), so the x-axis can truly have a tick mark for each value in the x-axis variable."),
  br(),
  p("It is very common, particular in biomedical sciences, to use barplots to summarize distributions of numeric data by plotting mean and error bars: While a popular choice, this form of data visualization cannot at all convey the underlying distribution of the data. Below is an example of such a barplot: The height of each bar represents the mean flipper length for each penguin species, and the total length of each error bar represents that distribution's standard deviation (but other versions of this plot might display a different type of error bar that isn;t standard deviation - always check the figure caption or axis label to be sure!). In essense, this type of barplot is just a fancy way to state two numbers. This type of plot is useful if your visualization goal is only to compare means and error, but if you want to explore any other aspects of the data, this type of plot will be more or less, in this author's opinion, useless.")
  
)


## Scatter text ----------------------------------------------
scatter_text <- tagList(
  p("Scatterplots are specifically used to display the", tags$b("relationship"), "between two numeric (usually but not always continuous) variables. Each point in a scatterplot represents a single observation in the data (here, a single penguin!), and the x- and y-axis values represent two values associated with that observation/penguin. We use scatterplots to visually explore the strength of association between two numeric variables."),
  p("You will also see the option to include a", tags$b("linear regression line"), "in the plot, which displays the line-of-best-fit that best summarizes the average linear relationship between x and y values. If you have elected to color points based on different discrete categories, you will see a separate regression line for each group. You will also observe a shaded gray around the line, representing the 95% confidence interval (CI). The 95% CI represents: If you collected different versions of this dataset a bunch of times, 95% of those times, the regression line would fall into that shaded area. More precisely, areas", tags$em("outside"), "the shaded confidence interval represent areas in the plot where you do not expect your line-of-best fit will be. Therefore, narrower CI's suggest that this dataset has really 'honed in' on a robustly inferred line-of-best-fit."),
  p("When interpreting a line-of-best fit, focus on the slope. If the slope is positive, the relationship between x/y is also positive - when x increases, y increases. By contrast, if the slope is negative, when x increases, y decreases, and vice versa. Importantly, if the line is flat, or it is possible to draw a completely flat line within the 95% CI shaded area, this means the slope cannot be statistically distinguished from 0. A slope of 0 represents no relationship between x and y. The", tags$b("strength of the association"), "between x and y also depends on how much noise is in the plot. The closer all points are to the regression line, the stronger the relationship is. If points are very spread out diffusely around the regression line, any potential x/y relationship is weaker."),
  p("It is important to be aware that just because you can draw a linear regression line doesn't mean the data truly are related linearly. The computer will calculate whatever you ask it you, but it is up to YOU to decide whether those calculations are reasonable in the first place. It is therefore critical to look at the plot for yourself (yes, there is lots of subjectivity in statistics!) to determine whether drawing a straight line through the points (as opposed to a curve of some kind) makes sense."),
  p("Finally, you might notice something odd about the regression lines -  for many combinations of x/y variables, the line has a negative slope when we consider a single regression line for the entire dataset, but when we show a separate regression line for each category of a discrete variable, we see positive slopes! What causes this change, and is the relationship positive or negative? This is a phenomenon known as", a(tags$b("Simpson's paradox"), href = "https://en.wikipedia.org/wiki/Simpson%27s_paradox"), "which states that trends in a dataset can change when you consider different groups at a time. This paradox highlights the absolute importance of always making sure you consider the ways in which natural groupings in the data affect your conclusions about data trends. In this circumstance, the positive slopes are correct, and the negative slopes are actually misleading about the true nature of the data.")
)
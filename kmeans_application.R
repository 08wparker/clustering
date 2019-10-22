## Applied example -- k-means and 2012 presidential vote shares by state

# Load some packages
library(ggplot2)
library(clValid)

# Load data and update the pres vote data for 2012
pres <- read.csv(file.choose()) # use "2012_pres dem vote by state" data in Data folder - 2012 presidential election Dem vote shares by state
colnames(pres)[colnames(pres)=="X"] <- "State" 
colnames(pres)[colnames(pres)=="dem_vs"] <- "DVS"

head(pres)

# fit the algorithm
set.seed(...)

kmeans <- ...(pres[,2], 
                 ... = 2,
                 ... = 15)

# Inspect the kmeans object
...(kmeans)

# Or call individual values, such as...
kmeans$cluster
kmeans$centers
kmeans$size

pres$Cluster <- ...(kmeans$cluster) # save clusters in df

# Assess a little more descriptively
t <- ...(kmeans$cluster)
t <- data.frame(t)
rownames(t) <- pres$State
colnames(t)[colnames(t)=="Freq"] <- "Assignment"
t$Var1 <- ...

head(t, 10) # inspect first 10 obs

# evaluate the distribution of states based on their cluster assignment
...(pres, aes(..., fill = ...)) + 
  geom_histogram(binwidth = 3) + 
  theme_bw() +
  scale_fill_manual(values=c("blue", "red")) +
  labs(x = "Democratic Vote Share",
       y = "Count of States") +
  geom_vline(xintercept = 50, linetype="solid", 
             color = "darkgray", size=1.2)

# What do you see?

# Searching for the likely "misclassified" state
...(pres$DVS < ... & pres$DVS > ...)
pres[..., ]


# check internal validation
pres_int <- as.matrix(pres[,2])

internal <- clValid(pres_int, 2:10, 
                    ... = c("kmeans"), 
                    ... = "internal"); summary(internal)

...(mfrow = c(2, 2))
plot(internal, legend = FALSE,
     type = "l",
     main = " ")


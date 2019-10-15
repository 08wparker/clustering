# ODIs with simulated data

# Load seriation for dissplot
library(seriation)

# create some clustered data
set.seed(9649)

x <- matrix(rnorm(200), 
            100, 
            2) # create cloud of Gaussians

mu <- matrix(rnorm(6, sd = 3), 
             3, 
             2) # create far apart means

k <- sample(1:3, 100, 
            replace = TRUE) # random vector 1:3, to constrain mean assignment

x <- x + mu[k, ] # bring random data around the means that are far apart

plot(x, # take a look 
     col = c("#428bca", "#cbcaca", "#d27979"), 
     pch = 19,
     cex = 0.8)

# scale and calculate (and store) distance matrix
x_scaled <- scale(x)
x_dist <- dist(x_scaled, 
               method = "euclidean")

# generate ODI
dissplot(x_dist)



# Back to lecture

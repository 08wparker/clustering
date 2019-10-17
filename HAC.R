# # Hierarchical agglomerative clustering

# First, load a few libraries
library(tidyverse)
library(skimr)
library(dendextend) # for "cutree" function
library(ape) # for phylo trees

# Using data from the 1977 US census statistical abstract
# store as a data frame (currently a matrix)
s <- as.data.frame(...)


# take a look at the summary stats and distributions for each
skim(s)


# select a few related features, standardize, and calculate euclidean distance matrix
s_sub <- s %>% 
  ...(Income, Illiteracy, `Life Exp`, `HS Grad`) %>% 
  ...() %>% 
  ...()

s_sub # inspect to make sure features are on the same scale


# fit the algorithms with different linkage methods and visualize
hc_single <- ...(s_sub, 
                    method = "single"); plot(hc_single, hang = -1)

hc_complete <- hclust(..., 
                      method = "complete"); plot(hc_complete, hang = -1)

hc_average <- hclust(s_sub, 
                     method = "average"); plot(..., hang = -1)

hc_centroid <- hclust(...,
                      method = "centroid"); plot(hc_centroid, hang = -1) # see the inversions?


# Now, see all in a single pane
par(mfrow = c(2,2))
hc_single <- ...(s_sub, 
                    method = "single"); plot(hc_single, hang = -1)

hc_complete <- hclust(..., 
                      method = "complete"); plot(hc_complete, hang = -1)

hc_average <- hclust(s_sub, 
                     method = "average"); plot(..., hang = -1)

hc_centroid <- hclust(...,
                      method = "centroid"); plot(hc_centroid, hang = -1)

# reset plot space
...



# Or a gimicky triangular tree (sometimes called a "cladogram"):
plot(as.dendrogram(hc_complete), 
     main = "A Cladogram of Hierarchical Clustering\n(via Complete Linkage)",
     type = ...)



# And we can cut and compare trees if we aren't sure about 3 or 4 clusters, e.g.
cuts <- ...(hc_complete, 
               k = c(3,4))

### Inspect assignments for each iteration...
cuts

### Or, a simple matrix of assignments by iteration
table(`3 Clusters` = ...[,1], 
      `4 Clusters` = ...[,2])

# what do you see? 





## FOR FUN...
## unrooted phylo tree
plot(as.phylo(hc_complete), 
     main = "Unrooted Dendrogram",
     type = "unrooted", label.offset = .1)

## "fan" phylo tree
plot(as.phylo(hc_complete), 
     main = "Fan Dendrogram",
     type = "fan", 
     label.offset = .1)



# A more interesting (though still dev) version from Romain Francois, "A2Rplot"
source("http://addictedtor.free.fr/packages/A2R/lastVersion/R/code.R")

A2Rplot(hc_complete, k = 4, 
        col.down = c("darkgreen", "darkblue", "darkred", "black"))
# Tumor Occurrence in Juvenile Green Turtles (Chelonia mydas) in Southern
# Brazil.
# 
# Author: Tawane Yara Nunes
# 
# Data source: Laboratório de Ecologia e Conservação - UFPR
# 
# Description: the script allows to load the data, manipulate and assign the
# main variables


# Packages ---------------------------------------------------------------

library(dplyr)


# Importing data ----------------------------------------------------------

green_turtle <- read.csv("./Data/Raw/green_turtle_pr_cmr.csv", sep = ";")


# Data manipulation -------------------------------------------------------

# Selecting the only the information of the first recapture of each individual
# to avoid biases of repeated measurements

green_turtle <- green_turtle %>% filter(capture_recapture == "capture")

# Exporting the modified table
if (dir.exists("data/processed")) dir.create("data/processed")
write.csv(green_turtle,
          "data/processed/01_no_recap_green_turtle.csv",
          row.names = FALSE)

# Checking if each row is one individual
length(green_turtle$id_turtle) == length(unique(green_turtle$id_turtle))

# Assigning variables -----------------------------------------------------

# CCL stands for Curvilinear Carapace Length and is a indicative of
# developmental stage in sea turtles
CCL <- green_turtle$CCL 

# Body condition is measured as the apparent nutritional condition 
# classified as: good, regular or poor
body_condition <- as.factor(green_turtle$body_score)
levels(body_condition) <- c("good", "regular", "poor")

# Presence (1) or absence (0) of tumors
tumor <- as.factor(green_turtle$tumors)

# Tumor index calculated based on the size and number of tumors. 
# It was not measured for all individuals
tumor_index <- green_turtle$tumor_index


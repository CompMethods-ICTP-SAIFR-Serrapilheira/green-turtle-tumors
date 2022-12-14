# Tumor Occurrence in Juvenile Green Turtles (Chelonia mydas) in Southern
# Brazil.
# 
# Author: Tawane Yara Nunes
# 
# Data source: Laboratório de Ecologia e Conservação - UFPR
# 
# Description: the script allows to load the data, manipulate the
# main variables


# Packages ---------------------------------------------------------------

library(dplyr)


# Importing data ----------------------------------------------------------

green_turtle <- read.csv("./Data/Raw/green_turtle_pr_cmr.csv", sep = ";")


# Data manipulation -------------------------------------------------------

# Selecting the only the information of the first recapture of each individual
# to avoid biases of repeated measurements

green_turtle <- green_turtle %>% filter(capture_recapture == "capture")

# Checking if each row is one individual
length(green_turtle$id_turtle) == length(unique(green_turtle$id_turtle))

# Checking and changing variables types -----------------------------------------------------
str(green_turtle)

# Curvilinear Carapace Length (CCL) is measured in centimeters and it is used to
# infer developmental stage in sea turtles
str(green_turtle$CCL)

# Presence (1) or absence (0) of tumors
str(green_turtle$tumors)

green_turtle$tumors <- as.factor(green_turtle$tumors)
green_turtle <- green_turtle %>% mutate(tumor_chr = recode(tumors,
                                                           "0" = "Non-afflicted",
                                                           "1" = "Afflicted"))

# Tumor Index is calculated based on the number and size of tumors.
str(green_turtle$tumor_index)

# It can be used to classify the severity of the disease as: mild < 40, 
# 40 =< moderate =<120 and 120 < severe

green_turtle <- green_turtle %>% mutate(tumor_severity = cut(tumor_index,
                                             breaks = c(0,40,120,+Inf),
                                             labels = c("mild", "moderate","severe")))


# Exporting the modified table --------------------------------------------

if (dir.exists("data/processed")) dir.create("data/processed")
write.csv(green_turtle,
          "data/processed/01_no_recap_green_turtle.csv",
          row.names = FALSE)

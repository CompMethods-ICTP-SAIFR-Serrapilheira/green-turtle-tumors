# Tumor Occurrence in Juvenile Green Turtles (Chelonia mydas) in Southern
# Brazil.
# 
# Author: Tawane Yara Nunes
# 
# Data source: Laboratório de Ecologia e Conservação - UFPR
# 
# Description: 
# The script allows to calculate the descriptive statistics of the 
# interest variables
# 
# Requirements:
# Run the 01_data_manipulation.R script


# Packages ----------------------------------------------------------------

library(dplyr)
library(ggplot2)
library(ggpubr)


# Observations: green turtle individuals ----------------------------------

# How many individuals are being evaluated?
length(green_turtle$id_turtle)

# Developmental stage: Carapace size --------------------------------------

# How is the size distribution among the local population?

green_turtle %>% summarise(obs=n()-sum(is.na(CCL)),
                           min = min(CCL),
                           max = max(CCL),
                           mean = mean(CCL, na.rm = T),
                           median = median(CCL, na.rm = T),
                           sd = sd(CCL, na.rm = T))

# Plotting the size distribution 

if (!dir.exists("figures")) dir.create("figures")
png("figures/01_CCL_histogram.png", 10, 8, units = "cm", res = 100)

ggplot(green_turtle, aes(x = CCL))+
 geom_histogram(binwidth = 2, colour = "gray62",fill="seagreen2")+
 labs(x = "Curvilinear Carapace Length (cm)", y = "Number of individuals")+
 theme(panel.background = element_rect(fill = "White"),
       legend.position ="none", 
       axis.line = element_line(color = "black"),
       text= element_text(size=10), 
       axis.text = element_text(size=10, colour="black"))+
 scale_x_continuous(limits=c(25,60), breaks = c(25,30,35,40,45,50,55,60))+
 scale_y_continuous(limits=c(0,25), breaks = c(0,5,10,15,20,25))


dev.off()

# Occurrence  of tumors ---------------------------------------------------

# How many green turtles have tumors?
summary(green_turtle$tumor_chr)

# Proportion of the population that has tumors
round((sum(green_turtle$tumors == 1)/length(green_turtle$tumors))*100)

# How is distributed the tumor index for all population?

green_turtle %>% summarise(obs=n()-sum(is.na(tumor_index)),
                           min = min(tumor_index, na.rm=T),
                           max = max(tumor_index, na.rm=T),
                           mean = mean(tumor_index, na.rm = T),
                           median = median(tumor_index, na.rm = T),
                           sd = sd(tumor_index, na.rm = T))

# and for those who actually have tumors with index calculated?
# Here we are selecting Tumor Index > 0

index_tumor <- green_turtle %>% filter(!is.na(tumor_index)) %>%
 filter(tumor_index>0)

index_tumor %>% summarise(obs=n()-sum(is.na(tumor_index)),
                          min = min(tumor_index, na.rm=T),
                          max = max(tumor_index, na.rm=T),
                          mean = mean(tumor_index, na.rm = T),
                          median = median(tumor_index, na.rm = T),
                          sd = sd(tumor_index, na.rm = T))

# how is the severity of the disease in the population?
summary(green_turtle$tumor_severity)

# proportions of severity classes
# mild
round((41/55)*100)
#moderate
round((6/55)*100)
#severe
round((8/55)*100)

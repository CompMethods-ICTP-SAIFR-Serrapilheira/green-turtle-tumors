# Tumor Occurrence in Juvenile Green Turtles (Chelonia mydas) in Southern
# Brazil.
#
# Author: Tawane Yara Nunes
#
# Data source: Laboratório de Ecologia e Conservação - UFPR
#
# Description: The script allows to test the difference in curvilinear carapace
# length (CCL) in green turtles with tumors and those without tumors
#
# Requirements: Run the 01_data_manipulation.R script


# Packages ----------------------------------------------------------------

library(ggplot2)
library(lsmeans)
library(bbmle)

# CCL X tumor occurrence -----

# Comparing the mean CCL between turtles with and without tumor
green_turtle %>% group_by(tumors) %>% 
 summarise(obs=n()-sum(is.na(CCL)),
           min = min(CCL),
           max = max(CCL),
           mean = mean(CCL, na.rm = T),
           median = median(CCL, na.rm = T),
           sd = sd(CCL, na.rm = T)) %>% 
 ungroup () %>% droplevels(.)

# Testing for difference in mean CCL between turtles with and without tumor
mod_null <- glm(CCL ~ 0, family = gaussian, green_turtle) # Null model
mod_tumor <- glm(CCL ~ tumors, family = gaussian, green_turtle)

# Comparing the models
AICctab(mod_null,mod_tumor,  base = T, weights = T)
summary(mod_tumor)
anova(mod_tumor, test = "F")

lsmeans(mod_tumor, specs = pairwise ~ tumors, adjust = "Tukey")

# Plotting 

ggplot(green_turtle, aes(x = CCL, y = tumors))+
 geom_boxplot()+
 theme_classic()






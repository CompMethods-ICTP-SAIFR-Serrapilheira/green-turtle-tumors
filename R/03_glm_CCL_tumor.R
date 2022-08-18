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
library(bbmle)
library(viridis)

# CCL X tumor occurrence -----

# Comparing the mean CCL between turtles with and without tumor
green_turtle %>% group_by(tumor_chr) %>% 
 summarise(obs=n()-sum(is.na(CCL)),
           min = min(CCL),
           max = max(CCL),
           mean = mean(CCL, na.rm = T),
           median = median(CCL, na.rm = T),
           sd = sd(CCL, na.rm = T)) %>% 
 ungroup () %>% droplevels(.)

# Testing for difference in mean CCL between turtles with and without tumor
mod_null <- glm(CCL ~ 0, family = gaussian, green_turtle) # Null model
mod_tumor <- glm(CCL ~ tumor_chr, family = gaussian, green_turtle)

# Comparing the models
# Selecting the model based on the Akaike Information Criterion
summary(mod_tumor)
AICctab(mod_null,mod_tumor,  base = T, weights = T) 
anova(mod_tumor, test = "F")

# Visualizing the results 
if (!dir.exists("figures")) dir.create("figures")
png("figures/02_CCL_vs_tumor.png", 15, 8, units = "cm", res = 150)

ggplot(green_turtle, aes(x = tumor_chr, y = CCL, fill = tumor_chr))+
 geom_boxplot(alpha=0.6)+
 geom_jitter(color="black", size=0.4) +
 scale_fill_manual(values=c("#69b3a2", "#404080"))+
 #scale_fill_viridis(discrete=TRUE, alpha=0.6, option = "E") +
 labs(x = "Tumors", y = "Curvilinear Carapace Length")+
 theme(panel.background = element_rect(fill = "White"),
       legend.position ="none", 
       axis.line = element_line(color = "black"),
       text= element_text(size=10), 
  axis.text = element_text(size=10, colour="black"),
  axis.title.y = element_text(margin = margin(t = 0, r = 10, b = 0, l = 0)),
  axis.title.x = element_text(margin = margin(t = 10, r = 0, b = 0, l = 0)))+
 coord_flip()
 
dev.off()


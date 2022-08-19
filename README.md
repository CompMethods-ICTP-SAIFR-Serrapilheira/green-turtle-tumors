## Tumor Occurrence in Juvenile Green Turtles (_Chelonia mydas_) </br> in Southern Brazil


**Author: Tawane Yara Nunes**  


#### Background

The green turtle, _Chelonia mydas_, is one of the seven recognized species of sea turtles and is globally classified as endangered. During their life cycle, green turtles are exposed to multiple threats such as pollution, fisheries bycatch, habitat destruction, and the occurrence of diseases . Fibropapilomatosis is a virus-born neoplastic disease most common in green turtles, especially juveniles. Tumor formation by fibropapilomatosis can compromise turtles' locomotion, food ingestion, vision, and reproduction. Investigating this disease is considered a research priority by specialists working in sea turtle biology and conservation.   

#### Goals 

This project aims to: (i) explore the occurrence of fibropapilomatosis tumors (hereafter tumors) and (ii) test if there is difference in the size between juvenile green turtles afflicted and non-afflicted by tumors, in a foraging ground in Parana State, Southern Brazil.

#### Dataset

The occurrence of tumors in juvenile green turtles was obtained from the [Laboratório de Ecologia e Conservação- UFPR]( https://www.lecufpr.net/) database, built in partnership with the [REBIMAR program](https://marbrasil.org/blog/projetos/programa-rebimar/), conducted by Associação MarBrasil. The data was collected through capture-mark-recapture campaigns from 2014 to 2019. All activities were under the Brazilian Scientific Permit from the Ministry of the Environment  SISBIO 74581-6.

#### Methods

The sea turtles were intentionally captured using well-established techniques on the Parana State coast, Southern Brazil (25°29'09"S 48°24'28"W). After being captured, the green turtles were evaluated by a veterinarian for tumor affliction. Also, the curvilinear carapace length (CCL) was measured (cm) with a flexible tape. 

For the turtles afflicted by tumors, the tumor index was calculated which takes into account the number and size of the tumors and indicates the disease severity. The occurrence of tumors was explored by the percentage of individuals afflicted by the disease. Descriptive statistics for  CCL and tumor index. Variability in CCL regarding tumor affliction was assessed using a generalized linear model.

#### Project Structure

```
Project/
*    ├── data/
*    │   ├── raw
*    │   └── processed
     ├── docs/
*    ├── figures/
     ├── R/
*    └── README.md
```
The R scripts are in the ```R``` folder. A report and its references ```.bib``` and ```.csl``` files are in the ```docs``` folder. The report contain the results of the analysis and stored in the folder ```figures```. 

#### Requirements: 

```
R libraries:

- dplyr
- ggplot2
- ggpubr
- bbmle

```

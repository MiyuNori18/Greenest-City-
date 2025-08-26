# Greenest City

# Check out my full StoryMap here 👉 https://arcg.is/1za8r3

## Abstract
Achieving environmental sustainability with rapid population increase is becoming more of an issue for urban areas. As a result, the City of Vancouver proposed the Greenest City Action Plan (GCAP), a comprehensive set of policies with the goal of making Vancouver the greenest city in the world. Clean air and green transportation are two of its 10 major actions, Clean Air and Green Transportation, areas that directly support environmental and public health. This study investigates the spatial distribution of projects falling under these action areas and how they relate to Vancouver’s population density as well as average income across Vancouver. This analysis blends statistical interpretation with spatial visualization using City of Vancouver shapefile with 2021 Canadian Census population and average income (after tax) data. Through a combination of various data visualization tools, the study revealed that green infrastructure projects are more prevalent near denser and high-income locations. The spatial and visual patterns offer valuable information on the distribution of green infrastructure in Vancouver and potential gaps in accessibility that may exist which could ultimately offer urban planning considerations for the City of Vancouver’s 2050 goals.

## Introduction
In the face of rapidly increasing emissions, declining air quality, and population increase, urban areas worldwide are facing an urgent need to build more habitable and sustainable environments. With it’s Green City Action Plan (GCAP), Vancouver, British Columbia, one of Canada’s fastest-growing cities, has taken the lead in addressing these issues. This effort, which began in 2011, aimed to transform Vancouver into the “world’s greenest city” by implementing several interrelated measures that would last until 2050. This research focuses on two of the plan’s 10 priority goals: Clean Air and Green Transportation. Both of which are especially pertinent to urban sustainability.
In addition to promoting cleaner air and lowering greenhouse gas emissions, these two goals seek to change urban transportation for private vehicles to electric cars, bicycles, and low-carbon modes of transportation, In particular, the Green Transportation goal mainly encourages the use of bicycles with the addition of bike infrastructure such as bike pumps, while the Clean Air strategy encourages the use of electric vehicles(EVs) and controls high-emission activities, by placing electric charging stations across the city. Understanding where these initiatives have been implemented and whether they align with population density and income distribution, which are essential for assessing GCAP’s effectiveness and equity.

The importance of green infrastructure in enhancing air quality and lowering urban emissions has been highlighted by earlier studies and city reports, but little is known about how fairly these projects are dispersed across the city. Is green infrastructure concentrated in high density or high-income areas? Or are they dispersed around the city in a manner that guarantees equity and accessibility? By addressing these research questions, this study seeks to fill the gaps in our understanding of the spatial impacts of environmental urban policy.

The purpose therefore of this study is to investigate the spatial distribution of Clean-Air and Green transportation projects in Vancouver and to assess whether their locations correspond with areas of higher population density or average income (after tax).
Materials and Methods
Study area

The City of Vancouver in British Columbia, Canada, is the subject of this research. With a population of over 700,000, Vancouver is a coastal urban center that is a center for innovation in sustainability, business, and culture. It is a member of the broader Metro Vancouver Regional District. The research for this study explicitly considers green infrastructure found inside Vancouver's city borders as well as nearby regions like Musqueam 2 and Metro Vancouver A, where dissemination area-level income and population statistics were available.

## Data Sources
A shapefile containing spatial data on Greenest City projects was downloaded from the City of Vancouver's open data portal. Geographic coordinates, project names, and categorical classifications for every infrastructure installation (such as bike repair hubs or EV charging stations) were included in this dataset. The cancensus R package, which accessed Statistics Canada's 2021 Canadian Census data, was used to retrieve population and average income (after tax) data. To allow thorough spatial comparison throughout the city, population density and average income (after tax) datasets were gathered at the Dissemination Area (DA) level. The sf package in R was used to import and manage all spatial datasets.

## Data Preprocessing
The Greenest City dataset was filtered to only include “Clean-air” and “Green-Transportation projects. The datasets were then reprojected to EPSG:4326 for compatibility with census spatial data, and the column names were standardized to lowercase for consistency. The cancenus package was used to retrieve the population density and average income after-tax datasets, which included regions north of Vancouver that weren’t relevant in this analysis.

To address this, both the population and average income (after tax) datasets were manually edited in ArcGIS Pro. This was done using the edit tool, where unwanted features representing the northern part of Vancouver were selected and removed. This ensured that only the relevant parts of Vancouver were retained for the analysis. The clipped datasets were then saved as new shapefiles and loaded back into R for further spatial analysis.

Once in R, the st_join () function was used to geographically join the filtered greenest city projects datasets. This made it possible to create average income (after tax) and population density maps and graphs according to the dissemination area it intersected with. The dplyr package was used to calculate summary statistics, while ggplot2, plotly, and mapview were used to make most of the visualizations, such as bar plots, box plots, and heatmaps. ArcGIS online was used to calculate Hot Spot Analysis and overlay maps for better visualizations.

## Data Analytics and Statistical Methods
The base of this research was descriptive and visual analysis. The amount of Clean-Air and Green-Transportation projects were summarized using bar plots. Histograms were created to illustrate the distribution of income and population density throughout the research region.

Using R's geom_sf (), green infrastructure points were overlaid on population choropleth maps to evaluate spatial correlations in ArcGIS Online.  Spatial joins allowed each green infrastructure point was able to inherit the average income value and population density of its respective dissemination area (DA). The differences in average income (after tax) and population density between project types were compared using box plots. and bar charts.

Lastly, to locate statistically significant clusters of green projects, a hot spot analysis was carried out using ArcGIS Online. This study aided in identifying regions with high densities of bike-related infrastructure and EV charging stations and differentiating them from regions with little to no project implementation. The hot spot results provided further information about the locations of infrastructure concentrations and possible service gaps around the city by displaying these spatial groupings with population data.

## Results
3.1  Hot Spot Analysis
According to the hot spot analysis map (Figure 1) the areas in and around the downtown core of Vancouver host a statistically significant amount of greenest city projects (Clean Air and Green Transportation). These central areas are illustrated in dark red showcasing a hot spot with 99% confidence level. On the other hand, there is no significant clustering in the southern, western and eastern parts of Vancouver, demonstrated with grey hexagonal bins. This implies that downtown Vancouver has been chosen as the location of the most sustainable initiatives. The lack of hot spots in other areas of the city also raises the possibility of unequal distribution, suggesting a need for more fair funding of green projects in underprivileged areas.
 
<img width="381" height="493" alt="image" src="https://github.com/user-attachments/assets/a37ee8ae-d6c2-479f-aaa2-a015375d933a" />

Figure 1. Hot Spot Analysis of Greenest City Projects in Vancouver, illustrating statistically significant red hexagonal clusters (99% and 95% confidence) hot spots in and around the downtown core (City of Vancouver, 2020).

## Population Density Across Greenest City Projects
At first glance, most of the Clean Air and Green Transportation projects are in densely populated areas, especially in and around downtown Vancouver (Figure 2). However, a closer examination of the zoomed-in map reveals that many of these projects, particularly Clean-Air Projects, are in fact located in relatively low populated areas. This spatial pattern might suggest a strategic placement of the Greenest City projects, which are placed in areas bordering high density areas that potentially provide more physical space for development. This could ultimately provide more flexibility for accommodating infrastructure, particularly electric charging vehicles (part of the Clean Air initiative). 

Green Transportation projects on the other hand are typically found in higher-density regions, with a wider spread and a higher median, according to the box plot that compares population density across infrastructure categories (Figure 3). Clean Air projects, on the other hand, are mainly located in less densely populated areas, this could refer to regions close to downtown. According to this distribution, Clean Air projects could be located strategically in more less densely populated areas, whereas Green-Transportation initiatives are more concentrated in dense urban cores seen as they require less physical space.

 <img width="402" height="520" alt="image" src="https://github.com/user-attachments/assets/2a81ca99-283d-4fe3-a037-94b7c20c436b" />

Figure 2. Population Density (per square km) (Statistics Canada, 2021) and Greenest Projects in Vancouver (City of Vancouver, 2020). Darker blue areas indicate higher population density; lighter blue indicate lower density. Dark purple points represent Clean Air projects;  light purple points represent Green Transportation initiatives.

 <img width="450" height="323" alt="image" src="https://github.com/user-attachments/assets/6502f220-5c77-4d2b-ab8c-375563d771fe" />

Figure 3. Clean-Air (light blue) and Green-Transportation(turquoise) from the City of Vancouver's Open Data Portal (2020) in relation to population density (per sqkm).

## Income Distribution Across Greenest City Projects
According to the spatial patterns shown in Figure 4, green infrastructure installations, particularly Clean Air projects, are located mainly in wealthier areas such as West Vancouver. In contrast, Green Transportation projects appear more frequently in the eastern parts of the city, where income levels are relatively lower, suggesting an inequitable distribution based on project type within the city of Vancouver

Green Transportation and Clean Air projects differ somewhat, according to the box plot that compares average income after taxes for each type of project (Figure 5). A narrower interquartile range and a higher median indicates that Clean Air initiatives are often found in relatively higher-income regions. On the other hand, more Green Transportation initiatives appear to be in communities with relatively lower incomes. However, there is also a greater distribution of income levels in the Green Transportation Projects, suggesting that both are implemented in lower- and higher-income. This implies a somewhat wider socioeconomic distribution for Green Transportation initiatives, whereas Clean-Air projects seem to be more apparent in wealthier areas.

 <img width="432" height="559" alt="image" src="https://github.com/user-attachments/assets/6288da0e-9bdd-46e8-8f30-a33b57e0ff18" />

Figure 4. Income (after tax) (Statistics Canada, 2021) and Greenest City Projects (City of Vancouver, 2020) in Vancouver. Darker green indicates higher population density; lighter green indicates lower density. Dark purple points represent Clean Air initiatives; light purple points represent Green Transportation projects.

<img width="526" height="349" alt="image" src="https://github.com/user-attachments/assets/396bc6f2-39e7-4d8a-aba9-53a3e2310302" />

Figure 5. Box plot illustrates Clean Air (light green) and Green Transportation (dark green) (City of Vancouver, 2020) in relation to average income (after tax) (Statistics Canada, 2021).

## Discussion
This study showcases the distribution of Vancouver’s Greenest City projects with spatial trends, with large variations in the implementation of Clean Air and Green Transportation initiatives across income levels and population densities within Vancouver. One significant finding was that Clean Air initiatives are mainly located in lower-density areas (near densely populated zones) and higher-income neighborhoods like West Vancouver. The strategic placement indicates that these regions probably have more physical space where such projects might be implemented. Green Transportation Initiatives, on the other hand, were more frequently found in lower-income, higher-density communities, especially in Vancouver’s eastern regions. This implies that transportation-focused infrastructure has a wider socio-economic reach, which may reflect the need for urban mobility in underprivileged regions. However, it's also worth considering that some Clean-Air projects, such as electric vehicle (EV) charging stations, may be disproportionately placed in higher-income areas where residents are more likely to afford electric vehicles. As Professor Nicholas Lynch highlighted Vancouver’s income inequality with the western part of the city obscuring the lived realities of lower-income residents in the east, emphasizing the importance of recognizing these internal divisions.

These findings relate directly to the purpose of this study, examining the spatial equity of green infrastructure in Vancouver through various statistical and spatial visualizations, revealing the underlying inequity in urban planning. This aligns with broader research findings. For instance, Wu, Wei, Liu, and García (2023) discovered that during the COVID-19 pandemic, disadvantaged populations were more likely to be spatially excluded from sustainable initiatives, whereas richer, white, and younger individuals had greater access to parks and trails. Similarly, Ren and Giang (2024) highlighted the environmental benefits and risks that were unevenly distributed in Metro-Vancouver especially in relation to visible minority populations, and that the disparities seem to have worsened over time.

This study has several shortcomings. Initially, although the data at the Dissemination Area (DA) level offers valuable details, it might not adequately represent intra neighborhood variance. For instance, static census data from 2021 may cause inaccuracies close to DA borders. Furthermore, certain demographic factors like race, disability, religion, ethnicity and language were not considered. Lastly, ArcGIS Pro’s hot spot analysis is limited in its ability to detect long-term trends or subtle distribution patterns because its sensitivity to grid size lacks temporal depth.

To strengthen future research several techniques and considerations can be pursued. Firstly, by including temporal data, it may be possible to monitor how infrastructure equity has changed over time and see whether policy initiatives are causing or reinforcing disparities. In addition, integrating more diverse socio-demographic variables-including racial and ethnic origins, language, or housing stability, could offer a better understanding of equity impacts within the city. Furthermore, community-engaged methods like public surveys or participatory mapping may contribute to adding a qualitative layer to the geographical data analysis. This may also provide urban planners and policy makers with a better understanding of how infrastructure is used and perceived on a more local scale. Lastly, the City of Vancouver’s approach to sustainable urban planning may benefit from learning about similar case studies in other cities that have implemented effective equitable infrastructure planning. 

Ultimately, even though the Greenest City projects demonstrate important steps towards sustainability, this study shows that equitable distribution needs to be at the forefront of their planning and project implementation. Through the integration of data driven insights, community perspectives, and evidence-based planning principles, the City of Vancouver can make huge strides in creating a greener future for all its residents, not only for those living in the most affluent or densely populated areas.

## Conclusions
The spatial distribution of Vancouver's Greenest City projects was analyzed in this study, and the findings showed significant disparities in the city's allocation of Clean Air and Green Transportation projects. While Green Transportation infrastructure is typically found in lower-income, high-density neighborhoods, Clean Air initiatives are more common in higher-income, lower-density locations bordering highly densely populated zones. However, factors like the affordability of electric vehicles suggest that electric charging vehicles which make up nearly all the Clean Air initiatives (City of Vancouver, 2020) may be more beneficial to wealthier populations. The need for more equitable planning that takes economic and geographical diversity into account is highlighted by these trends. 

However, future research should include community involvement, additional socio-economic variables such as race, ethnicity, language and age as well as temporal data. Although Vancouver has achieved significant progress over the last 10 years, the Greenest City initiative still aspires to reach a long-term sustainability goal by 2050. As the city enters the final push towards that target, more work will need to be done to ensure all citizens have fair access to all the Greenest City Projects. Inclusion must be a top priority in future development, driven by robust data, diverse community feedback, and a dedication to environmental justice and sustainability,



## References
Appelhans, T., Detsch, F., Reudenbach, C., Woellauer, S., Forteva, S., Nauss, T., Pebesma, E., Russell, K., Sumner, M., Darley, J., Roudier, P., Schratz, P., Environmental Informatics Marburg, & Busetto, L. (2024). mapview: Interactive viewing of spatial data in R (R package). https://cran.r-project.org/package=mapview

City of Vancouver. (2020). Greenest City projects. Vancouver.ca. https://opendata.vancouver.ca/explore/dataset/greenest-city-projects/information/

City of Vancouver. (n.d.). Greenest City 2020 Action Plan. Greenest City 2020 Action Plan. chrome-extension://efaidnbmnnnibpcajpcglclefindmkaj/https://vancouver.ca/files/cov/greenest-city-action-plan.pdf

CRAN. (2024, December 6). 3. Spatial joins and filters. R-Project.org. https://cran.r-project.org/web/packages/sfnetworks/vignettes/sfn03_join_filter.html

esri. (n.d.-a). Hot Spot Analysis (Getis-Ord Gi*) (Spatial Statistics)—ArcGIS Pro | Documentation. Pro.arcgis.com. https://pro.arcgis.com/en/pro-app/latest/tool-reference/spatial-statistics/hot-spot-analysis.htm

esri. (n.d.-b). Introducing ArcGIS Pro—ArcGIS Pro | Documentation. Pro.arcgis.com. https://pro.arcgis.com/en/pro-app/latest/get-started/introducing-arcgis-pro.htm

Von Bergmann, J., Shkolnik, D., & Jacobs, A. (2021). cancensus: R package to access, retrieve, and work with Canadian Census data and geography (Version 0.4.2) [R package]. https://mountainmath.github.io/cancensus/

Ren, S., & Giang, A. (2024). Inequitable spatial and temporal patterns in the distribution of multiple environmental risks and benefits in Metro Vancouver. GeoHealth, 8(12), e2024GH001157.

Statistics Canada. (2021). Census Profile, 2021 Census of Population. Statistics Canada. https://www12.statcan.gc.ca/census-recensement/2021/dp-pd/prof/details/page.cfm?LANG=E&GENDERlist=1

Pebesma, E., & Bivand, R. (2025, January 22). Spatial Data Science - 11  Point Pattern Analysis. R-Spatial.org. https://r-spatial.org/book/11-PointPattern.html

Sievert, C. (2020). Interactive web-based data visualization with R, plotly, and shiny. Chapman and Hall/CRC. https://plotly-r.com

United Nations Statistics Division. (n.d.). UN data . Data.un.org. https://data.un.org/Data.aspx?d=POP&f=tableCode%3A240

Wickham, H. (2019). Create Elegant Data Visualisations Using the Grammar of Graphics [R package ggplot2 version 3.2.1]. R-Project.org. https://cran.r-project.org/package=ggplot2

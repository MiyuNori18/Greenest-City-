# AUTHOUR: Miyuki Niyungeko
# Date : April 13th, 2025
# Student Number:245833040
# FINAL PROJECT 2025
# GG501

# Research Question: 
# Load the required library #############################################################################
library(sf)
library(mapview)
library(sf)         # for handling spatial data
library(mapview)    # for viewing spatial data
library(ggplot2)    # for making 'pretty' graphs
library(plotly)
library(dplyr)      # for data handling
library(tidyverse)
library(lubridate)
library(htmltools)
library(sp)         #for handeling spatial data:
library(leaflet)
library(DT)         # for making interactive tables
library(RColorBrewer)
library(cancensus)
library(dplyr)
library(stringr)
library(geojsonsf)


#############################################################################################################
# LOAD GREENEST CITY PROJECTS DATASETS: 

# Load the shapefile greenest city Vancouver:
greenest_city_shp <- st_read("C:/Users/Miyuki/OneDrive - Wilfrid Laurier University/GG501A-EDA Mobil/Final_Project/greenest-city-projects/greenest-city-projects.shp")

# Check the first few rows of the shapefile
head(greenest_city_shp)


# Visualize:
mapview(greenest_city_shp, zcol = "category2")

# Data Cleaning-----------------------------------------------------------------------------
# Check data structure: 
str(greenest_city_shp)

# To make it easier to work with we'll make field names to lower case
names(greenest_city_shp) <- tolower(names(greenest_city_shp))


# Filter Clean Air-Electric Charging Stations(mutate function):
clean_air_transportation <- greenest_city_shp %>%
  filter(category2 == "Clean-Air" | category2 == "Green-Transportation")

# Quick Visualization of filtered dataset:
mapview(clean_air_transportation, zcol = "category2")


# Number of Projects according to Category(Clean Air vs Green Trnasportation)
ggplot(clean_air_transportation, aes(x = category2, fill = category2)) +
  geom_bar() +
  theme_minimal() +
  labs(title = "Greenest City Projects",
       x = "Types of Greenest City Projects",
       y = "Number of Projects") +
  coord_flip() +
  scale_fill_manual(name = "Project Type", values = c("#A8E6A2", "#2E7D32")) +
  theme(plot.title = element_text(hjust = 0.5))



######################################################################################################
#LOAD POPULATION DENSITY CANCENSUS:

#API Key SetUp
set_cancensus_api_key('CensusMapper_f5864c6a10761bb515c9770deda087fe', install = TRUE, overwrite = TRUE)

#Exploring Regions and Variables:
census_regions <- list_census_regions("CA21") #Census Regions
census_vectors <- list_census_vectors("CA21") #Variables example pop counts, age, income, etc.


#Filter for Vancouver CMA(Census Metropolitan Area)
vancouver_data <- list_census_regions('CA21') |> 
  filter(level == "CSD", name %in% "Vancouver")
vancouver_data

musqueam_data <- list_census_regions('CA21') |> 
  filter(level == "CSD", name %in% "Musqueam 2")
musqueam_data

metro_data <- list_census_regions('CA21') |> 
  filter(level == "CSD", name %in% "Metro Vancouver A")
metro_data


#Use interactive tools to select regions and variables visually: 
# explore_census_vectors(dataset = "CA21") 

#retrieve population density per square kilometer 
vancouver_da <- get_census(dataset = 'CA21', regions= list(CSD = c("5915022", "5915803", "5915020")),
                           vectors= c("pop_density_sqkm" = "v_CA21_6"), level='DA', quiet = TRUE,
                           geo_format = 'sf', labels = 'short')

#Visualize data:
plot(vancouver_da["pop_density_sqkm"], main = "Population Density by Census Tract in Metro Vancouver")

# Map View:
mapview(vancouver_da, zcol = "pop_density_sqkm")

# LOADING AVERAGE TOTAL AFTER-TAX INCOME DATA SET ##########################################################

#Retrieve average income after tax in vancouver

vancouver_inc <- get_census(dataset = "CA21", 
                            regions = list(CSD = c("5915022", "5915803", "5915020")), 
                            vectors = c("avg_income" = "v_CA21_1007"), 
                            level = "DA", 
                            quiet = TRUE, 
                            geo_format = "sf", 
                            labels = "short")



# Quick data visualization: 
mapview(vancouver_inc, zcol = "avg_income")

#Save data sets for ArcGis Pro ########################################################################
# Arc GIS Pro will allow the removal of the unwanted parts of Metro Vancouver(more specifically North Shore)
# Set CRS to EPSG:4326 (WGS 84) for compatibility
clean_air_transportation <- st_transform(clean_air_transportation, 4326)
vancouver_da <- st_transform(vancouver_da, 4326)
vancouver_inc <- st_transform(vancouver_inc, 4326)

"C:\Users\Miyuki\OneDrive - Wilfrid Laurier University\GG501A-EDA Mobil\Final_Project"
# Save as Shapefile:
st_write(clean_air_transportation, "C:/Users/Miyuki/OneDrive - Wilfrid Laurier University/GG501A-EDA Mobil/Final_Project/green_transportation.shp", delete_dsn = TRUE)
st_write(vancouver_da, "C:/Users/Miyuki/OneDrive - Wilfrid Laurier University/GG501A-EDA Mobil/Final_Project/vancouver_density_pop.shp", delete_dsn = TRUE)
st_write(vancouver_inc, "C:\\Users\\Miyuki\\OneDrive - Wilfrid Laurier University\\MyLaurier Onedrive\\OneDrive - Wilfrid Laurier University\\GG501A-EDA Mobil\\Final_Project\\vancouver_income_2020.shp", delete_dsn = TRUE)


#Load Clipped Census data sets back in R  ##################################################################################

# POPULATION DENSITY CLIPPED:
# Load the shapefile greenest city Vancouver:
vancouver_city_pop <- st_read("C:/Users/Miyuki/OneDrive - Wilfrid Laurier University/GG501A-EDA Mobil/Final_Project/vancouver_density_pop.shp")

# Quick Visualization
mapview(vancouver_city_pop, zcol = "pp_dns_")


# AVERAGE INCOME AFTER TAX CLIPPED--------------------------------------------------------------------------------------------------------------------
# Load the shapefile income Vancouver:
vancouver_city_income <- st_read("C:\\Users\\Miyuki\\OneDrive - Wilfrid Laurier University\\MyLaurier Onedrive\\OneDrive - Wilfrid Laurier University\\GG501A-EDA Mobil\\Final_Project\\vancouver_income_2020.shp")


# Quick Visualization:
mapview(vancouver_city_income, zcol = "avg_ncm")


# SPATIAL JOINS ################################################################################

# POPULATION DENSITY WITH FILTERED GREENEST CITY PROJECTS:
# Are charging stations and bike infrastructure placed in high-denisty areas?
# Perform a spatial join
stations_with_density <- st_join(clean_air_transportation, vancouver_city_shp, left = TRUE)

# View the result
head(stations_with_density)


# AVERAGE INCOME(AFTER TAX) WITH FILTERED GREENEST CITY PROJECTS:
# Are charging stations and bike infrastructure placed in high-income areas?
# Perform a spatial join
stations_with_income <- st_join(clean_air_transportation, vancouver_city_income, left = TRUE)

# View the result
head(stations_with_income)


# DATA VISUALIZATIONS ####################################################################

# BOX PLOT(POPULATION DENSITY): 
ggplot(stations_with_density, aes(x = category2, y = pp_dns_, fill = category2)) +
  geom_boxplot() +
  theme_minimal() +
  scale_fill_manual(name = "Category", values = c("lightblue", "turquoise")) +
  labs(title = "Population Density Distribution Across Infrastructure Types",
       x = "Green Infrastructure",
       y = "Population Density")

# RESULTS: 
## Green Transportation(Bike infrastructure) are found in more high density areas compared to Clean-Air Infratructure(Charging Stations)

# BOX PLOT (AVERAGE INCOME):
ggplot(stations_with_income, aes(x = category2, y = avg_ncm, fill = category2)) +
  geom_boxplot() +
  theme_minimal() +
  scale_fill_manual(name = "Category", values = c("lightgreen", "#2E8B57")) +
  labs(title = "Average Income Across Green Infrastructure Types",
       x = "Infrastructure Type",
       y = "Average Income After Tax")

# Save Cleaned Data Sets in Rd. File for Reproducibility#############################################################################################3

save(clean_air_transportation, vancouver_city_income, vancouver_city_pop,
     file = "Final_Cleaned_Data_Miyuki_Niyungeko.Rd")



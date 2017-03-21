#Looking into Category Data
install.packages("tidyr")
library(dplyr)
library(tidyr)
datapath <- "~/Desktop/DS/dataset"

#Create a data frame for categories
category_df <- select(business_df, name, categories)
head(subset(category_df, select = 'categories'))

#Filter by Restaurants
head(filter(category_df, categories=="Restaurants"))
dim(filter(category_df, categories=="Restaurants"))

#How many restaurants are there?
len_restaurants = 0
for (tmp in category_df) { if (is.element("Restaurants", tmp)) { len_restaurants = len_restaurants + 1 }}
len_restaurants

#How many unique categories are there?
#uniq_categories = c()
#for (tmp in category_df) { for (x in tmp) { if (!is.element(x, uniq_categories)) { uniq_categories <- c(uniq_categories, x) }}}
#numbers_of_categories <- length(uniq_categories)
#numbers_of_categories
number_of_unique_categories <- length(unique(unlist(category_df[,2])[!unlist(category_df[,2]) %in% c(NA)]))
number_of_unique_categories

#Name of unique categories
name_of_unique_categories <- unique(unlist(category_df[,2])[!unlist(category_df[,2]) %in% c(NA)])
name_of_unique_categories

#Total of categories
total_number_of_categories <- length(category_df[,2])
total_number_of_categories

> category_df$categories[[1]]
[1] "Tobacco Shops" "Nightlife"     "Vape Shops"    "Shopping"     
> category_df$categories[[1]] == "Restaurants"
[1] FALSE FALSE FALSE FALSE
> category_df$categories[[1]] %in% "Restaurants"
[1] FALSE FALSE FALSE FALSE
> "Restaurants" == category_df$categories[[1]]
[1] FALSE FALSE FALSE FALSE
> "Restaurants" %in% category_df$categories[[1]]
[1] FALSE
> "Restaurants" %in% category_df$categories[[2]]
[1] FALSE
> "Restaurants" %in% category_df$categories[[3]]
[1] TRUE
> sapply(category_df$categories[1:5], function(x){print(x)})
[1] "Tobacco Shops" "Nightlife"     "Vape Shops"    "Shopping"     
[1] "Caterers"                  "Grocery"                   "Food"                      "Event Planning & Services" "Party & Event Planning"   
[6] "Specialty Food"           
[1] "Restaurants"   "Pizza"         "Chicken Wings" "Italian"      
[1] "Hair Removal"          "Beauty & Spas"         "Blow Dry/Out Services" "Hair Stylists"         "Hair Extensions"       "Massage"              
[7] "Permanent Makeup"      "Waxing"                "Hair Salons"          
[1] "Hotels & Travel"           "Event Planning & Services" "Hotels"                   
[[1]]
[1] "Tobacco Shops" "Nightlife"     "Vape Shops"    "Shopping"     

[[2]]
[1] "Caterers"                  "Grocery"                   "Food"                      "Event Planning & Services" "Party & Event Planning"   
[6] "Specialty Food"           

[[3]]
[1] "Restaurants"   "Pizza"         "Chicken Wings" "Italian"      

[[4]]
[1] "Hair Removal"          "Beauty & Spas"         "Blow Dry/Out Services" "Hair Stylists"         "Hair Extensions"       "Massage"              
[7] "Permanent Makeup"      "Waxing"                "Hair Salons"          

[[5]]
[1] "Hotels & Travel"           "Event Planning & Services" "Hotels"                   

> sapply(category_df$categories[1:5], function(x){"Restaurants" %in% x})
[1] FALSE FALSE  TRUE FALSE FALSE
> result <- sapply(category_df$categories, function(x){"Restaurants" %in% x})
> length(result)
[1] 144072
> dim(category_df)
[1] 144072      2
> as.integer(FALSE)
[1] 0
> as.integer(TRUE)
[1] 1
> sum(result)
[1] 48485


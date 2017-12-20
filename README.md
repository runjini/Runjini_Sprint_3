# Data Operations for Wine Reviews Using SQL and R

**Author:** Runjini Murthy

__*Project Description:*__
Using a wine review data set from Kaggle, SQL and R will be used to perform basic analysis on the data contained within this file.  The Kaggle file data was scraped from WineEnthusiast during the week of November 24th, 2017.

Within SQL and R, the following queries will be made:
1. How many countries are represented on this list?
2. What is the max points/rating for a given wine?
3. What is the minimum points/rating for a given wine?
4. How many wines have a perfect score of 100?
5. How many wines have the low score of 80?
6. What is the average points rating?
7. What countries are represented on this list?
8. How many review descriptions contain the word "oak"?
9. Provide all information on wines from India.
10. What is the max price of wine on this table?

Additionally in R, the following questions will be asked:
1. How do you assign a variable?
2. How do you perform a sum on a column?
3. How do you perform a mean on a column?
4. How do you filter?
5. How do you perform a sum/mean on a subset of data?

*Files*
A subset of the wine data as well as an R file working with this data has been uploaded to my personal repo.  Zip file: winemag-data-130k-v2.csv; subset for quick scan: winemag-data-subset

# Project Background
__*Methodology:*__ The thought process behind this project involved taking a large data set and performing basic data operations via SQL and R to glean insights from the data set.  Starting in SQL, I began looking at the most basic asks: How many countries are represented in this data set? What are they? What is the max points given?  The minimum.  I approached this data set with genuine curiosity about what I might find, and the SQL queries followed. Subsequent to feeling more comfortable in SQL, I then turned to R, with the intention of replicating all the SQL queries I had asked. Along the way, I became familiar with why tables and subsets are renamed in R for easier access/recall with further scripts.  There were many commonalities between the snippets.

# Code Snippets

### SQL Commands

*How many countries are represented on this list?*

`SELECT COUNT(DISTINCT country)
FROM wine_reviews`

Result: 44

*What is the max points/rating for a given wine?*

`SELECT MAX(points)
FROM wine_reviews`

Result: 100

*What is the minimum points/rating for a given wine?*

`SELECT MIN(points)
FROM wine_reviews`

Result: 80

*How many wines have a perfect score of 100?*

`SELECT COUNT(points)
FROM wine_reviews
WHERE points = 100`

Result: 19

*How many wines have the low score of 80?*

`SELECT COUNT(points)
FROM wine_reviews
WHERE points = 80`

Result: 397

*What is the average points rating?*

`SELECT AVG(points)
FROM wine_reviews`

Result: 88.44713820775404

*What countries are represented on this list?*

`SELECT DISTINCT country
FROM wine_reviews`

Result:
Italy
Portugal
US
Spain
France
Germany
Argentina
Chile
Australia
Austria
South Africa
New Zealand
Israel
Hungary
Greece
Romania
Mexico
Canada
     *[Note this represents a blank/null value that is returning as a unique value.]*
Turkey
Czech Republic
Slovenia
Luxembourg
Croatia
Georgia
Uruguay
England
Lebanon
Serbia
Brazil
Moldova
Morocco
Peru
India
Bulgaria
Cyprus
Armenia
Switzerland
Bosnia and Herzegovina
Ukraine
Slovakia
Macedonia
China
Egypt

*How many review descriptions contain the words "wood" or "oak"?*

`SELECT COUNT(description)
FROM wine_reviews
WHERE description like '%oak%' OR  description like '%wood%'`

Result: 27012

*Provide all information on wines from India.*

`SELECT *
FROM wine_reviews
WHERE country = 'India'`

Result:
(See image: indian_wines_SQL_Studio.jpg)

*What is the max price of wine on this table?*

`SELECT max(price)
FROM wine_reviews
WHERE price IS NOT ("")`

Result:
3300


### R Functions/Instructions

*What is the sum of points in this table?*  
*(Note: This is not a real question I want to ask, but I'm not sure how to filter yet, and I wanted to ask a basic question.)*

`sum(winemag_data_130k_v2[['points']])`

[1] 11495563


*What is the mean of points in this table?*

`mean(wine[['points']])`

[1] 88.44714

*What is the mean of points and price for wines priced over 500 dollars in this table?*

`wines_over_500 <- subset(wine, price > 500)
mean(wines_over_500)`

`mean(wines_over_500[['points']])`

[1] 95.68132

`mean(wines_over_500[['price']])`

[1] 854.1868

*What are the unique number of countries represented in the wine table?  What is the count of the unique countries?*

`unique((wine[['country']]))`

 [1] "Italy"                  "Portugal"               "US"                     "Spain"                  "France"                
 [6] "Germany"                "Argentina"              "Chile"                  "Australia"              "Austria"               
[11] "South Africa"           "New Zealand"            "Israel"                 "Hungary"                "Greece"                
[16] "Romania"                "Mexico"                 "Canada"                 NA                       "Turkey"                
[21] "Czech Republic"         "Slovenia"               "Luxembourg"             "Croatia"                "Georgia"               
[26] "Uruguay"                "England"                "Lebanon"                "Serbia"                 "Brazil"                
[31] "Moldova"                "Morocco"                "Peru"                   "India"                  "Bulgaria"              
[36] "Cyprus"                 "Armenia"                "Switzerland"            "Bosnia and Herzegovina" "Ukraine"               
[41] "Slovakia"               "Macedonia"              "China"                  "Egypt"                 

`wine_countries <- unique((wine[['country']]))
length(wine_countries)`

[1] 44

*What is the max price of wine over the value of 1 dollar?*

`max(wine[['price']])`

[1] NA  (Note: The first time I tried this, it returned an N/A value.  So, I knew I had to filter.)

`wines_over_1 <- subset(wine, price > 0)
max(wines_over_1[['price']])`

[1] 3300

*Instruction to return all the values in the country vector*

`winemag_data_130k_v2[['country']]`

*Class of column; returns the type of data in this vector; in this case, character*

`class(winemag_data_130k_v2[['country']])`

*This query is meaningless, but was used as a test.  It asks to sum all the values in the points vector.*

`sum(winemag_data_130k_v2[['points']])`

[1] 11495563

*Assign a friendlier name to the data frame; in this case, simply call it "wine."*

`wine <- winemag_data_130k_v2`

*Determine the number of unique values in the country column, and then count how many there are.*

`wine_countries <- unique((wine[['country']]))
length(wine_countries)`

[1] 44

*Determine the number of unique provinces in the table, and then count them.*

`wine_provinces <- unique((wine[['province']]))
length(wine_provinces)`

[1] 426

*This instruction was meant to determine the maximum price in the table.  However, it returned an "NA" result.*

`max(wine[['price']])`

[1] NA

*Knowing that there are prices in the field but also some blank/NA values, the code is revised to filter to wines with a value greater than 0, and then determine the maximum.*

`wines_over_1 <- subset(wine, price > 0)
max(wines_over_1[['price']])`

[1] 3300

*Determining the maximum value in the points vector.*

`max(wine[['points']])`

[1] 100

*Determining the minimum value in the points vector.*

`min(wine[['points']])`

[1] 80

*Determining how many wines have a rating of 100 points.  Result is 19, which matches the query in SQL.*

`wines_rated_100 <- subset(wine, points == 100)
length((wines_rated_100[['points']]))`

[1] 19

*Determining how many wines have a rating of 80 points.*

`wines_rated_80 <- subset(wine, points == 80)
length((wines_rated_80[['points']]))`

[1] 397

*Determining how many unique countries are represented in the table.*

`unique((wine[['country']]))
wine_countries <- unique((wine[['country']]))
length(wine_countries)`

[1] 44

*Mean point score for table.*

`mean(wine[['points']])`

[1] 88.44714

*Determining max price for wines in this table. Because of NA values, need to create a subset where wine price is greater than 1. Result is 3300.*

`wines_over_1 <- subset(wine, price > 0)
max(wines_over_1[['price']])`

[1] 3300

*Filtering to show wines from India*

`indian_wines <- subset(wine, country == 'India')
View(indian_wines)`

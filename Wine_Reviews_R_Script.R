# Project documentation

# Instruction to return all the values in the country vector
winemag_data_130k_v2[['country']]

# Class of column; returns the type of data in this vector; in this case, character
class(winemag_data_130k_v2[['country']])

# This query is meaningless, but was used as a test.  It asks to sum all the values in the points vector. Result: [1] 11495563
sum(winemag_data_130k_v2[['points']])

# Assign a friendlier name to the data frame; in this case, simply call it "wine."
wine <- winemag_data_130k_v2

# Determine the number of unique values in the country column, and then count how many there are. Result: [1] 44
wine_countries <- unique((wine[['country']]))
length(wine_countries)

# Determine the number of unique provinces in the table, and then count them.
wine_provinces <- unique((wine[['province']]))
length(wine_provinces)

# This instruction was meant to determine the maximum price in the table.  However, it returned an "NA" result.
max(wine[['price']])

# Knowing that there are prices in the field but also some blank/NA values, the code is revised to filter to wines with a value greater than 0, and then determine the maximum.
wines_over_1 <- subset(wine, price > 0)
max(wines_over_1[['price']])

# Determining the maximum value in the points vector.
max(wine[['points']])

# Determining the minimum value in the points vector.
min(wine[['points']])

# Determining how many wines have a rating of 100 points.  Result is 19, which matches the query in SQL.
wines_rated_100 <- subset(wine, points == 100)
length((wines_rated_100[['points']]))

# Determining how many wines have a rating of 80 points.  Result is 397, which matches the query in SQL.
wines_rated_80 <- subset(wine, points == 80)
length((wines_rated_80[['points']]))

# Determining how many unique countries are represented in the table.  Result is 44, which matches the query in SQL.
unique((wine[['country']]))
wine_countries <- unique((wine[['country']]))
length(wine_countries)

# Mean point score for table. Result is 88.44714
mean(wine[['points']])

# Determining max price for wines in this table. Because of NA values, need to create a subset where wine price is greater than 1. Result is 3300.
wines_over_1 <- subset(wine, price > 0)
max(wines_over_1[['price']])

# Filtering to show wines from India
indian_wines <- subset(wine, country == 'India')
View(indian_wines)
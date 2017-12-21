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

To gain familiarity in R, the following questions will be asked:
1. How do you assign a variable?
2. How do you perform a sum on a column?
3. How do you perform a mean on a column?
4. How do you filter?
5. How do you perform a sum/mean on a subset of data?

*Files*  
A subset of the wine data as well as an R file working with this data has been uploaded to my personal repo.  Zip file: winemag-data-130k-v2.csv; subset for quick scan: winemag-data-subset

# Project Background
__*Methodology:*__ The thought process behind this project involved taking a large data set and performing basic data operations via SQL and R to glean insights from the data set.  Starting in SQL, I began looking at the most basic asks: How many countries are represented in this data set? What are they? What is the max points given?  The minimum? I approached this data set with genuine curiosity about what I might find, and the SQL queries followed. Subsequent to feeling more comfortable in SQL, I then turned to R, with the intention of replicating all the SQL queries I had asked. Along the way, I became familiar with why tables and subsets are renamed in R for easier access/recall with further scripts.  There were many commonalities between the snippets.

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

Reference R function equivalents of SQL queries in [Wine_Reviews_R_Script.R](https://github.com/runjini/Sprint_3_Wine/blob/master/Wine_Reviews_R_Script.R) file provided.

### Helpful Links


[Double vs. integer](http://uc-r.github.io/integer_double): I saw col_double() for price and col_integer() for points.  "The two most common numeric classes used in R are integer and double (for double precision floating point numbers). R automatically converts between these two classes when needed for mathematical purposes.  In this case, it makes sense because the points are all integers, whereas the price could have cents, i.e. decimal with two floating digits.

[R data frame manipulation](https://www.r-bloggers.com/dataframe-manipulation-in-r-from-basics-to-dplyr/)

[Basic sum function in R](https://stackoverflow.com/questions/9676212/how-to-sum-all-values-of-a-column-of-in-a-data-frame)

[Subset instruction/function in R](https://www.statmethods.net/management/subset.html)

[Count unique values in a column in R](https://discuss.analyticsvidhya.com/t/count-number-of-distinct-values-in-a-column-of-a-data-table-in-r/1124)

[Clarifying syntax of "OR" statement in SQL](https://www.w3schools.com/sql/sql_and_or.asp)

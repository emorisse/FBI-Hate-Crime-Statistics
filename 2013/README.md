# Aggregated data across states from the [FBI Hate Crimes Report for 2013](https://www.fbi.gov/about-us/cjis/ucr/hate-crime/2013).

## Two tables were aggregated:  
###Table 13:  
> This table presents the data from those agencies that reported one or more hate crime incidents occurred in their respective jurisdictions during 1 or more quarters in 2013. The data are distributed by bias motivation and quarter.

###File Format

The data is encoded as UTF-8 text in comma-separated format. The columns in the dataset are defined as:

* State (string)
* Agency type (string)
* Agency name (string)
* Race (signed int64)
* Religion (signed int64)
* Sexual orientation (signed int64)
* Ethnicity (signed int64)
* Disability (signed int64)
* Gender (signed int64)
* Gender Identity (signed int64)
* 1st quarter (signed int64)
* 2nd quarter (signed int64)
* 3rd quarter (signed int64)
* 4th quarter (signed int64)
* Population (string)

###Table 14:  
> This table lists the agencies that indicated no incidents of hate crimes occurred in their respective jurisdictions during the quarter(s) in 2013 for which they submitted reports.

###File Format

The data is encoded as UTF-8 text in comma-separated format. The columns in the dataset are defined as:

* State (string)
* Agency type (string)
* Agency name (string)
* Q1 (signed int64)
* Q2 (signed int64)
* Q3 (signed int64)
* Q4 (signed int64)
* Population (string)

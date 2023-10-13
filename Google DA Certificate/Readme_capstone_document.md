> # Google Data Analytics Professional Certificate: Capstone

**Case Study 1: How Does a Bike-Share Navigate Speedy Success?**

by [Phattharachai Maichin](https://www.linkedin.com/in/phattharachai-m/)

Start date: 2023-10-06

Last edit: 2023-10-12
***
### Before start

I have recently completed the Google Data Analytics Professional Certificate program on Coursera. As part of this course, students are required to complete a data analysis case study to show the skills learned throughout the course and here is my capstone project. For this case study, I used excel and R programming for the data preparation and visualization analysis. Moreover, this project will be followed these steps to ensure its completion:
  * Follow the steps of the data analysis process: Ask, prepare, process, analyze, share, and act.
  * Follow the given guild in roadmap with:
      + Code, if needed on the step.
      + Guiding questions, with answers.
      + Key tasks, as a checklist.
      + Deliverable, as a checklist.
___
### Background

In this project, I am a junior data analyst who is working as part of the marketing team at Cyclistic, a bike-share company in Chicago. Since the company launched a successful bike-share offering in 2016, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Now, Cyclistic has three flexible pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Moreno, the director of marketing team, has set a goal that aimed to convert casual riders into annual members; however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and team members are interested in analyzing Cyclistic bike trip to identify trends. So, these insights will lead my team to design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve my recommendations.

Therefore, my task is to analyze Cyclistic historical bike trip data to provide information that will lead to data-driven decision.
***
### Ask
**Who're stakeholders:** 
 + Primary stakeholder: Cyclistic executive team as they will decide whether to approve the recommended marketing program)
 + Secondary stakeholder: Lily Moreno, the director of marketing and my manager, as she is responsible for the campaigns development to promote benefit to convert Cyclistic's casual riders to become annual members.

**My task**

As Moreno has assigned the first question to me: How do annual members and casual riders use Cyclistic bikes differently?

So, my business task is to determine the differences between annual members and casual riders and which marketing strategy will help to increase annual members.

```{text}
Case study roadmap - ask

'Guiding questing'
1) What is the problem you are trying to solve?
   The major goal is to identify the different of annual members and casual riders,
   using the data to develop a marketing plan to help convert casual riders into annual members.

2) How can your insights drive business decisions?
   The marketing team will use the findings to convert and convince casual riders to become more annual members.

'Key tasks'
[x] Identify the business task
[x] Consider key stakeholders

'Deliverable'
[x] A clear statement of the business task
```
### Prepare
I will use [Cyclistic's historical trip data](https://divvy-tripdata.s3.amazonaws.com/index.html) to analyze and identify trends. 
The data has been made available by Motivate International Inc. under this [license.](https://divvybikes.com/data-license-agreement) 
The data in the past 18 month (from January 2022 to June 2023) will be used with this project. 
```{text}
Case study roadmap - Prepare

'Guiding questing'
1) Where is your data located?
   In the trip data, the data stored in separate files for each month (for example, yyyymm-divy-tripdata).
   After download data to local computer, I stored it within the same folder "tripdata_202201_to_202306",
   so total files to work with are 18 files. 
2) How is the data organized?
   For each file, the data contains 13 column consistently as described below.
```
#### Table information
| **Column Number** | **Column Name** | **Description** |
|-------------------|-----------------|-----------------|
| 1      | ride_id  | unique id for each ride booking               |
| 2      | rideable_type  | type of bicycle used                    |
| 3      | started_at  | datetime data of the time when start trip  |
| 4      | ended_at  | datetime data of the time when finish trip   |
| 5      | start_station_name | name of the starting station        |
| 6      | start_station_id  | unique id of the starting station    |
| 7      | end_station_name  | name of the ending station           |
| 8      | end_station_id  | unique id of the ending station        |
| 9      | start_lat  | latitude of the starting station            |
| 10     | start_lng  | longitude of the starting station           |
| 11     | end_lat  | latitude of the ending station                |
| 12     | end_lng  | longitude of the ending station               |
| 13     | member_casual  | user type (casual or member)            |
```{text}
Case study roadmap - Prepare (continue)
3) Are there issues with bias or credibility in this data? Does your data ROCCC?
   The data also does `ROCCC` as it is reliable, original, comprehensive, current, and cited
   because the data is first-party data collected by Cyclist and up-to-date.
4) How are you addressing licensing, privacy, security, and accessibility?
   The data is open source and provided by the company with their license. Moreover, with the data-privacy,
   the data does not have any personal information.
5) How did you verify the data's integrity?
   All 18 files were examined and all of them were most consistent in both name of columns and
   data type throughout each file.
6) How does it help you answer your question?
   These data will be used to examine annual members and casual riders to determine
   if there is any insight behind the riders and bike usage.
7) Are there any problems with the data?
   In this stage, I think the data does have some problems like some parts of the information were incomplete.
   However, these data need to be clean before any future analysis and it would be great if there are more measurements
   such as user satisfaction.

'Key tasks'
[x] Download data and store it appropriately
[x] Identify how it's organized
[x] Sort and filter the data
[x] Determine the creaibility of the data

'Deliverable'
[x] A description of all data sources used
```
### Process
The copy of original data files are stored in the folder as shown in the picture. These files will be used and will be used throughout this project. The individual `CSV` files will be combined into one file to make it easier to manipulate and analyse by using `R` because each file have more than 100,000 row and to combine it in `Excel` was not suitable with large data.

#### This picture showed the copy of stored original files
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/0179d37b-b1fa-4161-bb0c-21a800780a61)

#### Documentation of cleaning or manipulation process of data
```{r}
# (Step 0) Prepare R-Environment before import each CSV files into R
## Install "tidyverse" package to manipulate data
install.packages("tidyverse")
## Call "tidyverse" package to use
library(tidyverse)

# (Step 1) Import each CSV files into R and store it in each dataframe and quick review the data structure of dataframe
## Import CSV with read.csv()
df2201 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202201-divvy-tripdata.csv")
df2202 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202202-divvy-tripdata.csv")
df2203 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202203-divvy-tripdata.csv")
df2204 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202204-divvy-tripdata.csv")
df2205 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202205-divvy-tripdata.csv")
df2206 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202206-divvy-tripdata.csv")
df2207 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202207-divvy-tripdata.csv")
df2208 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202208-divvy-tripdata.csv")
df2209 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202209-divvy-publictripdata.csv")
df2210 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202210-divvy-tripdata.csv")
df2211 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202211-divvy-tripdata.csv")
df2212 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202212-divvy-tripdata.csv")
df2301 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202301-divvy-tripdata.csv") 
df2302 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202302-divvy-tripdata.csv") 
df2303 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202303-divvy-tripdata.csv") 
df2304 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202304-divvy-tripdata.csv") 
df2305 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202305-divvy-tripdata.csv") 
df2306 <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\202306-divvy-tripdata.csv")

## Examine each dataframe by using head(), str(), or glimpse() to quick review data structure
glimpse(list(df2201, df2202, df2203, df2204, df2205, df2206, df2207, df2208
             , df2209, df2210, df2211, df2212
             , df2301, df2302, df2303, df2304, df2305, df2306))

## The second picture below showed two examples of glimpse() return (df2201 and df2202 data structure) that
## were examined throughout all dataframe which had the same data structure.
```
#### The first picture showed dataframe in R after import CSV files
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/c9969cbe-c2a4-48d3-bb2e-f90774348b50)
#### The second picture showed an example of dataframe structure in R
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/d3727343-0a83-4029-a92d-e4a12658dfec)
***

```{r}
# (Step 2) Combine each dataframe into one dataframe and store it as new dataframe
## combine by using `bind_rows()`
df_bike_unclean <- bind_rows(list(df2201, df2202, df2203, df2204, df2205, df2206, df2207, df2208
                                  , df2209, df2210, df2211, df2212
                                  , df2301, df2302, df2303, df2304, df2305, df2306))
## count total rows in df_bike_unclean
cat(paste("Total row in unclean dataframe:", nrow(df_bike_unclean), "rows \n"))
### The result showed that there are 8,058,176 rows in the original files.
```
#### The picture below showed the result after combining 18 dataframe into one dataframe
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/e3937c4d-7fdb-4535-acec-866d4fbd412b)
***

```{r}
# (Step 3) Cleaning data before any manipulate
## check data integrity by searching missing values is an important step for data integrity.
## Note: this function I created would print whether data is complete its rows or not.
completed_data <- function(dataset){
    percent_existData <- dataset %>% 
      complete.cases() %>%
      mean()*100
    nrowoffulldata <<- nrow(dataset)
    ## write the result
    cat(paste("Original data row:", nrowoffulldata, "\n"))
    cat(paste("Percent exist data:", as.character(percent_existData), "% \n"))
    if (percent_existData == 100){
      print("Percent exist data is 100%, the data is ready")
    } else {
      print("Percent exist data is not 100%, need to handle with incomplete data")
    }
}

## use the function
completed_data(df_bike_unclean)
### the result showed in the first picture of this section.

## as the result of completed data showed "Percent exist data: 99.8967756474914 %, it is not 100%, so need to clean data" that
## there were some missing values; however, there are many function in R that can be used to clean the data like drop, omit, replace,
## and other. In this project, I created to clean data by omit NULL in dataframe.
## Note: after use this function, the `cleanData` is the dataframe I will work with.
cleanbyomit <- function(dataset){  
  cleanData <<- dataset %>%         
    na.omit()
  nrowoffulldata <<- dataset %>%  ## used to update nrow of full data after omit
    na.omit() %>%
    nrow()
  ## write the result
  cat(paste("Total data rows before clean:", nrow(dataset), "rows
            \nSo, Remaining exist data rows:", as.character(nrowoffulldata), "rows"))
}

## use the function
cleanbyomit(df_bike_unclean)
### the result showed in the second picture of this section. now the remaining exist data rows are 8,049,858 rows

## there is another step to be done, it is checking and removing any duplicate records.
## I created a function that would print whether there are duplicate data or not.
## Note: after use this function, the `cleanData` is the dataframe I will work with.
cleanby_remove_duplicate <- function(dataset){  
  if(nrowoffulldata == nrow(distinct(dataset, .keep_all = TRUE))){
    print("There is no duplicate record.")
  }
  else {
  print("There is duplicate records.")
  cleanData <<- dataset %>%         # reassign dataframe to the same variable
    distinct(.keep_all = TRUE)
  nrowoffulldata <<- nrow(distinct(dataset, .keep_all = TRUE))  ## used to update nrow of full data after remove duplicate
  ## write the result
  cat(paste("Total data rows before clean by remove duplicate:", nrow(dataset), "rows
            \nSo, Remaining exist data rows:", as.character(nrowoffulldata), "rows"))
  }
}

## use the function
cleanby_remove_duplicate(cleanData)
### the result showed in the thrid picture of this section. there is no duplicate record in this dataframe.

## export to csv file as a complete cleaning dataframe
write.csv(cleanData, file = "cleaning_data_part1.csv", row.names = FALSE)
## Note: Any export or import dataframe, data structure of some columns may change. Do not forget to check it.
```
#### The first picture showed first step of cleaning dataframe by searching for missing values
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/4f9563b8-c50f-49f5-aac4-45f376ae7bac)
#### The second picture showed applying a process of cleaning dataframe by using user-defined function with `na.omit()` to remove missing values.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/38a9aacb-531e-430a-ab3d-3ecaa3d8092c)
#### The third picture showed applying a process of cleaning dataframe by using user-defined function with `distinct()` to remove duplicate values.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/1353b927-4ed4-4882-ac0d-3b3ed1d1d71c)
***


```{r}
# (Step 4) Manipulate data
## import cleaning data with read.csv()
cleanData <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\cleaning_and_manipulate_data\\cleaning_data_part1.csv")

## create new column to be used in deeper cleaning and analyzing
## `ride_length` by subtracting `start_at` from `ended_at` column (in HH:MM:SS Format)
## to calculate 'Time Difference' in HH:MM:SS Format, as_hms() function from the hms library will be used
## Note: the result will be stored as second unit, but show as HH:MM:SS
install.packages("hms")
library(hms)

## create new column named `ride_length` within clean dataframe
cleanData$rider_length <- as_hms(difftime(cleanData$ended_at, cleanData$started_at))

## create new columns by extract `started_at` datatime into each column named below
cleanData$date <- as.Date(cleanData$started_at)                 #Date data type
cleanData$month <- format(as.Date(cleanData$date), "%b")        #Character data type
cleanData$day <- format(as.Date(cleanData$date), "%d")          #Character data type
cleanData$year <- format(as.Date(cleanData$date), "%Y")         #Character data type
cleanData$day_of_week <- format(as.Date(cleanData$date), "%A")  #Character data type

## to review created columns
View(cleanData)
## the result showed in the first picture of this section.

## find and remove outliers
ggplot(data = cleanData, mapping = aes(x = member_casual, y = rider_length)) + 
  geom_boxplot() +
  theme_minimal() + 
  labs(title="Boxplot: Distribution of ride time in each membership type (data may include outliers)",
       subtitle = "during January 2022 and June 2023",
       x="Membership type",
       y="Ride time, hours : minutes : seconds",
       caption = "Resource: Motivate International Inc.") + 
  guides(fill = "none")

## find percentage
view_percentage <- function(){
  percentage <- quantile(cleanData$rider_length, probs = seq(0, 1, 1/20))
  for (i in 1:21){
    cat(paste("\nPercentage:", (as.double(i)*5)-5, ", ride time ", percentage[i]))
  }
}

## to review precentage
view_percentage()
## Both boxplot and percentage showed in the second and third picture

## Note: I noticed that there were outliers in the data, such as ride time is below than zero or too lower
##       and too higher than usual, these record lead the data will not useful due to unrealistic data
##       so, these data need to remove from dataframe.

## to remove data too lower than usual by filter at percentage 5%
cleanData <- cleanData[!(as.numeric(cleanData$rider_length) <= as.numeric(133)),] # 2 min 13 sec equal to 133 sec

## to remove data higher than usual
cleanData <- cleanData[!(as.numeric(cleanData$rider_length) >= as.numeric(2610)),] # 43min 30 sec equal to 2,610 sec

## remian rows, now the remaining exist data rows are 7,242,302 rows
cat(paste("Total remaining exist data rows are ", nrow(cleanData) ,"rows after clean\nby remove ride time below than 2 mintues 13 seconds and ride time higher than 43 mintues 30 seconds"))

## to review percentage again, there is no extreme outliers.
view_percentage()

## Boxplot: Distribution of ride time in each membership type (removed outliers)
ggplot(data = cleanData, mapping = aes(x = member_casual, y = rider_length)) + 
  geom_boxplot() +
  theme_minimal() + 
  labs(title="Boxplot: Distribution of ride time in each membership type (removed outliers)",
       subtitle = "during January 2022 and June 2023",
       x="Membership type",
       y="ride time, hours : minutes : seconds",
       caption = "Resource: Motivate International Inc.") + 
  guides(fill = "none")
## the result showed in the fourth picture of this section.

## export to csv file as a complete manipulated dataframe and it is ready for analysis.
write.csv(cleanData, file = "cleaning_data_part2.csv", row.names = FALSE)
## Note: Any export or import dataframe, data structure of some columns may change. Do not forget to check it.
```
#### The first picture showed viewing the dataframe with `View()`.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/32aab755-041b-45e0-97b3-3d2a53df84c8)
#### The second picture showed "Boxplot about the distribution of ride time in each membership type (data may include outliers)".
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/5235d082-457b-48c9-abc3-0f97f3c8aff4)
#### The third picture showed the percentage of ride time.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/22612916-db62-45c1-a830-19adb15b927b)
#### The fourth picture showed "Boxplot about the distribution of ride time in each membership type (removed outliers)".
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/ff9920f9-d453-4f1d-a700-cbfb8a97331d)


```{text}
Case study roadmap - Process

'Guiding questing'
1) What tools are you choosing and why?
   In this stage, `Excel` was first used, but it did not work because all the file had more over million rows,
   so 'R' then was used instead to process data before analyzing phase.
2) Have you ensured your data's integrity?
   I examined both columns' name and data structure before and after any changes that had been made during cleaning and manipulate process.
3) What steps have you taken to ensure that your data is clean?
   Missing and duplicate values were removed, and also the time dates data was formatted.
4) How can you verify that your data is clean and ready to analyze?
   The processes in this section showed all cleaning and manipulate process to ensure that the data is ready to analyze.
5) Have you documented your cleaning process so you can review and share those results?
   The cleaning and manipulate process has been documented above with R-code.

'Key tasks'
[x] Check the data for errors
[x] Choose your tools
[x] Transform the data so you can work with it effectively
[x] Document the cleaning process

'Deliverable'
[x] Documentation of any cleaning or manipulation of data
```
### Analyze
#### Documentation of Analyze process
```{r}
# (step 0) import complete manipulated data with read.csv()
cleanData <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\cleaning_and_manipulate_data\\cleaning_data_part2.csv")

## after loading complete manipulated data into R again, it need to be checked data structure again
## because data structure of some data type may change during exporting file
str(cleanData)
## the first and second picture showed that there are some data structure have changed
## before analyze let change to original data structure

## the first and second picture showed that there are some data structure have changed
## before analyze let change to original data structure
cleanData$day <- as.character(cleanData$day)
cleanData$year <- as.character(cleanData$year)
cleanData$date <- as.Date.character(cleanData$date)
cleanData$rider_length <- as_hms(difftime(cleanData$ended_at, cleanData$started_at))

## (step 1 - analyze) find differences between member tpye (member vs casual) 
## calculate statistical analysis of each member type
## find count, total, min, max, average, median, mode, standard deviation
cal_each_membertype <- cleanData %>% 
                          group_by(member_casual) %>%
                          summarise(sum_ride_length = as_hms(as.numeric(sum(rider_length))),
                                    min_ride_length = as_hms(as.numeric(min(rider_length))),
                                    max_ride_length = as_hms(as.numeric(max(rider_length))),
                                    avg_ride_length = as_hms(as.numeric(mean(rider_length))),
                                    median_ride_length = as_hms(as.numeric(median(rider_length))),
                                    sd_ride_length = as_hms(as.numeric(sd(rider_length))),
                                    count_ride = n())

## to find mode, use mlv() function in `modeest` packages
install.packages('modeest') 
library(modeest)

## function to find mode
find_mode <- function(){
  ## filter into each group and find mode (popular day of week) in each group
  filter_only_casual <<- cleanData %>%
    filter(cleanData$member_casual == 'casual')
  filter_only_member <<- cleanData %>%
    filter(cleanData$member_casual == 'member')
  mode_causal <<- mlv(filter_only_casual$day_of_week)
  mode_member <<- mlv(filter_only_member$day_of_week)
  cat(paste("Popular day of week:
    mode of causal: ", mode_causal, "
    mode of member: ", mode_member))
}

## use function
find_mode()

## summary result
cat(paste(
  "All time units are in 'hours : minutes : seconds'
  Casual:
      total user: ", cal_each_membertype$count_ride[1], "users
      total ride time: ", cal_each_membertype$sum_ride_length[1], "
      shortest ride time:", cal_each_membertype$min_ride_length[1], "
      longest ride time:", cal_each_membertype$max_ride_length[1], "
      average ride time:", cal_each_membertype$avg_ride_length[1], "
      median ride time:", cal_each_membertype$median_ride_length[1], "
      mode (popular day of week):", mode_causal, "
      standard deviation ride time:", cal_each_membertype$median_ride_length[1], "
  Member: 
      total user: ", cal_each_membertype$count_ride[2], "users
      total ride time: ", cal_each_membertype$sum_ride_length[2], "
      shortest ride time:", cal_each_membertype$min_ride_length[2], "
      longest ride time:", cal_each_membertype$max_ride_length[2], "
      average ride time:", cal_each_membertype$avg_ride_length[2], "
      median ride time:", cal_each_membertype$median_ride_length[2], "
      mode (popular day of week):", mode_member, "
      standard deviation ride time:", cal_each_membertype$median_ride_length[2]))
## result, as shown in the third picture
```
#### The first picture showed the dataframe structure before export to CSV file.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/1506a744-c671-4d81-8259-9570b3a81948)
#### The second picture showed the dataframe structure after import the CSV file into R.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/1260b71a-6596-4d86-938e-30d1248ddeb4)
#### The third picture showed the preliminary summary by basic statistic.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/2441fee0-719d-4ca5-898d-693fcc5ae0ac)


```{text}
Case study roadmap - Analyze

'Guiding questing'
1) How should you organize your data to perform analysis on it?
   I should split data into two groups by its member type because the main question is how different between two groups of member.
2) Has your data been properly formatted?
   Yes, my data had been properly formatted as showed in the document that every step has rechecked like its data structure or its performance.
3) What surprises did you discover in the data?
   There was a surprise that even causal users had a number of membership lower than member users,
   but they spent time with average riding time as close as member users rider (around 10-15 minutes).
4) What trends or relationships did you find in the data?
   From the data itself, each type of member had their own need like popular day of week, causal user perfers to ride
   on saturday and member user perfers to ride on thrusday. Moreover, causal users counted as only 60% of member users.
5) How will these insights help answer your business questions?
   This insight will help to answer business questions by providing my team with relevant data, analysis and recommendations
   based on how they ride diffenently. This will lead marketing team to better understand of user.

'Key tasks'
[x] Aggregate your data so it's useful and accessible
[x] Organize and format your data
[x] Perform calculations
[x] Identify trends and relationships

'Deliverable'
[x] A summary of your analysis
```
### Share
#### Documentation of visualization process
```{r}
# (step 0) import complete manipulated data with read.csv()
cleanData <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\cleaning_and_manipulate_data\\cleaning_data_part2.csv")

## cleanData <- read.csv("C:\\Users\\phatt\\Desktop\\tripdata_202201_to_202306\\cleaning_and_manipulate_data\\cleaning_data_part2-try.csv")

## before visualize data let change to original data structure
cleanData$day <- as.character(cleanData$day)
cleanData$year <- as.character(cleanData$year)
cleanData$date <- as.Date.character(cleanData$date)
cleanData$rider_length <- as_hms(difftime(cleanData$ended_at, cleanData$started_at))

# to sort data by day of week or month, data need to format
cleanData$day_of_week <- factor(cleanData$day_of_week, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"),
                                                       labels = c("Mon", "Tues", "Wed", "Thurs", "Fri", "Sat", "Sun"))

cleanData$month <- factor(cleanData$month, levels=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))

## Main question: the differences between annual members and casual riders  
##########################################################################

# What was total number of user in each membership type during January 2022 and June 2023?
# Chart 1 - Total number of user based on their membership type, showed in the first picture
ggplot(data = cleanData, mapping = aes(x = member_casual, fill = member_casual)) + 
  geom_bar() +
  theme_minimal() + 
  labs(title="Chart 1 - Total number user based on their membership type",
       subtitle = "during January 2022 and June 2023",
       x="Membership type",
       y="Number of user",
       caption = "Resource: Motivate International Inc.") + 
  guides(fill = "none")

# Chart 1.1 - Total number of user based on their membership type by month, showed in the second picture
cleanData %>% 
  group_by(member_casual, month) %>% 
  summarise(count = n()) %>%
  ggplot(mapping = aes(x = month, y = count, fill = member_casual)) +
  geom_col(position = "dodge") +
  facet_wrap(~member_casual) +
  theme_minimal() + 
  scale_fill_brewer(palette = "Blues") +
  labs(title="Chart 1.1 - Total number of user based on their membership type by month",
       subtitle = "during January 2022 and June 2023",
       x="Membership type",
       y="Number of user",
       caption = "Resource: Motivate International Inc.")  + 
  guides(fill = "none")


# Which day in a week did each type of user prefer to ride?
# Chart 2 - Average ride time based on their membership type during a week, showed in the third picture
cleanData %>% 
  group_by(member_casual, day_of_week) %>% 
  summarise(number_of_riders = n(), 
            average_ride_time = as_hms(as.numeric(mean(rider_length)))) %>%
  ggplot(mapping = aes(x = day_of_week, y = average_ride_time, fill = member_casual)) + 
  geom_col(position = "dodge") +
  theme_minimal() + 
  scale_fill_brewer(palette = "Blues") +
  labs(title="Chart 2 - Average ride time based on their membership type during a week",
       x="Day of week",
       y="Average ride time, minutes",
       caption = "Resource: Motivate International Inc.")

# Chart 2.1 - Average ride time based on their membership type during a year, showed in the fourth picture
cleanData %>% 
  group_by(member_casual, month, day_of_week) %>% 
  summarise(number_of_riders = n(), 
            average_ride_time = as_hms(as.numeric(mean(rider_length)))) %>%
  ggplot(mapping = aes(x = day_of_week, y = average_ride_time, fill = member_casual)) + 
  geom_col(position = "dodge") +
  theme_minimal() +
  scale_fill_brewer(palette = "Blues") +
  labs(title="Chart 2.1 - Average ride time based on their membership type during a year",
       x="Day of week",
       y="Average ride time, minutes",
       caption = "Resource: Motivate International Inc.") + 
  facet_wrap(~month)

# Were there any change in percent of user that became a member?
# Chart 3 - Percent of user based on their membership type in year 2022 and 2023, showed in the fifth picture
cleanData %>%
  group_by(year, member_casual) %>%
  summarise(count = n()) %>%
  mutate(percent = count / sum(count)) %>%
  ggplot(aes(x = year, y = percent, fill = member_casual)) + 
  geom_col(position = "fill") +
  theme_minimal() + 
  scale_fill_brewer(palette = "Blues")  + 
  labs(title="Chart 3 - Percent of user based on their membership type",
       subtitle = "in year 2022 and 2023",
       x="Year",
       y="Percent of users, %",
       caption = "Resource: Motivate International Inc.") +
  geom_text(aes(label = paste0(round(100 * percent, 1), "%")), 
            position = position_fill(vjust = 0.5), size = 3)

# Which type of bike did users prefer to use?
# Chart 4 - Percent of user based on their membership type in each type of bike, showed in the sixth picture
cleanData %>%
  group_by(rideable_type, member_casual) %>% 
  summarise(count = n()) %>% 
  mutate(percent = count/sum(count)) %>%
  ggplot(mapping = aes(x = rideable_type, y = percent, fill = member_casual)) + 
  geom_col(position = "fill") +
  coord_flip() +
  theme_minimal() + 
  scale_fill_brewer(palette = "Blues") +
  labs(title="Chart 4 - Percent of user based on their membership type",
       subtitle = "in each type of bike",
       x="Type of bike",
       y="Percent of user",
       caption = "Resource: Motivate International Inc.") +
  geom_text(aes(label = paste0(round(100 * percent, 1), "%")), 
            position = position_fill(vjust = 0.5), size = 3)

# What were trend of bike ride in a day?
# Chart 5 - Trend of bike ride in a day based on their membership type, showed in the seventh picture
cleanData %>%
  mutate(start_hour = strftime(started_at, "%H")) %>%
  ggplot(mapping = aes(start_hour, fill=member_casual)) +
  geom_bar() +
  facet_wrap(~ day_of_week) + 
  theme_minimal() + 
  scale_fill_brewer(palette = "Blues")  + 
  labs(title="Chart 5 - Trend of bike ride in a day based on their membership type",
       subtitle = "in year 2022 and 2023",
       x="24-hour clock",
       y="Number of users",
       caption = "Resource: Motivate International Inc.")


```
#### Visual in this section
##### The first picture, chart 1 - Total number user based on their membership type.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/1f8c2a81-8f24-4c74-a639-ef2e6f71fe31)
##### The second picture, chart 1.1 - Total number of user based on their membership type by month.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/97086a11-b23b-456c-bb30-aaa4db074265)
##### The third picture, chart 2 - Average ride time based on their membership type during a week.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/ccf7a4a3-915d-4ab1-868b-1c98fb2bd82f)
##### The fourth picture, chart 2.1 - Average ride time based on their membership type during a year.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/857b51e0-4ff2-4307-bb2d-531d26b64142)
##### The fifth picture, chart 3 - Percent of user based on their membership type.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/9a7d9252-6273-430f-b73e-989dd5f35009)
##### The sixth picture, chart 4 - Percent of user based on their membership type in each type of bike.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/cdf551a3-44f3-4164-b727-3759fe8a6cef)
##### The seventh picture, chart 5 - Trend of bike ride in a day based on their membership type.
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/da78292a-8aee-4ca6-8e50-07defa9910a1)


```{text}
Case study roadmap - Share

'Guiding questing'
1) Were you able to answer the question of how annual members and casual riders use Cyclistic bikes differently?
   Yes, I was able to answer the main question that based on the data, there were many differences between annual members and casual riders.
2) What story does your data tell?
   From the findings, the casual riders had more average riding time than the member riders around 3 minutes. The popular day that casual riders prefer to ride is Saturday
   as it may be their weekend and for the member riders is Thursday as it is their weekday that they have to go to work. The popular month is June for both groups as
   it may be their summer and have more time to ride. Overall, the trend of riding in chart 5 showed that both membership type usually ride between 8 AM to 8 PM.
   There is no members who ride a docked bike as shown in chart 4. Moreover, members increased by 6% from 2022 to 2023 as shown in chart 3.
3) How do your findings relate to your original question?
   It helped us to better understand the different ride behaviors and the need of annual members and casual riders to ride in a day.
4) Who is your audience? What is the best way to communicate with them?
   My audience is the secondary stakeholders as mentioned above.
   They are Lily Moreno and the Cyclistic marketing team.
5) Can data visualization help you share your findings?
   Yes, sharing insight through data visualization helps audiences keep focus and leads to data-driven desicion.
6) Is your presentation accessible to your audience?
   Yes, the graphs have been made using plain color with contrast, and corresponding labels.

'Key tasks'
[x] Determine the best way to share your findings
[x] Create effective data visualizations
[x] Present your findings
[x] Ensure your work is accessible

'Deliverable'
[x] Supporting visualizations and key findings
```
### Act
The act phase would be done with our stakeholders (Lily Moreno and the Cyclistic marketing team). 
The top three recommendations for the marketing team as list below:
   * Casual riders usually take a ride on weekend, so if our marketing team provide special discount on those who ride on weekend.
     This may lead them to become annual members with Cyclistic.
   * A rewards program that is exclusive to annual members and is dependent on riding time to encourage casual riders to join and qualify for the prizes.
   * A campaign or digital marketing is to increase and hold annual members, especially in less popular months (October to January, it is winter season),
     for example, reducing the price for annual plan membership or publishing other benefits at the docked bike as they were used by casual riders.
   

```{text}
Case study roadmap - Act

'Guiding questing'
1) What is your final conclusion based on your analysis?
   There is an opportunity to turn casual riders to annual members because they were likely to ride more than annual members
   if marketing or digital marketing campaign is interesting enough to them to become more benifits, for example,
   they usual take a ride on weekend, so if our marketing team provide special discount on those who ride on a weekend.
   This may lead them to become annual members with Cyclistic.
2) How could your team and business apply your insights?
   They could use insight that based on popular day or month that casual riders took a ride to provide special offers
   that may lead them to become annual members.
3) What next steps would you or your stakeholders take based on your findings?
   It is like a long run, further analysis would be very helpful to better understand other aspects of casual riders
   which can lead the marketing team to think about useful strategies to increase annual members.
4) Is there additional data you could use to expand on your findings?
   Yes, additional data that would be useful to expand the insight may be climate data, pricing plan data, historical marketing campaigns, and others.

'Key tasks'
[x] Create your portfolio
[x] Add your case study
[x] Practice presenting your case study to a friend or family member

'Deliverable'
[x] Your top three recommendations based on your analysis
```
### Conclusion
I would like to thank the creators of the Google Data Analytics Professional Certificate for giving me the skills, opportunities, guidelines, and useful capstone project to be my first step in data analyst world.

> # [In process] Google Data Analytics Professional Certificate: Capstone

**Case Study 1: How Does a Bike-Share Navigate Speedy Success?**

By [Phattharachai Maichin](https://www.linkedin.com/in/phattharachai-m/)
2023-10-06

---
### Before start

I have recently completed the Google Data Analytics Professional Certificate program on Coursera. As part of this course, students are required to complete a data analysis case study to show the skills learned throughout the course and here is my capstone project. For this case study, I used excel and R programming for the data preparation and visualization analysis. Moreover, this project will be followed these steps to ensure its completion:
  * Follow the steps of the data analysis process: Ask, prepare, process, analyze, share, and act.
  * Follow the given guild in roadmap with:
      + Code, if needed on the step.
      + Guiding questions, with answers.
      + Key tasks, as a checklist.
      + Deliverable, as a checklist.
***
### List of contents


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


![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/0179d37b-b1fa-4161-bb0c-21a800780a61)

#### Documentation of cleaning or manipulation process of data
```{r}
# (Step 0) Prepare R-Environment before import each CSV files into R
## Install "tidyverse" package to manipulate data
install.packages("tidyverse")
## Call "tidyverse" package to use
library(tidyverse)
```
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/004adc7f-beb5-4e1c-827d-a66774f91aab)
***

```{r}
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
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/c9969cbe-c2a4-48d3-bb2e-f90774348b50)
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
### the result showed that there are 8,058,176 rows in the original files.
```
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
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/4f9563b8-c50f-49f5-aac4-45f376ae7bac)
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/38a9aacb-531e-430a-ab3d-3ecaa3d8092c)
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

## Note: when working with datetime, must check if difftime is below zero or not, 
## or it is less than certain observed values like if it is less than 3 minutes, 
## the data record will not useful due to user usage time is quite low and seem unrealistic.
## so, these data need to remove from dataframe
cleanData <- cleanData[!(as.numeric(cleanData$rider_length) < as.numeric(180)),]
cat(paste("Total data rows before manipulate:", as.character(nrowoffulldata), "rows.
          \nTotal remaining exist data rows after clean by remove time below than", round(180/60.0,1) , "minutes: ", nrow(cleanData) ,"rows."))
## the result showed in the second picture of this section. now the remaining exist data rows are 7,381,001 rows

## export to csv file as a complete manipulated dataframe and it is ready for analysis.
write.csv(cleanData, file = "cleaning_data_part2.csv", row.names = FALSE)
## Note: Any export or import dataframe, data structure of some columns may change. Do not forget to check it.
```
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/32aab755-041b-45e0-97b3-3d2a53df84c8)
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/5ba246b1-2a79-44ac-8772-529234e4b0ea)


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
```{r}
# Analyze process

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

## 1) find the amount of each member type (between member vs casual)
amount_each_membertype <- cleanData %>% 
                            select(member_casual) %>%
                            group_by(member_casual) %>%
                            summarise(count_member = n())

## result, as shown in the thrid picture
cat(paste("Total casual: ", amount_each_membertype$count_member[1], "memberships\nTotal member: ", amount_each_membertype$count_member[2], "memberships"))

## 2) calculate statistical analysis of each member type
## find total, min, max, average, median, mode, standard deviation
cal_each_membertype <- cleanData %>% 
                          group_by(member_casual) %>%
                          summarise(sum_rider_length = as_hms(as.numeric(sum(rider_length))),
                                    min_rider_length = as_hms(as.numeric(min(rider_length))),
                                    max_rider_length = as_hms(as.numeric(max(rider_length))),
                                    avg_rider_length = as_hms(as.numeric(mean(rider_length))),
                                    median_rider_length = as_hms(as.numeric(median(rider_length))),
                                    sd_rider_length = as_hms(as.numeric(sd(rider_length))))
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
  "All units are in 'hours : minutes : seconds', except for `mode`\n
  Casual: 
      total rider time: ", cal_each_membertype$sum_rider_length[1], "
      minimum rider time:", cal_each_membertype$min_rider_length[1], "
      maximum rider time:", cal_each_membertype$max_rider_length[1], "
      average rider time:", cal_each_membertype$avg_rider_length[1], "
      median rider time:", cal_each_membertype$median_rider_length[1], "
      mode (popular day of week):", mode_causal, "
      standard deviation rider time:", cal_each_membertype$median_rider_length[1], "
  Member: 
      total rider time: ", cal_each_membertype$sum_rider_length[2], "
      minimum rider time:", cal_each_membertype$min_rider_length[2], "
      maximum rider time:", cal_each_membertype$max_rider_length[2], "
      average rider time:", cal_each_membertype$avg_rider_length[2], "
      median rider time:", cal_each_membertype$median_rider_length[2], "
      mode (popular day of week):", mode_member, "
      standard deviation rider time:", cal_each_membertype$median_rider_length[2]))
## result, as shown in the fourth picture
```
Before export
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/3488e59e-53f8-42b5-a5bb-07db5cdd5b0c)
After import again
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/e0aa81d7-8b88-4e1b-89a5-c09181478919)

![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/28d78299-1d9d-49bd-a3b8-4399197013ea)
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/20190303-9c09-4c7b-b214-f12e81121600)


```{text}
Case study roadmap - Analyze

'Guiding questing'
1) How should you organize your data to perform analysis on it?
2) Has your data been properly formatted?
3) What surprises did you discover in the data?
4) What trends or relationships did you find in the data?
5) How will these insights help answer your business questions?

'Key tasks'
[] Aggregate your data so it's useful and accessible
[] Organize and format your data
[] Perform calculations
[] Identify trends and relationships

'Deliverable'
[] A summary of your analysis
```
### Share








```{text}
Case study roadmap - Share

'Guiding questing'
1) Were you able to answer the question of how annual members and casual riders use Cyclistic bikes differently?
2) What story does your data tell?
3) How do your findings relate to your original question?
4) Who is your audience? What is the best way to communicate with them?
5) Can data visualization help you share your findings?
6) Is your presentation accessible to your audience?

'Key tasks'
[] Determine the best way to share your findings
[] Create effective data visualizations
[] Present your findings
[] Ensure your work is accessible

'Deliverable'
[] Supporting visualizations and key findings
```
### Act








```{text}
Case study roadmap - Act

'Guiding questing'
1) What is your final conclusion based on your analysis?
2) How could your team and business apply your insights?
3) What next steps would you or your stakeholders take based on your findings?
4) Is there additional data you could use to expand on your findings?

'Key tasks'
[] Create your portfolio
[] Add your case study
[] Practice presenting your case study to a friend or family member

'Deliverable'
[] Your top three recommendations based on your analysis
```

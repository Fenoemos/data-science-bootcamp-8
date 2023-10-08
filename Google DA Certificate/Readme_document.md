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


```{r}


```


```{r}

# Then, combine each dataframe into one dataframe by using `bind_rows()` and store it as new dataframe
df_bike_unclean <- bind_rows(list(df2201, df2202, df2203, df2204, df2205, df2206, df2207, df2208
                                  , df2209, df2210, df2211, df2212
                                  , df2301, df2302, df2303, df2304, df2305, df2306))

# Next, cleaning data
# check data integrity by searching missing values is an important step for data integrity.
## this function I created would print whether data is complete its rows or not.
data_inegrity <- function(dataset){
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
    print("Percent exist data is not 100%, need to clean data")
  }
}
# use the function
data_inegrity(df_bike_unclean)
```
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/acc8822c-6ec9-4864-8d58-2d4fe4389249)

```{r}
# As it showed that Percent exist data: 99.8967756474914 % and "Percent exist data is not 100%, need to clean data"
# So, other function I created to clean data by omit NULL in dataframe.
## There are many option to clean like drop, omit, replace, and other,
## So in this project 'omit' method will be applied to the dataframe.
cleanbyomit <- function(dataset){  
  cleanData <<- dataset %>%         
    na.omit()
  nrowoffulldata <<- dataset %>%  ## used to update nrow of full data after omit
    na.omit() %>%
    nrow()
  cat(paste("Total data rows before clean:", nrow(dataset),
            "\nSo, Remaining exist data rows:", as.character(nrowoffulldata)))
}

# use the function, after this cleanData is the dataframe I will work with.
cleanbyomit(df_bike_unclean)
```
![image](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/1c77ff11-b976-4d6c-ac57-bff68bee2a52)

```{r}
# The total data remaining are 8,049,858 rows
# Next, data manipulate
## create a column `ride_length` by subtracting the column `started_at` from the column `ended_at` and format as HH:MM:SS



```
```{r}
#
```
```{r}
#
```
```{r}
#
```



```{text}
Case study roadmap - Process

'Guiding questing'
1) What tools are you choosing and why?
   In this stage, `Excel` was first used, but it did not work because all the file had more over million rows,
   so 'R' then was used instead to process data before analyzing phase.
2) Have you ensured your data's integrity?
3) How can you verify that your data is clean and ready to analyze?
4) Have you documented your cleaning process so you can review and share those results?

'Key tasks'
[] Check the data for errors
[] Choose your tools
[] Transform the data so you can work with it effectively
[] Document the cleaning process

'Deliverable'
[x] Documentation of any cleaning or manipulation of data
```
### Analyze








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

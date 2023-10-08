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
<img src="[https://user-images.githubusercontent.com/link-to-your-image.png](https://github.com/Fenoemos/data-science-bootcamp-8/assets/145377446/d0106d8a-8e0b-4d55-8d82-bb208373f0c4)" width="200" />





```{text}
Case study roadmap - Process

'Guiding questing'
1) What tools are you choosing and why?
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

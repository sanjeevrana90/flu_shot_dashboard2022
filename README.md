# Flu Shots Dashboard Project for 2022

## Tableau Screenshot
![Immunization Dashboard Screenshot](https://github.com/sanjeevrana90/flu_shot_dashboard2022/assets/122264554/a4471bce-69e1-4979-a05c-339d7400785e)

Introduction
In this project, we aim to create a comprehensive flu shots dashboard for the year 2022. The dashboard will provide insights into the distribution of flu shots among patients based on various criteria such as age, race, county, and overall statistics. Additionally, it will display a running total of flu shots administered throughout the year, the total number of flu shots given, and a list of patients who received the flu shots.

Data Sources
We will be using data from two main tables: patients and immunizations. The patients table contains patient demographics, and the immunizations table includes information about immunization events.

Step 1: Identifying Active Patients
To ensure that we only include patients who were active at our hospitals, we create a common table expression (CTE) named active_patients. This CTE filters patients who had encounters between January 1, 2020, and December 31, 2022, were not deceased, and were at least 6 months old by December 31, 2022.

Step 2: Flu Shot Data for 2022
Next, we create another CTE called flu_shot_2022 to gather information about flu shots administered in 2022. We select patients who received a flu shot with the code '5302' within the specified date range (January 1, 2022, to December 31, 2022) and aggregate their data to find the earliest flu shot date.

Step 3: Building the Dashboard
Now, we construct the main query to generate the flu shots dashboard. We retrieve various patient attributes such as birthdate, race, county, first name, last name, and unique identifiers. We also join the flu_shot_2022 CTE to indicate whether each patient received a flu shot in 2022 ('Yes' or 'No') and provide the earliest flu shot date if applicable.

The query filters out patients who are not in the list of active patients obtained from the active_patients CTE.

Dashboard Components
The dashboard will comprise the following components:

1. Total Percentage of Patients Getting Flu Shots
Stratified by age, race, county, and overall.
These percentages will be calculated based on the total number of patients who received flu shots and the total number of active patients.
2. Running Total of Flu Shots
A visual representation of the cumulative number of flu shots administered throughout 2022.
It will show the trend of flu shot administration over time.
3. Total Number of Flu Shots Given
A single number indicating the total count of flu shots administered in 2022.
4. List of Patients and Flu Shot Status
A table listing patients' attributes and indicating whether they received a flu shot in 2022.
Patients will be categorized as 'Yes' or 'No' based on their flu shot status.
Conclusion
The flu shots dashboard for 2022 provides a comprehensive overview of flu shot administration among active patients. It offers insights into the distribution of flu shots based on age, race, and county, along with an overall perspective. The running total graph and total flu shot count give a clear picture of the vaccination trend throughout the year. Additionally, the patient list with flu shot status helps identify individuals who received the vaccination. This dashboard facilitates data-driven decision-making and enhances understanding of flu shot distribution patterns.

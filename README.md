# World_Happiness_Quotient


Data Exploration and Preparation
Data Description
The data was obtained from the World Happiness Report (https://worldhappiness.report/ed/2019/) which is based on the GWP. The original data includes 26 variables and 1,704 records.
Data Decisions and Clean-Up
Prior to analyses we made the following decisions:
● We limited our analyses to include years 2014-2018
● We identified that certain predictors had a large number of missing data and recognizing that most of the models cannot handle missing data, we eliminated 12 of the variables
● Life ladder, also known as the happiness score, was selected as the dependent variable
The following variables were considered in our analyses:

World Happiness Score (LIFE_LADDER):
This is also referred to as the life ladder and represents the national average score to the question of life evaluations

Log GDP per capita (LOG_GDP):
This is the log of GDP for each country. Forecasts are used for 2018 figures

Social support (SOC_SUPPORT):
This is the national average of the binary responses to the question on social support

Healthy life expectancy at birth (LIFEEXPECT_BIRTH):
Healthy life expectancies at birth are based on data extracted from WHO data repository

Freedom to make life choices (FREEDOM):
This is the average of responses to the question on satisfaction/dissatisfaction on freedom

Generosity (GENEROSITY):
Generosity is the residual of regressing national average of response to the GWP question “Have you donated money to a charity in the past month?” on GDP per capita

Perception of corruption (PERC_CORRUPT):
The measure of the average to two survey questions related to corruption

Positive affect (POS_AFFECT):
The average of three positive affect measures in GWP: happiness, laugh and enjoyment

Negative affect (NEG_AFFECT):
The average of three negative affect measures in GWP: worry, sadness and anger

Confidence in national government (CONFIDENCE_NATGOVT):
This is the confidence in national government measured by Gallup’s National Institutions Index

Democratic quality (DEM_QUALITY):
These two measures are based on 30 individual data sources that look at the following six dimensions: Voice and Accountability, Political Stability and Absence of Violence, Government Effectiveness, Regulatory Quality, Rule of Law, Control of Corruption. The average of the first two measures is an indicator of democratic quality and the other four is an indicator of delivery quality

Delivery Quality (DEL_QUALITY)

GINI Index (GINI_INDEX):
This indicator is based on primary household survey data obtained from government statistical agencies and World Bank country departments

GINI of household income (GINI_HHINC):
This variable is obtained using survey data from respondents on household income and then converting them to international dollars using purchasing power parity

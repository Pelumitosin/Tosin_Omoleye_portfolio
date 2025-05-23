**Bank Marketing Analysis Campaign Report**

**Introduction**\- This report is a summary of the analysis of data set that contains customer data from a bank’s marketing campaign analysis to identify key demographic and behavioural factors influencing campaign success. The analysis examines variables such as age, occupation, contact method and campaign frequency.

**Background**\- As earlier said, the bank launched a marketing campaign to encourage loan subscriptions. The goal is to identify which customer demographic characteristics are associated with positive campaign responses.

Some business questions based on the dataset include.

- Which communication method was most effective in terms of loans.
- What months achieved the highest loans and subscriptions.
- What is the educational level of clients who took the most loans and subscribed the most.
- What is the marital status and age group of clients as regards loans.
- What are the most represented occupations in terms of loans.
- Is there a correlation between client characteristics and response outcome?

**Dataset Overview**

The dataset contains 4,521 customer records and 14 columns.

Description of key variables- the variables in the dataset include

**Age, occupation, marital status, educational level**

**Bank account balance**

**Call duration**

**Campaign**\- number of contacts during the campaign

**Subscriptions**\- whether the customers subscribed to the loans

There were no missing values in the dataset.

**Data cleaning and preparation**

**Data cleaning**\- the dataset was checked for duplicates, missing values, and empty cells. It was thereafter duplicated as best practice before analysis.

**Data transformation** – a column named- ‘Grouped Age’ categorized as young (≤ 35), middle-aged (36-60), and old (>60) was added to the dataset for analysis purpose. An ID column for representing unique values was also added. I converted the subscription column into a numerical column for correlation analysis. It was formatted as a table and converted to a pivot table for in-depth analysis. The subscription column was converted to numbers for recategorization and encoding.

**Descriptive statistics-**

The average age was 40 years with a range of 18-95 years. Most customers had positive account balance with a few in red. Calls that were short (<1 minute) were most frequent. The median number of contacts per client was 2.

**Tables and charts**\- bar charts were used for categorical columns including occupation, mode of contact, and pie charts for proportions.

**Correlation analysis** showed a positive relationship between age and account balance and between campaign and subscription rate. Education and occupation appeared to positively influence subscription rates.

**Insights and interpretation**\-middle- aged clients subscribed more than younger or older ones, clients in management, and self-employed roles responded better. Longer call duration did not necessarily lead to more subscriptions.

**Recommendations** –based on the analysis. The recommendations are the following;

- The bank should prioritize the middle-aged for future campaigns.
- Focus on short but impactful calls rather than long calls.
- Create tailored campaigns and personalized interventions for middle-aged professionals.

**Conclusion**\- The analysis showed that customers’ demographic characteristics has a role to play in influencing campaign success. By targeting specific segments and refining communication strategies, future campaigns can be more efficient.

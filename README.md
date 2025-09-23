# End-to-End-Walmart-Retail-Sales-SQL-Analysis

# Walmart Data Analysis: End-to-End SQL + Python Project

## Project Overview

![Project Pipeline](https://github.com/najirh/Walmart_SQL_Python/blob/main/walmart_project-piplelines.png)


This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We utilize Python for data processing and analysis, SQL for advanced querying, and structured problem-solving techniques to solve key business questions.

---

## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Jupyter Notebook, Python, SQL (MySQL and PostgreSQL)
   - **Goal**: Create a structured workspace within Jupyter Notebook and organize project folders for smooth development and data handling.

### 2. Set Up Kaggle API
   - **API Setup**: Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.
   - **Configure Kaggle**: 
      - Place the downloaded `kaggle.json` file in your local `.kaggle` folder.
      - Use the command `kaggle datasets download -d <dataset-path>` to pull datasets directly into your project.

### 3. Download Walmart Sales Data
   - **Data Source**: Use the Kaggle API to download the Walmart sales datasets from Kaggle.
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)
   - **Storage**: Save the data in the `data/` folder for easy reference and access.

### 4. Install Required Libraries and Load Data
   - **Libraries**: Install necessary Python libraries using:
     ```bash
     pip install pandas numpy sqlalchemy mysql-connector-python psycopg2
     ```
   - **Loading Data**: Read the data into a Pandas DataFrame for initial analysis and transformations.

### 5. Explore the Data
   - **Goal**: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
   - **Analysis**: Use functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 6. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Drop rows or columns with missing values if they are insignificant; fill values where essential.
   - **Fix Data Types**: Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Use `.replace()` to handle and format currency values for analysis.
   - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

### 7. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 8. Load Data into SQL Server
   - **Export Clean Data**: Save the cleaned dataset from Python as a CSV file.
   - **Flat File Import**: Use SQL Server Management Studio’s Flat File Import Wizard to load the CSV into a SQL Server table.
   - **Verification**: Run a few SELECT queries in SQL Server to confirm that the data was imported correctly.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
   - What are the different payment methods, and how many transactions and items were sold with each method? This helps understand customer preferences for payment methods,
     aiding in payment optimization strategies
     <img width="517" height="117" alt="image" src="https://github.com/user-attachments/assets/c90033b5-da9a-489d-b2f0-5c64215fefff" />

   - Which category received the highest average rating in each branch? This allows Walmart to recognize and promote popular categories in specific branches,
     enhancing customer satisfaction and branch-specific marketing.
     <img width="691" height="240" alt="image" src="https://github.com/user-attachments/assets/d574707b-4f07-4101-a4be-0034d0bb8fc1" />

   - What is the busiest day of the week for each branch based on transaction volume? This insight helps in optimizing staffing and inventory management to accommodate peak days.
     <img width="817" height="199" alt="image" src="https://github.com/user-attachments/assets/567a75d4-9291-4f6b-a8de-38eabe51c0eb" />

   - How many items were sold through each payment method? This helps Walmart track sales volume by payment type, providing insights into customer purchasing habits.

      <img width="516" height="97" alt="image" src="https://github.com/user-attachments/assets/740635c3-7110-4b1b-be12-fce9c5cc4daa" />

   - What are the average, minimum, and maximum ratings for each category in each city? This data can guide city-level promotions, allowing Walmart to address regional preferences and improve customer                 experiences.

     <img width="294" height="176" alt="image" src="https://github.com/user-attachments/assets/84c03ecc-805e-40dd-b602-52c8c82d7c3f" />

   - What is the total profit for each category, ranked from highest to lowest? This helps identify high-profit categories and focus efforts on expansion or managing pricing strategies effectively.

     <img width="393" height="131" alt="image" src="https://github.com/user-attachments/assets/92384245-7fe1-46cd-aaea-7dba69f8ed3f" />

   - What is the most frequently used payment method in each branch? This information aids in understanding branch-specific payment preferences and allows branches to streamline their payment processing systems.

     <img width="622" height="218" alt="image" src="https://github.com/user-attachments/assets/078d124f-5748-408d-87fe-779d6e98cff0" />

   - How many transactions occur in each shift (Morning, Afternoon, Evening) across branches? This insight helps in managing staff shifts and stock replenishment schedules during high-sales periods.
   - Which branches experienced the largest decrease in revenue compared to the previous year? This is crucial for detecting branches with declining revenue and creating strategies to boost sales or mitigate          losses. 
   - **Documentation**: Keep clear notes of each query's objective, approach, and results.

### 10. Project Publishing and Documentation
   - **Documentation**: Maintain well-structured documentation of the entire process in Markdown or a Jupyter Notebook.
   - **Project Publishing**: Publish the completed project on GitHub or any other version control platform, including:
     - The `README.md` file (this document).
     - Jupyter Notebooks (if applicable).
     - SQL query scripts.
     - Data files (if possible) or steps to access them.

---

## Requirements

- **Python 3.8+**
- **SQL Databases**: SQL Server
- **Python Libraries**:
  - `pandas`, `numpy`, `sqlalchemy`, `mysql-connector-python`, `psycopg2`
- **Kaggle API Key** (for data downloading)

## Getting Started

1. Clone the repository:
   ```bash
   git clone <repo-url>
   ```
2. Install Python libraries:
   ```bash
   pip install -r requirements.txt
   ```
3. Set up your Kaggle API, download the data, and follow the steps to load and analyze.

---

## Project Structure

```plaintext
|-- data/                     # Raw data and transformed data
|-- sql_queries/              # SQL scripts for analysis and queries
|-- notebooks/                # Jupyter notebooks for Python analysis
|-- README.md                 # Project documentation
|-- requirements.txt          # List of required Python libraries
|-- main.py                   # Main script for loading, cleaning, and processing data
```
---

## Results and Insights

This section will include your analysis findings:
- **Sales Insights**: Key categories, branches with highest sales, and preferred payment methods.
- **Profitability**: Insights into the most profitable product categories and locations.
- **Customer Behavior**: Trends in ratings, payment preferences, and peak shopping hours.

## Future Enhancements

Possible extensions to this project:
- Integration with a dashboard tool (e.g., Power BI or Tableau) for interactive visualization.
- Additional data sources to enhance analysis depth.
- Automation of the data pipeline for real-time data ingestion and analysis.

---

## License

This project is licensed under the MIT License. 

---

## Acknowledgments

- **Data Source**: Kaggle’s Walmart Sales Dataset
- **Inspiration**: Walmart’s business case studies on sales and supply chain optimization.

---

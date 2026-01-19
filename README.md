#  Loan Risk Analysis Project (Day 1) — Master Table Creation + Initial Data Validation

##  Project Overview
This project is a **loan risk analysis** project based on real-world banking data.  
In this project, I will analyze raw banking datasets and create a **Loan Master Table from scratch** using **SQL ETL logic**.

##  Business Objective
The main goal of this project is to build a dataset and analytics pipeline that can help in **loan risk prediction** using banking behavior data such as:
- loan details  
- account behavior  
- transaction patterns  
- customer linking  
- demographic and regional risk factors  

---

##  Raw Tables Used (Banking Dataset)
The dataset contains multiple relational tables that represent different banking entities:

- `loan` → loan information and target loan status  
- `account` → account details  
- `client` → customer details  
- `disp` → relation between account and client (who owns the account)  
- `transaction_data` → transaction history and balances  
- `orders` → permanent orders/payment instructions  
- `card` → card information  
- `district` → district-level socio-economic attributes  

---

##  Day 1 Goals (SQL-Based Loan Table Validation)
  - Understanding the **loan dataset structure**
  - Performing **basic validation checks**
  - Writing SQL queries to explore loan-level data
  - Setting up the foundation for building a complete **analytics-ready master table**
    
###  Tasks Covered Today
On Day 1, I started with the `loan` table and validated it using basic SQL exploration:

### 1️⃣ Preview Loan Data
- View the first 20 records of the loan table

### 2️⃣ Basic Dataset Size Checks
- Count total loans
- Count distinct accounts in the loan table

### 3️⃣ Value Range Checks
- Minimum and maximum loan amount
- Minimum and maximum loan duration

### 4️⃣ Target (Status) Validation
- Check distinct status values (`A`, `B`, `C`, `D`)
- Count loans by status  
- Count loans by status where duration > 36

### 5️⃣ Risk Segmentation Checks
- Find default-like loan counts where status in (`B`, `D`)
- Identify accounts having more than 1 loan

### 6️⃣ Time-based Filtering
- Find loans after a specific date



# Dummy Project Data Entry

## Data Entry & Cleaning Project -- E-commerce Orders

### 📝 Description:
I received customer order data from multiple sources (online form, marketplace export, and email). The raw data contained inconsistencies such as different date formats, duplicate records, uppercase emails, and missing payment statuses. My role was to consolidate the data, clean and validate it, and create a summary report for decision-making.

### ⚙ Process:
- Combined three raw datasets into one master file (RawCombined)
- Standardized date, phone number, and email formats
- Removed duplicates and filled missing values (set PaymentStatus = Unknown when empty)
- Added calculated field TotalPrice = Qty * Price
- Tagged payment status (Paid, Pending, Refunded, Unknown)
- Logged all corrections in a ValidationLog for transparency
- Created a pivot-based report in Summary to highlight sales by channel, top customers, and pending payments

### ✅ Result:
- Consolidated 150+ raw records into one clean dataset
- Detected and corrected ~8% inconsistent entries
- Produced a clear summary report that shows total revenue, pending payments, and top-selling channels
- Delivered final files including master_orders.xlsx, ValidationLog, and a summary report ready for stakeholders

![alt text](https://github.com/christysaragih/Data-Entry-/blob/main/dataentry.png?raw=true)

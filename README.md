# APAN5310_Group11_Document
This repository include documents for the "ABC FoodMart" project 

## ETL User Guide
The main part for this document is to present the ETL design through python jupyter notebook. Check the below user guide to set up the environment before running the ETL process on your device.

### Set Up and Perform ETL Steps
These steps will be explained in detail in following parts
1. Put the required document in the same folder before running following steps
2. Set up a new database in PostgreSQL with the guided name (you can do this using PgAdmin)
3. Open the jupyter notebook file and choose "runall" to directly ETL to your database (this is the suggested way of running the code)

#### Step 1: These files must be in the same folder with jupyter notebook file before running the code
Below file specification includes 5 csv files that the ETL file need to extract data from, and the source ETL code in the ipynb jupyter notebook file format that can directly run the python code.

- customers_sales.csv
- employees_shifts.csv
- products_vendor_orders.csv
- stores.csv
- sample_reviews.csv
- APAN5310_Group11_ETL.ipynb

These files are all provided in our document folder so you can select and download these files and put them in the same folder.

#### Step 2: Setup the PostgreSQL database
If you choose to directly follow Step 1 in the previous step and use the "runall" option in jupyter notebook, you can ignore the last two bulletpoints in this step (Step 2). Setting up the database with guided name is enough for running the ETL document if you simply decided to run the ETL process. This is because our ETL code is an automated process that do not need to make additional adjustment to the code that we provided, this allow any user to run the ETL process (without prior knowledge to python or psycopg).

- Create Database with Name: 5310_Group11_ETL_Update (must do this !!!)

- Pay attention to the conn.commit() code block at the end of the schema creation codes (the first section of the jupyter notebook document). You need to run this block to create all schema. (ignore this part if you choose to "runall" in notebook)
- At the bottom of the notebook (end of the notebook), there is cur.close() and conn,close() code. You need to run these codes if you want to delete the database from postgresql. Otherwise, you are leaving your connection with PostgreSQL on and PostgreSQL will not allow you to delete database. (ignore this part if you choose to "runall" in notebook)

#### Step 3: Open jupyter notebook file and choose "runall" to perform ETL
For all users, if you follow Step 1 and the first bullet point in Step 2 (database setup), then you can open the ipynb file in the same folder and run the code using "runall" option. As we mentioned previously, this is an automated process so you do not need to make changes inside the notebook code. The best way to perform this is to follow the Step 1 and Step 2 bullet 1 to make simple set up before you run the notebook file.

- Check whether you put the required document in the same folder when running (Step 1 check)
- Check whether you setup a new database in PostgreSQL called: 5310_Group11_ETL_Update (Step 1 bullet 1 check)
- Open the notebook file name: APAN5310_Group11_ETL.ipynb and choose "runall" on top of the application
- Check your local PostgreSQL database to see if tables and data are all inserted into the database

### Additional Files Generated during notebook "run" process

In this document folder, we also include additional files that are generated through the jupyter notebook "run", and these files are generated as records in the Data Manipulation Process (transformantion) in the ETL process. This means that if you follow our above Setup and Perform ETL Steps, these below files will be automatically generated for you, you do not need to download these files if you choose the guided "runall" option.

These additional files serves two purposes:
1. These documents are automatically generated from each table data manipulation in the data manipulation step (transformation) if you choose "runall" as we explained in above "Set Up and Perform ETL Steps".
2. User can also choose to use read.csv() method to load the dataset into python and insert the data to the PostgreSQL schema, although we do not suggest this option since performing this require you to make adjustments to the notebook file which not all users are farmiliar with the code design. We have an short guide of how you can perform this option.

These documents are:
- Category Table Insertion.csv
- Customer Table Insertion.csv
- CustomerRating Table Insertion.csv
- Employee Table Insertion.csv
- LoyaltyProgram Table Insertion.csv
- OperatingCost Table Insertion.csv
- Orders Table Insertion.csv
- Payment Table Insertion.csv
- Product Table Insertion.csv
- Productorders Table Insertion.csv
- ProductPrice Table Insertion.csv
- Sales Table Insertion.csv
- SpecificSales Table Insertion.csv
- Store Table Insertion.csv
- Storesorders Table Insertion.csv
- Supplier Table Insertion.csv

### How you can "play" with Additional Files (You could try this if you already perform the guided ETL process at least once!!!)

Note: We do not advice you to use this method since this break the automated process of the ETL process we designed. We include this for documentation purpose for the Transformation process (data manipulation). If you want to use this option, we advice you to at least perform the guided ETL Steps once to understand our ETL process and database design!

As we explained in the above section, these files are generated automatically if you follow our "Setup and Perform ETL Steps", but why we also include these documents in this folder? 

Because we also include an "alternative" way for users who are more farmiliar with ETL process (such as our group members) or who simply wants to see what the cleaned dataframes (datasets) look like. This way provides us (group members) with flexibility when we want to keep record of our data manipulation process, and also gives us flexibility if we decides to make any adjustment to the datasets (dataframes) in the data manipulation process, without affecting the entire flow of the ETL code:
- If you check the bottom section (data insertion) in the APAN5310_Group11_ETL.ipynb notebook, you can see that we also wrote some code that support inserting data into database using an alternative way these above files.
- These codes are commented using "#" so that it is not involved in the automated ETL process. 
- If you choose to play with this option, you need to run the First Part of the notebook file (Schema Creation) and the Last Part of the notebook file (Data Insertion to Schema).
- Before you run, you need to remove the "#" comment before the code for each schema insertion section, and you need to commented the default insertion code (the original code in ETL process) so that the two ways of insertion does not intervene.

### Important Note on the "Additional Files" !!

Since this read me is lengthy, we assume that some users may ignore some important details about our explination, we include this "Important Note" section:

- We advice you to follow the ETL User Guide and use the default way of running the code, as explained in the "Set Up and Perform ETL Steps" section.
- The "play" with Additional Files section is for users who already farmiliar with our ETL process and especially transformation step!!
- We do not advice you to use the "alternative" way that we included in the code, we design those code for internal usage if we want to make adjustment to specific dataset (or dataframe).
- A simple way to explain the idea is that the default ETL process directly use the dataframe created (python objects) in the data manipulation process to insert the data into schemas. The "alternative" option is to read the csv files into dataframes (python object) instead of going through manipulation process, and insert the data into schemas.

## Other Documents:

- Group11_E-R_Diagram.pdf (this is the ER Diagram of our database, read this to help you understand our database design and relationship constraints)

Enjoy your ETL!






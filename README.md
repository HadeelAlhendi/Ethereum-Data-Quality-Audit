# 🛡️ Ethereum Data Quality Audit: The 58% Zero-Value Mystery

### 📋 Project Overview
This project demonstrates a professional **Data Quality Engineering** workflow applied to Ethereum blockchain transactions. The investigation was triggered by a significant anomaly: **58% of transactions** on 2025-12-01 had a value of zero ETH. I led a three-phase audit to verify if this was a data integrity failure or legitimate system behavior.

---

### 🔍 Phase 1: DQ_Discovery_zeroValue
**Goal:** Initial data profiling to identify integrity gaps and missing records.
* **Action:** Performed a comprehensive completeness check for NULL values and logical consistency in the transaction table.
* **Key Finding:** Discovered that **1,081,526 transactions (approx. 58%)** carried a value of 0 ETH.
* **Integrity Status:** Confirmed 100% data completeness (0% missing addresses), but flagged the volume anomaly for forensic investigation.

---

### ⚖️ Phase 2: DQ_Audit_zeroValue (Forensic Investigation)
**Goal:** Root cause analysis and technical validation of zero-value records.
* **Action:** Developed a forensic SQL script to categorize transactions by `input` type and `receipt_status`.
* **Visualization:** Built an automated dashboard in **Looker Studio** to monitor system health.
* **Key Insights:**
    * **98.4%** of zero-value records were identified as **Contract Calls** (legitimate technical activity), confirming data accuracy.
    * **97.6% Success Rate:** Pie chart analysis confirmed that the vast majority of these transactions were processed successfully by the network.
    * **Hourly Stability:** Bar chart analysis showed a steady transaction flow throughout the day, ruling out pipeline failures.

---

### 💰 Phase 3: DQ_impact_integrity_zeroValue
**Goal:** Financial impact assessment and resource integrity audit.
* **Action:** Analyzed the economic footprint (Gas Fees) of zero-value transactions to ensure they were not "data noise".
* **Key Findings:**
    * **Total Fees Processed:** Verified that these transactions generated **111.64 ETH** in network fees, proving they are high-value technical operations.
    * **Risk Assessment:** Confirmed a low **2.16% failure risk**, signifying a highly reliable data ingestion environment.
    * **Maximum Complexity:** Identified single transactions consuming up to **4.5M gas**, indicating complex smart contract interactions.

---

### 🚀 Business Impact & Conclusion
By applying this DQ framework, I successfully distinguished "Technical Noise" from "Data Errors." 
* **Outcome:** Provided the bank/organization with a **97.6% confidence score** in their blockchain data pipeline.
* **Recommendation:** Approved the dataset for financial reporting, as the zero-value anomaly reflects healthy smart contract activity rather than data loss.

---

### 🛠️ Technical Stack
* **SQL (BigQuery):** For massive-scale data profiling and forensic auditing.
* **Looker Studio:** For real-time quality monitoring and anomaly visualization.

---

<div align="center">
  <p><b>Prepared & Audited by: Hadeel Mohammed Alhendi</b></p>
  <p><i>Data Quality Engineer | Blockchain Forensic Specialist 🛡️</i></p>
  <a href="[ضع رابط لينكد إن هنا]">
    <img src="https://img.shields.io/badge/LinkedIn-Connect-blue?style=for-the-badge&logo=linkedin" alt="LinkedIn">
  </a>
  <p><sub>"Data is the new oil, but Quality is the refinery."</sub></p>
</div>

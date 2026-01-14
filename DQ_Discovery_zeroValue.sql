SELECT 
  -- 1. Completeness Metric: Identifying null sender addresses
  COUNTIF(from_address IS NULL) as missing_sender_count,
  
  -- 2. Logic Validity: Monitoring transactions with zero value
  COUNTIF(value = 0) as zero_value_transactions,
  
  -- 3. Audit Scale: Total records processed
  COUNT(*) as total_records
FROM `bigquery-public-data.crypto_ethereum.transactions`
WHERE DATE(block_timestamp) = "2025-12-01"

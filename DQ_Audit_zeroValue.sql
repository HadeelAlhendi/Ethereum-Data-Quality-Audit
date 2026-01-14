SELECT 
  -- 1. Categorizing logic: Is it a simple ETH transfer or a Smart Contract interaction?
  CASE 
    WHEN input = '0x' THEN 'Pure Zero Transfer (Check for Spam)' 
    ELSE 'Contract Call (Technical Activity)' 
  END AS logic_type,

  -- 2. Technical Validation: Checking the network execution status for data integrity
  CASE 
    WHEN receipt_status = 1 THEN 'Success' 
    WHEN receipt_status = 0 THEN 'Failed'
    ELSE 'Unknown' 
  END AS technical_status,

  -- 3. Anomaly Detection: Identifying bot activity and unique sender patterns
  COUNT(*) AS transaction_count,
  COUNT(DISTINCT from_address) AS unique_senders,

  -- 4. Temporal Analysis: Extracting hours to detect ingestion patterns or peak spikes
  EXTRACT(HOUR FROM block_timestamp) AS hour_of_day

FROM `bigquery-public-data.crypto_ethereum.transactions`
WHERE DATE(block_timestamp) = "2025-12-01" 
  AND value = 0 -- Focused investigation on the 58% zero-value anomaly detected in Phase 1
GROUP BY logic_type, technical_status, hour_of_day
ORDER BY transaction_count DESC

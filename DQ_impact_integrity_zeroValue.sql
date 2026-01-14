SELECT 
  -- 1. Financial Impact: Calculating total Gas Fees consumed by zero-value transactions
  -- This proves that these transactions represent actual network economic activity.
  SUM(receipt_gas_used * receipt_effective_gas_price / 1e18) AS total_fees_in_eth,

  -- 2. Cost Analysis: Average fee per transaction to ensure pricing consistency.
  AVG(receipt_gas_used * receipt_effective_gas_price / 1e18) AS avg_tx_fee_eth,

  -- 3. Resource Efficiency: Monitoring Gas consumption extremes for zero-value activity.
  MAX(receipt_gas_used) AS max_gas_used_by_single_zero_tx,
  MIN(receipt_gas_used) AS min_gas_used_by_single_zero_tx,

  -- 4. Technical Integrity: Counting failed zero-value transactions to assess network reliability.
  COUNTIF(receipt_status = 0) AS total_failed_zero_tx,
  
  -- 5. Financial Risk Ratio: Calculating the percentage of failed transactions to evaluate data risk.
  (COUNTIF(receipt_status = 0) / COUNT(*)) * 100 AS failure_percentage_risk

FROM `bigquery-public-data.crypto_ethereum.transactions`
WHERE DATE(block_timestamp) = "2025-12-01" 
  AND value = 0 -- Focusing investigation on the specific anomaly identified in previous phases.

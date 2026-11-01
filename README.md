# Banking Fraud Dataset & Real-Time Pipeline Benchmark

A realistic, production-grade synthetic banking transaction dataset designed for fraud detection, risk scoring, machine learning benchmarking, and academic research.

## 📊 Dataset Overview

- **Total Records:** 50,000 transactions
- **Unique Accounts:** 250 distinct customer profiles
- **Time Horizon:** October 1, 2026 – October 31, 2026
- **Total Volume:** \$23,489,546.96
- **Target Feature:** `is_fraud` (Binary: `0` / `1`)
  - **Legitimate:** 47,919 (95.84%)
  - **Fraudulent:** 2,081 (4.16%)

---

## 📁 Repository Structure & Data Files

| File | Shape | Description |
| :--- | :---: | :--- |
| `banking_transactions_50000_cleaned.csv` | 50,000 × 43 | **De-identified & Cleaned:** Identifiers and redundancies removed, temporal features extracted. |
| `banking_transactions_50000_features_expanded.csv` | 50,000 × 50 | **Feature-Engineered:** Leakage purged, includes 10 new financial and behavioral interaction features. |
| `banking_transactions_50000_model_ready.csv` | 50,000 × 107 | **Model-Ready:** One-hot encoded categoricals, `RobustScaler` applied to continuous numericals. |
| `banking_transactions_50000.csv` | 50,000 × 52 | **Raw Dataset:** Initial synthetic transaction stream. |
| `generate_transactions.py` | — | Configurable dataset generator script supporting custom row and account counts. |

---

## 🛠️ Fraud Type Breakdown (2,081 Total Cases)

- **Account Takeover (`ACCOUNT_TAKEOVER`):** 445 cases
- **Friendly Fraud (`FRIENDLY_FRAUD`):** 423 cases
- **Money Laundering (`MONEY_LAUNDERING`):** 419 cases
- **Card Not Present (`CARD_NOT_PRESENT`):** 402 cases
- **Synthetic Identity (`SYNTHETIC_ID`):** 392 cases

---

## ⚙️ Generating Custom Datasets

You can scale or customize this dataset at any time using `generate_transactions.py`:

```bash
# Generate 100,000 rows across 500 accounts with a 4% fraud rate
python generate_transactions.py --rows 100000 --accounts 500 --fraud-rate 0.04
```

---

## 📈 Evaluation Protocol for Imbalanced Fraud Detection

> **Important Note on Metrics:**  
> Because legitimate transactions represent ~96% of the volume, a trivial classifier predicting all legitimate transactions achieves **95.84% accuracy** with **0% recall**. Model evaluation must report **Precision**, **Recall**, and **PR-AUC (Precision-Recall Area Under Curve)** rather than accuracy alone.

/* 1. POS_TRANSACTIONS - Query 246261 */
CREATE NONCLUSTERED INDEX IX_POS_TRANSACTIONS_InsCode_GenStatus_MCC
ON dbo.POS_TRANSACTIONS
(
    PTR_INS_CODE,
    PTR_GEN_STATUS,
    PTR_MCC,
    PTR_CENTRE_PROC_DATE,
    PTR_TXN_AMOUNT
)
INCLUDE
(
    PTR_MERCHANT_ID,
    PTR_NETWORK,
    PTR_CARD_TYPE,
    PTR_SETL_DATE,
    PTR_REV_INDICATOR,
    PTR_SETL_FLAG,
    PTR_FORCE_SETL_FLAG
);
GO


/* 2. IRF_REPORT - Query 412654 / 400931 */
CREATE NONCLUSTERED INDEX IX_IRF_REPORT_TerminalID_RetRefNumber
ON dbo.IRF_REPORT
(
    IRF_TERMINAL_ID,
    IRF_RET_REF_NUMBER
);
GO


/* 3. POS_TRANSACTIONS - Query 246261
   Different recommendation from #1 */
CREATE NONCLUSTERED INDEX IX_POS_TRANSACTIONS_InsCode_GenStatus
ON dbo.POS_TRANSACTIONS
(
    PTR_INS_CODE,
    PTR_GEN_STATUS,
    PTR_CENTRE_PROC_DATE,
    PTR_TXN_AMOUNT,
    PTR_NETWORK,
    PTR_REV_INDICATOR
)
INCLUDE
(
    PTR_MERCHANT_ID,
    PTR_MCC,
    PTR_CARD_TYPE,
    PTR_SETL_DATE,
    PTR_SETL_FLAG,
    PTR_FORCE_SETL_FLAG
);
GO


/* 4. POS_TRANSACTION_WORK - Query 593692 */
CREATE NONCLUSTERED INDEX IX_POS_TRANSACTION_WORK_TrlType_MerDiscFee
ON dbo.POS_TRANSACTION_WORK
(
    PTR_TRL_TYPE,
    PTR_MER_DISC_FEE
)
INCLUDE
(
    PTR_TXN_AMOUNT,
    PTR_MDF_SGST,
    PTR_MDF_CGST,
    PTR_MDF_IGST
);
GO


/* 5. UPI_TLF_DATA - Query 248814 */
CREATE NONCLUSTERED INDEX IX_UPI_TLF_DATA_PtrSerNumber_RetRefNumber
ON dbo.UPI_TLF_DATA
(
    UTD_PTR_SER_NUMBER,
    UTD_RET_REF_NUMBER
)
INCLUDE
(
    UTD_BANK_CODE,
    UTD_NETWORK,
    UTD_ADDITINAL_REFERENCE
);
GO


SELECT
    i.name AS IndexName,
    i.type_desc AS IndexType,
    ic.key_ordinal,
    ic.index_column_id,
    c.name AS ColumnName,
    ic.is_included_column
FROM sys.indexes i
JOIN sys.index_columns ic
    ON i.object_id = ic.object_id
   AND i.index_id = ic.index_id
JOIN sys.columns c
    ON ic.object_id = c.object_id
   AND ic.column_id = c.column_id
WHERE i.object_id = OBJECT_ID('dbo.UPI_TLF_DATA')
  AND i.name = 'IX_UPI_TLF_DATA_PtrSerNumber_RetRefNumber'
ORDER BY ic.key_ordinal, ic.index_column_id;


SELECT
    i.name AS IndexName,
    i.type_desc AS IndexType,
    ic.key_ordinal,
    ic.index_column_id,
    c.name AS ColumnName,
    ic.is_included_column
FROM sys.indexes i
JOIN sys.index_columns ic
    ON i.object_id = ic.object_id
   AND i.index_id = ic.index_id
JOIN sys.columns c
    ON ic.object_id = c.object_id
   AND ic.column_id = c.column_id
WHERE i.object_id = OBJECT_ID('dbo.UPI_TLF_DATA')
  AND i.name = 'IX_UPI_TLF_DATA_PtrSerNumber_RetRefNumber'
ORDER BY ic.key_ordinal, ic.index_column_id;


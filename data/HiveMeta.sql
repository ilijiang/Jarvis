--Columns
SELECT
DBS.DB_ID,
DBS.NAME,
TBLS.TBL_ID,
TBLS.TBL_NAME,
TBLS.TBL_TYPE,
TBLS.OWNER,
TBLS.VIEW_ORIGINAL_TEXT,
COLUMNS_V2.CD_ID,
COLUMNS_V2.COLUMN_NAME,
COLUMNS_V2.TYPE_NAME,
COLUMNS_V2.INTEGER_IDX
FROM TBLS
LEFT JOIN DBS ON TBLS.DB_ID=DBS.DB_ID
LEFT JOIN SDS ON TBLS.SD_ID=SDS.SD_ID
LEFT JOIN COLUMNS_V2 ON SDS.CD_ID=COLUMNS_V2.CD_ID
WHERE TBLS.TBL_NAME='stg_adways_qsi'
ORDER BY COLUMNS_V2.INTEGER_IDX


--Partition
SELECT
DBS.DB_ID,
DBS.NAME,
TBLS.TBL_ID,
TBLS.TBL_NAME,
TBLS.TBL_TYPE,
TBLS.OWNER,
PARTITION_KEYS.PKEY_NAME,
PARTITION_KEYS.PKEY_TYPE,
PARTITION_KEYS.INTEGER_IDX
FROM TBLS
LEFT JOIN DBS ON TBLS.DB_ID=DBS.DB_ID
LEFT JOIN PARTITION_KEYS ON TBLS.TBL_ID=PARTITION_KEYS.TBL_ID
WHERE TBLS.TBL_NAME='stg_adways_qsi'
ORDER BY PARTITION_KEYS.INTEGER_IDX


--Table Parameters
SELECT
DBS.DB_ID,
DBS.NAME,
TBLS.TBL_ID,
TBLS.TBL_NAME,
TBLS.TBL_TYPE,
TBLS.OWNER,
TABLE_PARAMS.PARAM_KEY,
TABLE_PARAMS.PARAM_VALUE
FROM TBLS
LEFT JOIN DBS ON TBLS.DB_ID=DBS.DB_ID
LEFT JOIN SDS ON TBLS.SD_ID=SDS.SD_ID
LEFT JOIN TABLE_PARAMS ON TBLS.TBL_ID=TABLE_PARAMS.TBL_ID
WHERE TBLS.TBL_NAME='rpt_loreal_pricing_view'
ORDER BY TABLE_PARAMS.PARAM_KEY


--SERDE and Store and Location
SELECT
DBS.DB_ID,
DBS.NAME,
TBLS.TBL_ID,
TBLS.TBL_NAME,
TBLS.TBL_TYPE,
TBLS.OWNER,
SERDES.SLIB,
SDS.INPUT_FORMAT,
SDS.OUTPUT_FORMAT,
SDS.LOCATION
FROM TBLS
LEFT JOIN DBS ON TBLS.DB_ID=DBS.DB_ID
LEFT JOIN SDS ON TBLS.SD_ID=SDS.SD_ID
LEFT JOIN SERDES ON SDS.SERDE_ID=SERDES.SERDE_ID
WHERE TBLS.TBL_NAME='stg_adways_qsi'


--Storage Desc Params
SELECT
DBS.DB_ID,
DBS.NAME,
TBLS.TBL_ID,
TBLS.TBL_NAME,
TBLS.TBL_TYPE,
TBLS.OWNER,
SERDE_PARAMS.PARAM_KEY,
SERDE_PARAMS.PARAM_VALUE
FROM TBLS
LEFT JOIN DBS ON TBLS.DB_ID=DBS.DB_ID
LEFT JOIN SDS ON TBLS.SD_ID=SDS.SD_ID
LEFT JOIN SERDE_PARAMS ON SDS.SERDE_ID=SERDE_PARAMS.SERDE_ID
WHERE TBLS.TBL_NAME='stg_adways_qsi'




INTO OUTFILE '/home/philroc.chen/test.csv' 
FIELDS ENCLOSED BY '"' 
TERMINATED BY ';' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n'
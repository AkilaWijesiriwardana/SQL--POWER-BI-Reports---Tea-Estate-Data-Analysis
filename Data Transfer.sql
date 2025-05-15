--copying data from TeaEstateData csv file (That dataset isn't organized at all).
COPY TeaEstateData
FROM 'G:\Tea Estate\TeaEstateData.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER',',
    ENCODING 'UTF8'

);


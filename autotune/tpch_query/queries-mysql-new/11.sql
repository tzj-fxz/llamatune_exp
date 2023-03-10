select current_timestamp(6) into @query_start;
set @query_name='11.sql';
SELECT PS_PARTKEY, SUM(PS_SUPPLYCOST * PS_AVAILQTY) AS VALUE FROM PARTSUPP, SUPPLIER, NATION WHERE PS_SUPPKEY = S_SUPPKEY AND S_NATIONKEY = N_NATIONKEY AND N_NAME = 'MOZAMBIQUE' GROUP BY PS_PARTKEY HAVING SUM(PS_SUPPLYCOST * PS_AVAILQTY) > (SELECT SUM(PS_SUPPLYCOST * PS_AVAILQTY) * 0.0001000000 FROM PARTSUPP, SUPPLIER, NATION WHERE PS_SUPPKEY = S_SUPPKEY AND S_NATIONKEY = N_NATIONKEY AND N_NAME = 'MOZAMBIQUE') ORDER BY VALUE DESC;
set @query_time_ms= timestampdiff(microsecond, @query_start, current_timestamp(6))/1000;
SELECT @query_name, @query_time_ms;
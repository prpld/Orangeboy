WBVardef today=@"select to_char(current_timestamp,'mm-dd-yyyy')";
WBExport -type=text
                 -file='C:\Orangeboy\WAM\prpld_database_$[today].txt'
                 -delimiter=','
		 -quotechar='"'
		 -quoteCharEscaping=escape
                 -lineEnding=crlf
                 -encoding=utf8;

SELECT
TO_CHAR(w.logged_gmt, 'mm-dd-yyyy') AS "Date",
w.dest_code AS "Databasename",
p.record_num AS "Patron#" 
FROM sierra_view.wamreport w 
JOIN sierra_view.patron_view p 
ON w.patron_record_metadata_id = p.id
-- Function to manually retrieve betwee two static dates
--WHERE w.logged_gmt BETWEEN '20221006' AND '20221013'
-- Function to dynamically retrieve from the last 7 days
WHERE w.logged_gmt between (CURRENT_DATE - '7 day'::interval) and (CURRENT_DATE)
GROUP BY p.record_num, w.dest_code, w.logged_gmt
ORDER BY w.logged_gmt;
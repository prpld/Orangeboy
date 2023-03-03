WBVardef today=@"select to_char(current_date - 1,'mm-dd-yyyy')";
WBExport -type=text
                 -file='C:\Orangeboy\Circulation\prpld_circ_$[today].txt'
                 -delimiter=','
		 -quotechar='"'
		 -quoteCharEscaping=escape
                 -lineEnding=crlf
                 -encoding=utf8;

SELECT 
p.record_num AS "PATRON#", 
to_char(ct.transaction_gmt, 'MM-DD-YYYY') AS "Activity_Date", 
i.location_code AS "LOCATION", 
ct.itype_code_num AS "I_TYPE" 
FROM sierra_view.record_metadata r 
JOIN sierra_view.circ_trans ct 
ON r.id = ct.patron_record_id 
JOIN sierra_view.item_view i 
ON i.id = ct.item_record_id 
JOIN sierra_view.patron_view p 
ON p.id = ct.patron_record_id 
WHERE ct.op_code = 'o' 
-- AND ct.transaction_gmt BETWEEN '2022-10-06' AND '2022-10-14'
-- The line below should dynamically query the data from the previous Friday to this week's Thursday  
WHERE w.logged_gmt between (CURRENT_DATE - '7 day'::interval) and (CURRENT_DATE)
ORDER BY ct.transaction_gmt; 

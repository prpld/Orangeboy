WBVardef today=@"select to_char(current_timestamp,'yyyy-mm-dd')";
WBExport -type=text
                 -file='C:\Orangeboy\EBSCO\PoudreLibraries_isbn_$[today].txt'
                 -delimiter='|'
		 -quotechar='"'
		 -quoteCharEscaping=escape
                 -lineEnding=crlf
                 -encoding=utf8;

SELECT
content AS "isbn"
FROM sierra_view.subfield_view
WHERE marc_tag = '020'
AND record_type_code = 'b'
AND field_type_code = 'i' 
AND tag = 'a'
AND content <> ''
ORDER BY content;
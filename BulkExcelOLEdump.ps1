Get-ChildItem -Filter *.xls* | ForEach-Object {python oledump.py $_.FullName >> ExcelOutFile.txt}
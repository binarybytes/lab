$key = ""
$ioc = Get-Content .\ioc.txt
foreach($ip in $ioc)
{
$header = @{
'Key' = $key;
}

$uri = "https://api.abuseipdb.com/api/v2/check"
$body = @{
'ipAddress' = $ip;
'maxAgeInDays' = '365';
'verbose' = '';
}

            $bulkLookup = Invoke-RestMethod -Method GET $uri -Header $header -Body $body -ContentType 'application/json; charset=utf-8'
            $address = $bulkLookup.data.ipAddress
            $ConfidenceScore = $bulkLookup.data.abuseConfidenceScore
            $totalReports = $bulkLookup.data.totalReports
            $isPublic = $bulkLookup.data.isPublic
            $country = $bulkLookup.data.countryName
            $Hostnames = $bulkLookup.data.hostnames
            $UsageType = $bulkLookup.data.usageType
            $ISP = $bulkLookup.data.isp
            $lastReport = $bulkLookup.data.lastReportedAt

             Write-Host '----------------------------------------------------------------------------'
             Write-Host 'Confidence of abuse:' $ConfidenceScore
             Write-Host 'Total Reports:' $totalReports
             Write-Host 'Public:' $isPublic
             Write-Host 'Country:' $country
             Write-Host 'IP:' $address
             Write-Host 'Hostname:' $Hostnames
             Write-Host 'Usage Type:' $UsageType
             Write-Host 'ISP:' $ISP
             Write-Host 'Last reported:' $lastReport
             Write-Host '----------------------------------------------------------------------------'

        }

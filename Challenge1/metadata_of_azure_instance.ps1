
#This is IP address at which IMDS REST API Available
$ImdsServerIp = "http://169.254.169.254" 

$endpoint = $ImdsServerIp + "/metadata/instance"
$apiVersion = "?api-version=2021-02-01"

#this you can select any specific key you want to retrieve. You can select different key like compute, network, osType, sku etc.
$dataKeyToretrive = "/compute"

$uri = $endpoint + $dataKeyToretrive + $apiVersion

$metaData = Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -NoProxy -Uri $uri

$output = $metaData | ConvertTo-Json -Depth 6

$output








Param(
  [Parameter(Mandatory)]
  [string]$storageAccountName,

  [Parameter(Mandatory)]
  [string]$storageAccountKey
)

$storageContext = New-AzureStorageContext $storageAccountName $storageAccountKey
$share = New-AzureStorageShare logs -Context $storageContext

Write-Host $share
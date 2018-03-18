param (
  [Parameter(Mandatory)]
  [string]$resourceGroupName
)

Remove-AzureRmResourceGroup -Name $resourceGroupName
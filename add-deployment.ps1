param (
  [Parameter(Mandatory)]
  [string]$subscriptionId,

  [Parameter(Mandatory)]
  [string]$resourceGroupName = "arm-testing",

  [Parameter(Mandatory)]
  [string]$resourceGroupLocation = "East US",

  [Parameter(Mandatory)]
  [string]$deploymentName = "test-deployment",

  [string]$TemplateFilePath = "ot-deploy.json",

  [string]$ParametersFilePath = "parameters.json"
)

$ErrorActionPreference = "Stop"

# Login to Azure and select subscription
Write-Output "Logging in"
Login-AzureRmAccount
Write-Output "Selecting subscription '$subscriptionId'"
Select-AzureRmSubscription -SubscriptionID $subscriptionId

# Create or check for existing resource group
$resourceGroup = Get-AzureRmResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if ( -not $ResourceGroup ) {
  Write-Output "Could not find resource group '$resourceGroupName' - will create it"
  if ( -not $resourceGroupLocation ) {
    $resourceGroupLocation = Read-Host -Prompt 'Enter location for resource group'
  }
  Write-Output "Creating resource group '$resourceGroupName' in location '$resourceGroupLocation'"
  New-AzureRmResourceGroup -Name $resourceGroupName -Location $resourceGroupLocation
}
else {
  Write-Output "Using existing resource group '$resourceGroupName'"
}

# Start the deployment
Write-Output "Starting deployment"
if ( Test-Path $ParametersFilePath ) {
  New-AzureRmResourceGroupDeployment -Name $deploymentName -resourceGroupName $resourceGroupName -TemplateFile $TemplateFilePath -TemplateParameterFile $ParametersFilePath
}
else {
  New-AzureRmResourceGroupDeployment -Name $deploymentName -resourceGroupName $resourceGroupName -TemplateFile $TemplateFilePath
}
# Deploy OTDS component to an OpenText solution

This is early days - no real documentation yet...

## Deploy

``` PowerShell
Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionId <id>
New-AzureRmResourceGroup -Name <resourceName> -Location "<location>"
New-AzureRMResourceGroupDeployment -Name <deploymentName> -ResourceGroupName <Resource Group Name> -TemplateFile "<path to JSON template>"
```

I'd suggest making the resource group name the same as the environment name, e.g. production, development, etc.
# OT Infrastructure

Process for creation of an OpenText solution environment - starting with Azure ARM Templates. Will look at Terraform later (and if there's interest).

This is early days -so nothing much here yet...

## Deploy

``` PowerShell
Login-AzureRmAccount
Select-AzureRmSubscription -SubscriptionId <id>
New-AzureRmResourceGroup -Name <resourceName> -Location "<location>"
New-AzureRMResourceGroupDeployment -Name <deploymentName> -ResourceGroupName <Resource Group Name> -TemplateFile "<path to JSON template>"
```

I'd suggest making the resource group name the same as the environment name, e.g. production, development, etc.
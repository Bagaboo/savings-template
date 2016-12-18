# Savings-templates

Resource Manager Template for our brand new Savings system. Deploys six resource groups. 

#Shared
- Virtual Network (five subnets)
- Virtual Network Gateway
- Public Ip Address
- App Service Plan

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Fshared%2Fshared.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Fshared%2Fshared.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

#Jumpboxes
- Storage Account
- Windows Virtual Machine
	- Standard_D1
	- Windows Server 2012 R2 Datacenter
	- Powershell script that disables Enhanced Internet Security and downloads Putty
- Linux Virtual Machine
	- Ubuntu 16.04 LTS
	- Standard A1
- Public Ip Addresses 
- Network Security Groups

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Fjumpbox%2Fjumpbox.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Fjumpbox%2Fjumpbox.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

#Eventstore
- Storage Account
- Three Linux Virtual Machines
	- Ubuntu 16.04 LTS
	- Docker Extension
	- Custom Script Extension that installs Eventstore

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Feventstore%2Feventstore.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Feventstore%2Feventstore.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>
	
#Elasticsearch
- Storage Account
- Three Linux Virtual Machines
	- Ubuntu 16.04 LTS
	- Docker Extension
	- Custom Script Extension that installs Elasticsearch

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Felasticsearch%2Felasticsearch.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>	
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Felasticsearch%2Felasticsearch.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>	
	
#Client
- Webapp with VPN connection to Virtual Network in Shared.

<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Fclient%2Fclient.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>
<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Fclient%2Fclient.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>


#Api
- Apiapp with VPN connection to Virtual Network in Shared.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Fapi%2Fapi.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Fapi%2Fapi.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

#Sql
- Sql server and database.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Fsql%2Fsql.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fcollector-bank%2Fsavings-template%2Fmaster%2Fsql%2Fsql.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

#Instructions

Create the resource groups. Tag all resource groups with the correct environment.
```Powershell
New-AzureRmResourceGroup -Name "Group-Shared-ENV" -Location "West Europe" -Tag @{Name="Environment";Value="ENV"}
New-AzureRmResourceGroup -Name "Group-Jumpboxes-ENV" -Location "West Europe" -Tag @{Name="Environment";Value="ENV"}
New-AzureRmResourceGroup -Name "Group-Eventstore-ENV" -Location "West Europe" -Tag @{Name="Environment";Value="ENV"}
New-AzureRmResourceGroup -Name "Group-Elasticsearch-ENV" -Location "West Europe" -Tag @{Name="Environment";Value="ENV"}
New-AzureRmResourceGroup -Name "Group-Client-ENV" -Location "West Europe" -Tag @{Name="Environment";Value="ENV"}
New-AzureRmResourceGroup -Name "Group-Api-ENV" -Location "West Europe" -Tag @{Name="Environment";Value="ENV"}
New-AzureRmResourceGroup -Name "Group-Sql-ENV" -Location "West Europe" -Tag @{Name="Environment";Value="ENV"}
```

Run the deploy.ps1 script. It might take a while since the gateway can take up to 30 minutes to create.
```Powershell
.\deploy.ps1
```

Note that each of the templates can be deployed and redeployed indepently of each other.

#Security
By default this template leaves RDP and SSH to the jumpboxes open for everyone. Elasticsearch and Eventstore only listens to private ips and cannnot be accessed from internet.
The api app and web client is connected to the network over VPN. An alternative that we right now consider is using an App Service Environment instead.
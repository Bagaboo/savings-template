# Savings-templates

Resource Manager Template for our brand new Savings system. Deploys six resource groups. 

#Shared
- Virtual Network (five subnets)
- Virtual Network Gateway
- Public Ip Address
- App Service Plan

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

#Eventstore
- Storage Account
- Three Linux Virtual Machines
	- Ubuntu 16.04 LTS
	- Docker Extension
	- Custom Script Extension that installs Eventstore

#Elasticsearch
- Storage Account
- Three Linux Virtual Machines
	- Ubuntu 16.04 LTS
	- Docker Extension
	- Custom Script Extension that installs Elasticsearch

#Client
- Webapp with VPN connection to Virtual Network in Shared.

#Api
- Apiapp with VPN connection to Virtual Network in Shared.

#Sql
- Sql server and database.

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
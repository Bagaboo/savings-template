$sharedResourceGroupName = "Group-Savings-Shared-ENV"
$sharedTemplatefile = "shared\shared.json"
$sharedParametersfile = "shared\shared.ENV.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $sharedResourceGroupName `
                                   -TemplateFile $sharedTemplatefile `
                                   -TemplateParameterFile $sharedParametersfile `
                                   -Force -Verbose

$apiResourceGroupName = "Group-Savings-Api-ENV"
$apiTemplatefile = "api\api.json"
$apiParametersfile = "api\api.ENV.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $apiResourceGroupName `
                                   -TemplateFile $apiTemplatefile `
                                   -TemplateParameterFile $apiParametersfile `
                                   -Force -Verbose

$clientResourceGroupName = "Group-Savings-Client-ENV"
$clientTemplatefile = "client\client.json"
$clientParametersfile = "client\client.ENV.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $clientResourceGroupName `
                                   -TemplateFile $clientTemplatefile `
                                   -TemplateParameterFile $clientParametersfile `
                                   -Force -Verbose


$jumpboxResourceGroupName = "Group-Savings-Jumpboxes-ENV"
$jumpboxTemplatefile = "jumpbox\jumpbox.json"
$jumpboxParametersfile = "jumpbox\jumpbox.ENV.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $jumpboxResourceGroupName `
                                   -TemplateFile $jumpboxTemplatefile `
                                   -TemplateParameterFile $jumpboxParametersfile `
                                   -Force -Verbose

$eventstoreResourceGroupName = "Group-Savings-Eventstore-ENV"
$eventstoreTemplatefile = "eventstore\eventstore.json"
$eventstoreParametersfile = "eventstore\eventstore.ENV.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $eventstoreResourceGroupName `
                                   -TemplateFile $eventstoreTemplatefile `
                                   -TemplateParameterFile $eventstoreParametersfile `
                                   -Force -Verbose

$elasticsearchResourceGroupName = "Group-Savings-Elasticsearch-ENV"
$elasticsearchTemplatefile = "elasticsearch\elasticsearch.json"
$elasticsearchParametersfile = "elasticsearch\elasticsearch.ENV.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $elasticsearchResourceGroupName `
                                   -TemplateFile $elasticsearchTemplatefile `
                                   -TemplateParameterFile $elasticsearchParametersfile `
                                   -Force -Verbose

$elasticsearchResourceGroupName = "Group-Savings-Sql-ENV"
$elasticsearchTemplatefile = "sql\sql.json"
$elasticsearchParametersfile = "sql\sql.ENV.json"

New-AzureRmResourceGroupDeployment -ResourceGroupName $elasticsearchResourceGroupName `
                                   -TemplateFile $elasticsearchTemplatefile `
                                   -TemplateParameterFile $elasticsearchParametersfile `
                                   -Force -Verbose





param ASP_Location string
param ASP_Name string


resource azbicepASP1 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: ASP_Name//'app-dev-southcentralus-aSP1'
  location: ASP_Location//resourceGroup().location //
  sku: {
    name: 'f1'
    capacity: 1
  }
}

/*resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: 'name'
  location: location
  tags: {
    'hidden-related:${resourceGroup().id}/providers/Microsoft.Web/serverfarms/appServicePlan': 'Resource'
  }
  properties: {
    serverFarmId: 'webServerFarms.id'
  }
}
*/


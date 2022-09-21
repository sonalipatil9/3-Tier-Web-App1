//App Service Plan
param aspLocation string
param aspName string


resource azbicepASP1 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: aspName//'app-dev-southcentralus-aSP1'
  location: aspLocation//resourceGroup().location //
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


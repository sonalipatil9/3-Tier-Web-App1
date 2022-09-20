//@description('Specifies the location for resources.')
targetScope = 'subscription'

param location string //= 'southcentralus'
param name string //= 'rg-azuretraining-dev-001'

//param rgName string
//param location string

resource azbicepresourcegroup 'Microsoft.Resources/resourceGroups@2021-04-01' ={
  name: name //rgName
  location: location
}
//output name string = azbicepresourcegroup.name

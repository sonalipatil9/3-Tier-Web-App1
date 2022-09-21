//@description('Specifies the location for resources.')
targetScope = 'subscription'
param location string 
param rgName string 

resource azbicepresourcegroup 'Microsoft.Resources/resourceGroups@2021-04-01' ={
  name: rgName 
  location: location
}
//output name string = azbicepresourcegroup.name

targetScope = 'subscription'
//1.Resource Group
param resourceGrpName string='rg-azuretraining-dev-002'
param location string = 'southcentralus'

//2.AppServicePlan
param appServicePlanName string = 'plan-azuretraining-dev-002'


//Database
param serverName string ='sql-azuretraining-dev'
param dbName string = 'sqldb-sqluser-dev'

//vnet 
param vnetworkName string = 'vnet-azuretraining-southcentralus-002'
param subnetName1 string = 'snet-azuretraining-southcentralus-001'
param subnetName2 string = 'snet-azuretraining-southcentralus-002'

//1.ResourceGroup Module
module resourceGroup 'resourcegroup.bicep' = {
  name:resourceGrpName
  params: {
   location:location
   rgName:resourceGrpName
 }
  
}

//2.Appl service Plan

module appserviceplan 'appserviceplan.bicep' = {
  name: appServicePlanName
  scope: az.resourceGroup(resourceGrpName)
  params: {
    aspLocation: location
    aspName: appServicePlanName
  }
}

//SQL Database
module sqldb 'sqldatabase.bicep' = {
  name:'sqldb'
  scope: az.resourceGroup(resourceGrpName)
  params: {
    location: location
    sqlDbName: dbName
    sqlSerName: serverName
  }
}

//Vnet

module vnet 'vnet.bicep' = {
  name:'vnet'
  scope: az.resourceGroup(resourceGrpName)
   params: {
    location: location
    subnetName1: subnetName1
    subnetName2: subnetName2
    vnetName: vnetworkName
   }

}

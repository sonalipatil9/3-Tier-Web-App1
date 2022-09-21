// SQL Database
param sqlSerName string 
param sqlDbName string 
param location string 

resource azsqlserver 'Microsoft.Sql/servers@2014-04-01' ={
  //parent: vnet
  name: sqlSerName 
  //scope:az.resourceGroup(resourceGroup())
  location: location
  properties: {
    administratorLogin:'sqladmin'
    administratorLoginPassword:'Test@123456'
  }
}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: azsqlserver
  name: sqlDbName
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '2147483648'
    requestedServiceObjectiveName: 'Basic'
  }
}


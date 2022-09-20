//targetScope = 'subscription'
param Sql_Ser_Name string //= 'sql-sqlserver-dev-001'
param location string //= 'southcentralus'
param Sql_Db_Name string //='sqldb-sqluser-dev'



resource azsqlserver 'Microsoft.Sql/servers@2014-04-01' ={
  name: Sql_Ser_Name //Sql_Ser_Name
  //scope:az.resourceGroup(resourceGroup())
  location: location
  properties: {
    administratorLogin:'sqladmin'
    administratorLoginPassword:'Test@123456'
  }
}

resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: azsqlserver
  name: Sql_Db_Name
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '2147483648'
    requestedServiceObjectiveName: 'Basic'
  }
}


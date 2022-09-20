targetScope = 'subscription'

param resourceGrpName string='rg-azuretraining-dev-002'
param location string = 'southcentralus'

//param A_Location string = 'app-dev-southcentralus-aSP1'
param A_Name string = 'app-dev-southcentralus-ASP1'

//3. WebApp 
//param Web_App_Name string = 'app-webapp-dev-001'

//4. 
param Server_Name string ='sql-azuretraining-dev-001'
param Db_Name string = 'sqldb-sqluser-dev'

module resourceGroup '1.ResourceGroup.bicep' = {
  name:resourceGrpName
 params: {
   location:location
    name:resourceGrpName
 }
  
}

//Application service Plan

module ASP '2.AppServicePlan.bicep' = {
  name: A_Name
  scope: az.resourceGroup(resourceGrpName)
  params: {
    ASP_Location: location
    ASP_Name:  A_Name
  }
}


module SQLDb '4.SqlDb.bicep' = {
  name:'SQLDb'
  scope: az.resourceGroup(resourceGrpName)
  params: {
    location: location
    Sql_Db_Name: Db_Name
    Sql_Ser_Name: Server_Name
  }

}
/*
output asp_name string ASP.name
//Web app

/*module WebApp = {
  name: Web_App_Name
  scope:az.resourceGroup(resourceGrpName)
  params: {
    App_Name: Web_App_Name
    Web_App_location: location
  }
}

module WebApp '2.AppServicePlan.bicep' ={
  name:
}

*/



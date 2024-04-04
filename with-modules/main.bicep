param pAppServiceplan string = 'az-bicep-plan'
param pAppService string = 'az-bicep-webapp'
param pAppInsights string = 'az-bicep-appin'
param pSQLServer string = 'az-bicep-sqlserver'

module AppServicePlan 'webapp.bicep' = {
  name: 'AppServicePlan'
  params: {
    pAppInsights: pAppInsights
    pAppService: pAppService
    pAppServiceplan: pAppServiceplan
  }
}

module SQLDatabase 'sql.bicep' = {
  name: 'SQLDatabase'
  params: {
    pSQLServer: pSQLServer
  }
}



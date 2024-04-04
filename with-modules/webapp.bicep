param pAppServiceplan string 
param pAppService string 
param pAppInsights string 

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: pAppServiceplan
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: pAppService
  location: resourceGroup().location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', 'az-bicep-plan')
  }
  dependsOn: [
    appServicePlan
  ]
}
resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: pAppInsights
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

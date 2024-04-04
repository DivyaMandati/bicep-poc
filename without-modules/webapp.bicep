resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'az-bicep-plan'
  location: resourceGroup().location
  sku: {
    name: 'S1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: 'az-bicep-webapp'
  location: resourceGroup().location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', 'az-bicep-plan')
  }
  dependsOn: [
    appServicePlan
  ]
}
resource appInsightsComponents 'Microsoft.Insights/components@2020-02-02' = {
  name: 'az-bicep-appin'
  location: resourceGroup().location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

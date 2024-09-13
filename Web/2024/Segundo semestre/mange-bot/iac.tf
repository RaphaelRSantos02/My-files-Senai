terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.0.1"
    }
  }
}

provider "azurerm" {
    resource_provider_registrations = "none"
    subscription_id = "481c1d25-e4df-4209-9f20-6d3c0c28a214"
    features {
      
    } 
}

resource "azurerm_resource_group" "raphael-robot-t-group" {
  name = "raphael-robot-t-group"
  location = "eastus2"
}

resource "azurerm_service_plan" "raphael-robot-t-sp" {
  name = "raphael-robot-t-sp"
  resource_group_name = azurerm_resource_group.raphael-robot-t-group.name
  location = azurerm_resource_group.raphael-robot-t-group.location
  sku_name = "B1"
  os_type = "Windows"
}

resource "azurerm_windows_web_app" "raphael-robot-t-app" {
    name = "raphael-robot-t-app"
    resource_group_name = azurerm_resource_group.raphael-robot-t-group.name
    location = azurerm_resource_group.raphael-robot-t-group.location
    service_plan_id = azurerm_service_plan.raphael-robot-t-sp.id
    site_config {
      always_on = false
    }
}
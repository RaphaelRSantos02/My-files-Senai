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
    subscription_id = "250ae9c3-6c33-4030-b72a-ed22fce22920"
    features {
      
    } 
}

resource "azurerm_resource_group" "raphael-robot-t5-group" {
  name = "raphael-robot-t5-group"
  location = "Brazil South"
}

resource "azurerm_service_plan" "raphael-robot-t5-sp" {
  name = "raphael-robot-t5-sp"
  resource_group_name = azurerm_resource_group.raphael-robot-t5-group.name
  location = azurerm_resource_group.raphael-robot-t5-group.location
  sku_name = "S1"
  os_type = "Windows"
}

resource "azurerm_windows_web_app" "raphael-robot-t5-app" {
    name = "raphael-robot-t5-app"
    resource_group_name = azurerm_resource_group.raphael-robot-t5-group.name
    location = azurerm_resource_group.raphael-robot-t5-group.location
    service_plan_id = azurerm_service_plan.raphael-robot-t5-sp.id
    site_config {
      always_on = false
    }
}
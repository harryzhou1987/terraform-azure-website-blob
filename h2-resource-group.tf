# Create a resource group
resource "azurerm_resource_group" "app_resource_group" {
  name     = "app_resource_group"
  location = "Australia East"
}

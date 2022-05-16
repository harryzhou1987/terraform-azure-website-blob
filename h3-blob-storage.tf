
resource "azurerm_storage_account" "storage_account" {
  name                = "staticwebonazureblob"
  resource_group_name = azurerm_resource_group.app_resource_group.name
  location            = azurerm_resource_group.app_resource_group.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2" # For static website, account_kind can only be set to StorageV2 or BlockBlobStorage

  enable_https_traffic_only = true

  static_website {
    index_document = "index.html"
  }

  tags = {
    "Created By" = "Harry Zhou"
    "Team"       = "App"
  }
}

resource "azurerm_storage_blob" "blob" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<h3>This website is deployed with Terraform on Azure Blob Storage</h3>"
}

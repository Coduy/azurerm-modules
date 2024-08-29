resource "azurerm_container_app" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  container_app_environment_id = var.environment_id
  revision_mode = "Single"

  template {
    
    container {
      name   = var.name
      image  = var.container_image
      cpu    = var.cpu
      memory = var.memory
     }
    }

    ingress {
      external_enabled = var.ingress.external
      target_port      = var.ingress.target_port
      transport        = var.ingress.transport
   
    traffic_weight {
      latest_revision = true  # Route traffic to the latest revision
      percentage      = 100   # 100% of the traffic
    }
    }


}

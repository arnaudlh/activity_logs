# Configures the Azure Activity Logs for a subscription

Configures the Azure Activity Logs rention for a subscription into:
1. Event Hub for short term and fast access.
2. Storage account for long term retention. 

Reference the module to a specific version (recommended):
```
module "activity_logs" {
    source                  = "git://github.com/aztfmod/activity_logs.git?ref=v0.3"
  
    resource_group_name   = var.rg
    location              = var.locations
    tags                  = var.tags
    prefix                = var.prefix
    logs_rentention       = var.retention
}
```

Or get the latest version
```
module "activity_logs" {
    source                  = "git://github.com/aztfmod/activity_logs.git?ref=latest"
  
    resource_group_name   = var.rg
    location              = var.locations
    tags                  = var.tags
    prefix                = var.prefix
    logs_rentention       = var.retention
}
```

# Parameters

## resource_group_name
(Required) (Required) Name of the resource group to deploy the activity logs.
```
variable "resource_group_name" {
  description = "(Required) Name of the resource group to deploy the activity logs."
}

```
Example
```
    resource_group_name   = "myrg" 
```

## location
(Required) Define the region where the resources will be created
```

variable "location" {
  description = "(Required) Define the region where the resources will be created"
}
```
Example
```
    location   = "southeastasia"
```

## tags
(Required) Map of tags for the deployment
```
variable "tags" {
  description = "(Required) map of tags for the deployment"
}
```
Example
```
tags = {
    environment     = "DEV"
    owner           = "Arnaud"
    deploymentType  = "Terraform"
  }
```

## prefix
(Optional) You can use a prefix to add to the list of resource groups you want to create
```
variable "prefix" {
    description = "(Optional) You can use a prefix to add to the list of resource groups you want to create"
}
```
Example
```
locals {
    prefix = "${random_string.prefix.result}-"
}

resource "random_string" "prefix" {
    length  = 4
    upper   = false
    special = false
}
```

## logs_rentention
(Required) Number of days to keep the logs for long term retention (storage account)"
```
variable "logs_rentention" {
  description = "(Required) Number of days to keep the logs for long term retention"
}
```
Example
```
logs_rentention = 60
```

# Output
"seclogs_map" {
    value = "${
        map(
            "activity_sa", "${azurerm_storage_account.log.id}",
            "activity_eh_name",  "${azurerm_eventhub_namespace.log.name}",
            "activity_eh_id", "${azurerm_eventhub_namespace.log.id}"
        )
    }"
}
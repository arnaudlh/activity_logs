variable "resource_group_name" {
  description = "(Required) Name of the resource group to deploy the KV"
}

variable "location" {
  description = "(Required) Define the region where the resources will be created"
}

variable "tags" {
  description = "(Required) Tags for the logs repositories to be created "
  
}

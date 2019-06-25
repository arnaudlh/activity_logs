##export the logging details for EH and SA
output "eh_logs_id" {
  depends_on = [azurerm_eventhub_namespace.log]

  value = azurerm_eventhub_namespace.log.id
}

output "eh_logs_name" {
  depends_on = [azurerm_eventhub_namespace.log]

  value = azurerm_eventhub_namespace.log.name
}

output "sa_logs_id" {
  depends_on = [azurerm_storage_account.log]

  value = azurerm_storage_account.log.id
}


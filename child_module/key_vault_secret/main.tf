data "azurerm_key_vault_secret" "vm_password" {
  name         = "sonu-vm-password"
  key_vault_id = var.key_vault_id
}

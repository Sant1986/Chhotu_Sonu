data "azurerm_key_vault_secret" "vm_password" {
  name         = "sonu-vm-password"
  key_vault_id = var.key_vault_id
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.name
  location            = var.vm_location != "" ? var.vm_location : var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size

  admin_username = var.admin_username
  admin_password = data.azurerm_key_vault_secret.vm_password.value

  network_interface_ids = [var.nic_id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}


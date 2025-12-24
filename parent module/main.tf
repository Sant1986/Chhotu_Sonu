module "rg" {
  source   = "../child_module/resource_group"
  name     = "sonurgs"
  location = var.location
}

module "storage" {
  depends_on = [ module.rg ]
  source              = "../child_module/storage_account"
  name                = "sonustg"
  location            = var.location
  resource_group_name = module.rg.rg_name
}

module "vnet" {
  source              = "../child_module/vnet"
  name                = "sonuvnet"
  location            = var.location
  resource_group_name = module.rg.rg_name
}

module "subnet" {
  source               = "../child_module/subnet"
  name                 = "sonusubnet"
  resource_group_name  = module.rg.rg_name
  virtual_network_name = module.vnet.vnet_name
}

module "nsg" {
  source              = "../child_module/nsg"
  name                = "sonu-nsg"
  location            = var.location
  resource_group_name = module.rg.rg_name
  subnet_id           = module.subnet.subnet_id
}


module "pip" {
  source              = "../child_module/pip"
  name                = "sonupip"
  location            = var.location
  resource_group_name = module.rg.rg_name
}

module "nic" {
  source              = "../child_module/nic"
  name                = "sonunic"
  location            = var.location
  resource_group_name = module.rg.rg_name
  subnet_id           = module.subnet.subnet_id
  public_ip_id        = module.pip.pip_id
}

module "vm" {
  source              = "../child_module/vm"
  name                = "sonuvm"
  location            = var.location
  vm_location         = var.vm_location
  vm_size             = var.vm_size
  resource_group_name = module.rg.rg_name
  nic_id              = module.nic.nic_id
  admin_username      = var.admin_username
  key_vault_id        = module.key_vault.key_vault_id
}


module "key_vault" {
  source              = "../child_module/key_vault"
  location            = var.location
  resource_group_name = module.rg.rg_name
}

module "key_vault_secret" {
  depends_on = [ module.key_vault ]
  source        = "../child_module/key_vault_secret"
  key_vault_id = module.key_vault.key_vault_id
}

module "sql" {
  source              = "../child_module/sql"
  location            = var.location
  sql_location        = var.sql_location
  resource_group_name = module.rg.rg_name
  admin_password      = var.admin_password
}

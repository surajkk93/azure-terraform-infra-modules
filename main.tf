module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.rg_name
  location = var.location
}
module "network" {
  source          = "./modules/network"
  vnet_name       = "portfolio-vnet"
  address_space   = ["10.0.0.0/16"]
  subnet_name     = "default-subnet"
  subnet_prefixes = ["10.0.1.0/24"]
  location        = var.location
  rg_name         = module.resource_group.rg_name
  nsg_id          = module.nsg.nsg_id
}
module "nsg" {
  source   = "./modules/nsg"
  nsg_name = "portfolio-nsg"
  location = var.location
  rg_name  = module.resource_group.rg_name
}
module "vm" {
  source          = "./modules/virtual_machine"
  vm_name         = "portfolio-vm"
  location        = var.location
  rg_name         = module.resource_group.rg_name
  subnet_id       = module.network.subnet_id
  ssh_public_key  = var.ssh_public_key
}

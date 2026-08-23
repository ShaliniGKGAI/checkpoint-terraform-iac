terraform {
  required_version = ">= 1.5.0"

  required_providers {
    checkpoint = {
      source  = "CheckPointSW/checkpoint"
      version = "~> 1.5"
    }
  }
}

provider "checkpoint" {
  server   = var.checkpoint_server
  username = var.checkpoint_username
  password = var.checkpoint_password
  context  = "web"
}

module "network_objects" {
  source = "./modules/network-objects"

  environment = var.environment
}

module "firewall_rules" {
  source = "./modules/firewall-rules"

  environment      = var.environment
  network_objects  = module.network_objects
}
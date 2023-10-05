terraform {
    required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

  cloud {
    organization = "lewis-sawe"

    workspaces {
      name = "Terra-House-1"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_hamilton_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.hamilton.public_path
  content_version = var.hamilton.content_version
}

resource "terratowns_home" "home_hamilton" {
  name = "Lewis Hamilton the GOAT!!!"
  description = <<DESCRIPTION
Lewis Hamilton, the epitome of Formula 1 greatness, 
dazzles the world as the unparalleled GOAT, 
rewriting history with his seven mesmerizing World Championships and 
igniting passion beyond the racetrack through his glamorous lifestyle, 
iconic fashion, and unwavering dedication to social change
DESCRIPTION
  domain_name = module.home_hamilton_hosting.domain_name
  town = "missingo"
  content_version = var.hamilton.content_version
}

module "home_biryani_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.biryani.public_path
  content_version = var.biryani.content_version
}

resource "terratowns_home" "home_biryani" {
  name = "Biryani Recipe!!!"
  description = <<DESCRIPTION
Biryani is a flavorful and aromatic South Asian dish 
known for its rich taste and unique blend of spices.
DESCRIPTION
  domain_name = module.home_biryani_hosting.domain_name
  town = "missingo"
  content_version = var.biryani.content_version
}

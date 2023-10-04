terraform {
    required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

#   cloud {
#     organization = "lewis-sawe"

#     workspaces {
#       name = "Terra-House-1"
#     }
#   }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  assets_path = var.assets_path
  content_version = var.content_version
}

resource "terratowns_home" "home" {
  name = "Lewis Hamilton the GOAT!!!"
  description = <<DESCRIPTION
Lewis Hamilton, the epitome of Formula 1 greatness, 
dazzles the world as the unparalleled GOAT, 
rewriting history with his seven mesmerizing World Championships and 
igniting passion beyond the racetrack through his glamorous lifestyle, 
iconic fashion, and unwavering dedication to social change
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  town = "missingo"
  content_version = 1
}
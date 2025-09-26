terraform {
  required_version = ">= 1.0.11"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.5.0"
    }
  }
#   bucket used for storing Terraform state files
  backend "gcs" {
      bucket = "secure-current-472518-k7"
      prefix = "terraform/dev"
  }
}
provider "google" {
  project = "secure-current-472518-k7"
}
module "web_app" {
  source = "../modules/web"
  env = "dev"
}
output "ip" {
  value = module.web_app.web_server_ip
}
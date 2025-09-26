#terraform block
terraform { 
  cloud { 
    
    organization = "Chiranjeev-demo-" 

    workspaces { 
      name = "Chiranjeev-demo" 
    } 
  } 
}
provider "google" {
  project = "secure-current-472518-k7"
}
resource "google_compute_instance" "vm" {
  name         = "created-with-terraform-cloud"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "default"
  }
}
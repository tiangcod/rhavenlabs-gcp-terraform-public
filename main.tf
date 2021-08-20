provider "google" {
  credentials = file("../security/vm_admin_cred.json") // use your serivce account key
  project = "sodium-hangar-322720" // project id not the name
  region = "us-west1"
  zone = "us-west1-c"
}

resource "google_compute_instance" "rhaven_lab" {
    name            = "rhaven_lab"
    machine_type    = "f1-micro"
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9" // VM image
        }
    }
    network_interface {
        network = "default" // this will enable private IP address
        access_config{}     // this will enable public IP address
    }
}
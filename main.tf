provider "google" {
  credentials = file("../security/sodium-hangar-322720-7490851b18ef.json") // use your serivce account key
  project = "rhaven-terraform-lab"
  region = "us-west1"
  zone = "us-west1-c"
}

resource "google_compute_instance" "rhaven_lab" {
    name            = "rhaven_lab"
    machine_type    = "e2-micro"
    boot_disk {
        initialize_params {
            image = "Debian GNU/Linux 10"
        }
    }
    network_interface {
        network = "default" // this will enable private IP address
        access_config{}     // this will enable public IP address
    }
}
resource "google_compute_instance" "new_vm" {
  # (resource arguments)
  name         = "new-test-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20210510"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}

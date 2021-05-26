resource "google_compute_instance" "controller_vm" {
  count = length(var.controllers)
  name         = var.controllers[count.index]
  machine_type = "e2-standard-2"

  boot_disk {
    initialize_params {
      size = "200"
      image = "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20210510"
    }
  }

  can_ip_forward = "true"
  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }
  network_interface {
    network_ip = "10.240.0.1${count.index}"
    subnetwork = google_compute_subnetwork.k8s_network.id
  }
  
  tags = ["kubernetes", "controller"]

}
resource "google_compute_instance" "worker_vm" {
  count = length(var.workers)
  name         = var.workers[count.index]
  machine_type = "e2-standard-2"

  boot_disk {
    initialize_params {
      size = "200"
      image = "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20210510"
    }
  }

  can_ip_forward = "true"
  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }
  network_interface {
    network_ip = "10.240.0.2${count.index}"
    subnetwork = google_compute_subnetwork.k8s_network.id
  }

  metadata = {
    pod-cidr = "10.200.${count.index}.0/24"
  }
  
  tags = ["kubernetes", "worker"]

}

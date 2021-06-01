resource "google_compute_instance" "ansible_agent" {
  name         = "ansible-agent"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      size = 50
      image = "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20210510"
    }
  }

  network_interface {
    network_ip = "10.240.1.2"
    subnetwork = google_compute_subnetwork.agent_network.id
  }
  metadata_startup_script = "${file("./install-ansible.sh")}"

}

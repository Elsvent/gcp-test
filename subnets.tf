resource "google_compute_subnetwork" "k8s_network" {
  name          = "k8s-network"
  ip_cidr_range = "10.240.0.0/24"
  region        = "us-west1"
  network       = google_compute_network.k8s_vpc.id
  secondary_ip_range {
    range_name    = "tf-test-secondary-range-update1"
    ip_cidr_range = "192.168.10.0/24"
  }
}

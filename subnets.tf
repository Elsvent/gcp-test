resource "google_compute_subnetwork" "k8s_network" {
  name          = "k8s-network"
  ip_cidr_range = "10.240.0.0/24"
  region        = "us-west1"
  network       = google_compute_network.k8s_vpc.id
}
resource "google_compute_subnetwork" "agent_network" {
  name          = "agent-network"
  ip_cidr_range = "10.240.1.0/29"
  region        = "us-west1"
  network       = google_compute_network.k8s_vpc.id
}

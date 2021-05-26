resource "google_compute_network" "k8s_vpc"{
  name = "k8s-vpc"
  auto_create_subnetworks = "false"
}

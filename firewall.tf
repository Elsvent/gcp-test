resource "google_compute_firewall" "k8s_firewall_external" {
  name    = "k8s-firewall-external"
  network = google_compute_network.k8s_vpc.name
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "6443"]
  }
}

resource "google_compute_firewall" "k8s_firewall_internal" {
  name    = "k8s-firewall-internal"
  network = google_compute_network.k8s_vpc.name
  source_ranges = ["10.240.0.0/24", "10.200.0.0/16"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }
}


# Specify the provider (GCP, AWS, Azure)
provider "google" {
credentials = "${file("credential.json")}"
project = "quixotic-card-311709"
region = "us-west1"
zone = "us-west1-a"
}

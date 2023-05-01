variable "project_id" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = ""
}

variable "zone" {
  type    = string
  default = ""
}

variable "cluster_name" {
  type    = string
  default = ""
}

provider "google" {
  credentials = "${file("credentials.json")}"
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

resource "google_container_cluster" "example_cluster" {
  name               = "example-cluster"
  initial_node_count = 3
  node_config {
    machine_type = "n1-standard-1"
    disk_size_gb = 100
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

resource "google_container_cluster" "primary" {
  name               = var.cluster
  location           = var.gcp_zone_1
  initial_node_count = 1


  node_config {
    machine_type    = var.machine_type
    service_account = google_service_account.service_account_1.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      app = var.app_name
    }

    tags = ["app", var.app_name]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}

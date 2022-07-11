resource "google_compute_firewall" "rules" {
  project     = var.app_project
  name        = "my-firewall-rule"
  network     = google_compute_network.vpc.name
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }
  source_tags = ["foo"]
  target_tags = ["web"]
}

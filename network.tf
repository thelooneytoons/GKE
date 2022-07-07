resource "google_compute_network" "vpc" {
  name                    = "${var.app_name}-vpc"
  auto_create_subnetworks = "true"
  routing_mode            = "GLOBAL"
}


resource "google_compute_address" "nat-ip" {
  name    = "thelt-ipv4-address"
  project = var.app_project
  region  = var.gcp_region_1
}


# create a nat to allow private instances connect to internet
resource "google_compute_router" "nat-router" {
  name    = "${var.app_name}-nat-router"
  network = google_compute_network.vpc.name
}
resource "google_compute_router_nat" "nat-gateway" {
  name                               = "${var.app_name}-nat-gateway"
  router                             = google_compute_router.nat-router.name
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [google_compute_address.nat-ip.self_link]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  depends_on                         = [google_compute_address.nat-ip]
}
output "nat_ip_address" {
  value = google_compute_address.nat-ip.address
}


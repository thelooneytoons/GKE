terraform {
  required_version = ">= 0.12"
}
provider "google" {
  project = var.app_project
  region  = var.gcp_region_1
  zone    = var.gcp_zone_1
}

resource "google_service_account" "service_account_1" {
  account_id   = "the-looneytoons-task-123456"
  display_name = "the-looneytoons-task-123456"
  project      = var.app_project
}

resource "google_project_iam_binding" "project" {
  project = var.app_project
  role    = "roles/cloudsql.client"
  members = [
    "serviceAccount:${google_service_account.service_account_1.email}",
  ]

}

resource "google_project_iam_binding" "project-2" {
  project = var.app_project
  role    = "roles/container.admin"
  members = [
    "serviceAccount:${google_service_account.service_account_1.email}",
  ]
}

resource "google_project_iam_binding" "project-3" {
  project = var.app_project
  role    = "roles/roles/logging.admin"
  members = [
    "serviceAccount:${google_service_account.service_account_1.email}",
  ]
}

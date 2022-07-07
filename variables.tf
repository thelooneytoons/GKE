variable "app_project" {
  type        = string
  description = "GCP project name"
}
# define GCP region
variable "gcp_region_1" {
  type        = string
  description = "GCP region"
}
# define GCP zone
variable "gcp_zone_1" {
  type        = string
  description = "GCP zone"
}
variable "app_name" {
  type = string
}


variable "machine_type" {
  type = string
}

variable "cluster" {
  type = string
}
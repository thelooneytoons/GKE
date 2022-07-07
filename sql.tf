resource "google_sql_database_instance" "master" {
  name             = "sql-instance-8"
  database_version = "MYSQL_5_7"
  region           = var.gcp_region_1
  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_database" "database" {
  name      = "sql-db-2"
  instance  = google_sql_database_instance.master.name
  charset   = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "users" {
  name     = "new-user-5"
  instance = google_sql_database_instance.master.name
}

resource "google_sql_database_instance" "suboq_db" {
  database_version    = "POSTGRES_16"
  instance_type       = "CLOUD_SQL_INSTANCE"
  name                = "${var.project}01"
  project             = var.project
  region              = var.region

  settings {
    activation_policy = "ALWAYS"
    availability_type = "ZONAL"

    backup_configuration {
      backup_retention_settings {
        retained_backups = 7
        retention_unit   = "COUNT"
      }

      enabled                        = true
      location                       = "eu"
      point_in_time_recovery_enabled = true
      start_time                     = "19:00"
      transaction_log_retention_days = 7
    }

    connector_enforcement       = "NOT_REQUIRED"
    deletion_protection_enabled = true
    disk_autoresize             = true
    disk_autoresize_limit       = 0
    disk_size                   = 100
    disk_type                   = "PD_SSD"
    edition                     = "ENTERPRISE"

    ip_configuration {
      enable_private_path_for_google_cloud_services = true
      ipv4_enabled                                  = false
      private_network                               = "projects/${var.project}/global/networks/suboq"
    }

    location_preference {
      zone = var.zone
    }

    maintenance_window {
        day          = 1         # 1 = Monday, 7 = Sunday
        hour         = 3         # 3 AM UTC
        update_track = "canary"
    }

    pricing_plan = "PER_USE"
    tier         = "db-custom-4-16384"
  }
}

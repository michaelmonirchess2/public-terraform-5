resource "google_cloud_run_v2_service" "suboq_frontend" {
  client         = "gcloud"
  client_version = "502.0.0"
  ingress        = "INGRESS_TRAFFIC_ALL"
  launch_stage   = "GA"
  location       = var.region
  name           = "suboq-frontend"
  project        = var.project

  template {
    containers {
      image = "asia-northeast1-docker.pkg.dev/${var.project}/${var.project}/suboq-frontend:1.0.0"

      ports {
        container_port = 8080
        name           = "http1"
      }

      resources {
        cpu_idle = true
        limits = {
          cpu    = "1000m"
          memory = "512Mi"
        }
        startup_cpu_boost = true
      }

      startup_probe {
        failure_threshold     = 1
        initial_delay_seconds = 0
        period_seconds        = 240

        tcp_socket {
          port = 8080
        }

        timeout_seconds = 240
      }
    }

    max_instance_request_concurrency = 80

    scaling {
      max_instance_count = 3
    }

    service_account = "deployer@${var.project}.iam.gserviceaccount.com"
    timeout         = "300s"
  }

  traffic {
    percent = 100
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
  }
}


resource "google_cloud_run_v2_service" "suboq" {
  client         = "gcloud"
  client_version = "503.0.0"
  ingress        = "INGRESS_TRAFFIC_ALL"
  launch_stage   = "GA"
  location       = var.region
  name           = "suboq"
  project        = var.project

  template {
    containers {
      env {
        name  = "DB_HOST"
        value = "10.35.176.3"
      }

      env {
        name  = "DB_PORT"
        value = "5432"
      }

      env {
        name  = "DB_USER"
        value = "postgres"
      }

      env {
        name  = "DB_NAME"
        value = var.project
      }

      env {
        name  = "PRIVATE_IP"
        value = "TRUE"
      }

      env {
        name = "DB_PASSWORD"
        value_source {
          secret_key_ref {
            secret  = "projects/${var.project}/secrets/${var.project}-db"
            version = "latest"
          }
        }
      }

      image = "asia-northeast1-docker.pkg.dev/${var.project}/${var.project}/suboq:0.0.10"

      ports {
        container_port = 8080
        name           = "http1"
      }

      resources {
        cpu_idle = true
        limits = {
          cpu    = "1000m"
          memory = "512Mi"
        }
        startup_cpu_boost = true
      }

      startup_probe {
        failure_threshold     = 1
        initial_delay_seconds = 0
        period_seconds        = 240

        tcp_socket {
          port = 8080
        }

        timeout_seconds = 240
      }

      volume_mounts {
        mount_path = "/cloudsql"
        name       = "cloudsql"
      }
    }

    max_instance_request_concurrency = 80

    scaling {
      max_instance_count = 3
    }

    service_account = "deployer@${var.project}.iam.gserviceaccount.com"
    timeout         = "300s"

    volumes {
      cloud_sql_instance {
        instances = ["${var.project}:me-central1:${var.project}01"]
      }
      name = "cloudsql"
    }

    vpc_access {
      connector = "projects/${var.project}/locations/${var.region}/connectors/suboq-vpc-connector"
      egress    = "ALL_TRAFFIC"
    }
  }

  traffic {
    percent = 100
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
  }
}

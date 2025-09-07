resource "google_cloud_scheduler_job" "scheduler_job" {
  name             = "scheduler-job"
  description      = "scheduler job that runs every day at mid-night"
  schedule         = "0 0 * * *"
  time_zone        = "Asia/Riyadh"
  attempt_deadline = "500s"  # 1 hour

  retry_config {
    retry_count = 3
  }

  http_target {
    http_method = "POST"
    uri = "https://api.${var.env}.suboq.io/trigger-scheduler-job"
    body        = base64encode("{}")

    headers = {
      "Content-Type"  = "application/json"
      "x-api-key"     = data.google_secret_manager_secret_version.suboq_scheduler_secret_value.secret_data
    }
  }
}

resource "google_pubsub_topic" "suboq_topic" {
  name    = "suboq-topic"
  project = var.project
}


resource "google_pubsub_subscription" "suboq_subscription" {
  name  = "suboq-subscription"
  topic = google_pubsub_topic.suboq_topic.id

  ack_deadline_seconds = 30

  # 20 minutes
  message_retention_duration = "1200s"
  retain_acked_messages      = true

  expiration_policy {
    ttl = "259200s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }
  push_config {
    push_endpoint = "https://api.${var.env}.suboq.io/event-handler"

    attributes = {
      x-goog-version = "v1"
    }
    oidc_token {
      audience              = "suboq-api"
      service_account_email = "pubsub-invoker-sa@suboq-${var.env}.iam.gserviceaccount.com"
    }
  }

  enable_message_ordering = false
}

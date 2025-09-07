resource "google_secret_manager_secret" "auth0_client_id" {
  project   = var.project
  secret_id = "AUTH0_CLIENT_ID"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret" "sendgrid_api_key" {
  project   = var.project
  secret_id = "sendgrid-api-key"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret" "db_user" {
  project   = var.project
  secret_id = "${var.project}-db-user"
  replication {
    auto {}
  }
}

resource "random_password" "db_password" {
  length  = 32
  special = false
}

resource "google_secret_manager_secret" "db" {
  project   = var.project
  secret_id = "${var.project}-db"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_password_value" {
  secret      = google_secret_manager_secret.db.id
  secret_data = random_password.db_password.result
}

resource "google_secret_manager_secret" "twilio_auth_token" {
  project   = var.project
  secret_id = "twilio-auth-token"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret" "zid_client_secret" {
  project   = var.project
  secret_id = "zid-client-secret"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret" "meta_client_secret" {
  project   = var.project
  secret_id = "meta-client-secret"
  replication {
    auto {}
  }
}


resource "random_password" "zid_webhook_secret" {
  length  = 32
  special = false
}
resource "google_secret_manager_secret" "zid_webhook_api_key" {
  project   = var.project
  secret_id = "zid-webhook-api-key"
  replication {
    auto {}
  }
}
resource "google_secret_manager_secret_version" "zid_webhook_secret_value" {
  secret      = google_secret_manager_secret.zid_webhook_api_key.id
  secret_data = random_password.zid_webhook_secret.result
}


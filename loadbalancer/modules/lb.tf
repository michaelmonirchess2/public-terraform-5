resource "google_compute_backend_service" "suboq_dev_frontend" {
  cdn_policy {
    cache_key_policy {
      include_host         = true
      include_protocol     = true
      include_query_string = true
    }

    cache_mode                   = "CACHE_ALL_STATIC"
    client_ttl                   = 3600
    default_ttl                  = 3600
    max_ttl                      = 86400
    signed_url_cache_max_age_sec = 0
  }

  backend {
    balancing_mode = "UTILIZATION"
    capacity_scaler = 1
    group = "https://www.googleapis.com/compute/v1/projects/${var.project}/regions/${var.region}/networkEndpointGroups/suboq-${var.environment}-frontend"
    max_connections = 0
    max_connections_per_endpoint = 0
    max_connections_per_instance = 0
    max_rate = 0
    max_rate_per_endpoint = 0
    max_rate_per_instance = 0
    max_utilization = 0
  }

  compression_mode                = "DISABLED"
  connection_draining_timeout_sec = 0
  enable_cdn                      = true
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  locality_lb_policy              = "ROUND_ROBIN"

  log_config {
    sample_rate = 0
  }

  name             = "suboq-dev-frontend"
  port_name        = "http"
  project          = var.project
  protocol         = "HTTPS"
  session_affinity = "NONE"
  timeout_sec      = 30
}

resource "google_compute_backend_service" "suboq_dev_lb_be_service" {
  cdn_policy {
    cache_key_policy {
      include_host         = true
      include_protocol     = true
      include_query_string = true
    }

    cache_mode                   = "CACHE_ALL_STATIC"
    client_ttl                   = 3600
    default_ttl                  = 3600
    max_ttl                      = 86400
    signed_url_cache_max_age_sec = 0
  }

  backend {
    balancing_mode = "UTILIZATION"
    capacity_scaler = 1
    group = "https://www.googleapis.com/compute/v1/projects/${var.project}/regions/${var.region}/networkEndpointGroups/suboq--${var.environment}-sneg"
    max_connections = 0
    max_connections_per_endpoint = 0
    max_connections_per_instance = 0
    max_rate = 0
    max_rate_per_endpoint = 0
    max_rate_per_instance = 0
    max_utilization = 0
  }

  compression_mode                = "DISABLED"
  connection_draining_timeout_sec = 0
  enable_cdn                      = true
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  locality_lb_policy              = "ROUND_ROBIN"

  log_config {
    sample_rate = 0
  }

  name             = "suboq-dev-lb-be-service"
  port_name        = "http"
  project          = var.project
  protocol         = "HTTPS"
  session_affinity = "NONE"
  timeout_sec      = 30
}
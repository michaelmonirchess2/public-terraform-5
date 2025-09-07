resource "google_pubsub_topic" "zid_data_extractor_topic" {
  name    = "zid-data-extractor-topic"
  project = var.project
}

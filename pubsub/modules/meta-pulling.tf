resource "google_pubsub_topic" "meta_data_extractor_topic" {
  name    = "meta-data-extractor-topic"
  project = var.project
}

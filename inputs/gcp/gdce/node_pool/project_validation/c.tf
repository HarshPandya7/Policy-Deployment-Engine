resource "google_edgecontainer_node_pool" "c" {
  name          = "np-staging_db-c"
  location      = "australia-southeast1"
  cluster       = "gdceclusterlabels-c"
  node_location = "us-central1-edge-customer-a"
  node_count    = 2
  project       = "gdce-dev"  #  Correct project
}

# Compliant Node Pool (uses provider default)
resource "google_edgecontainer_node_pool" "default_compliant" {
  name          = "np-dev-cache-default_compliant"
  location      = "australia-southeast1"
  cluster       = "gdceclusterlabels-c"
  node_location = "europe-west1-edge-customer-b"  #  Another approved location
  node_count    = 1
  #  No project specified - uses provider default
}
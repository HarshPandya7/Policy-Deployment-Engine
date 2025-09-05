resource "google_edgecontainer_node_pool" "basic_non_compliant" {
  name          = "invalid-name"           # Doesn't start with np-
  location      = "australia-southeast1"
  cluster       = "gdceclusterlabels-nc"   # Valid cluster (but will fail other checks)
  node_location = "invalid-location"       # Not approved location
  node_count    = 10                       # Exceeds max of 5
}
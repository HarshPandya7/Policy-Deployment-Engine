resource "google_edgecontainer_node_pool" "basic_non_compliant" {
  name          = "invalid-name"           # Doesn't start with np- #Required
  location      = "australia-southeast1" #Required
  cluster       = "gdceclusterlabels-nc"   # Valid cluster (but will fail other checks) #Required
  node_location = "invalid-location"       # Not approved location #Required
  node_count    = 10                       # Exceeds max of 5 #Required
}
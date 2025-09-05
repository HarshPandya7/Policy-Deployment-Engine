resource "google_edgecontainer_node_pool" "basic_compliant" {
  name          = "np-production-workers"  # ✅ Starts with np-
  location      = "australia-southeast1"
  cluster       = "gdceclusterlabels-c"    # ✅ Valid cluster
  node_location = "us-central1-edge-customer-a"  # ✅ Approved location
  node_count    = 3                        # ✅ Within 1-5 range
}
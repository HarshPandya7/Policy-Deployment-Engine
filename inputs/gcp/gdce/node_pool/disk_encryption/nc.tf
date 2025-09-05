resource "google_edgecontainer_node_pool" "non_compliant" {
  name          = "np-invalid-encryption"
  location      = "australia-southeast1"
  cluster       = "gdceclusterlabels-c"
  node_location = "us-central1-edge-customer-a"
  node_count    = 2

  local_disk_encryption {
    kms_key = "invalid-key-format"  # Invalid format
    # kms_key_state = "KEY_DISABLED"  # Problematic state (output)
  }
}
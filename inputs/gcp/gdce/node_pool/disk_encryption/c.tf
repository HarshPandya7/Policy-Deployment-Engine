resource "google_edgecontainer_node_pool" "compliant" {
  name          = "np-encrypted-workers"
  location      = "australia-southeast1"
  cluster       = "gdceclusterlabels-c"
  node_location = "us-central1-edge-customer-a"
  node_count    = 3

  local_disk_encryption {
    kms_key = "projects/gdce-dev/locations/us-central1/keyRings/gdce-key-ring/cryptoKeys/gdce-disk-key"  # ✅ Proper format
    # kms_key_state = "KEY_AVAILABLE"  # (Output - not set in config)
    # kms_key_active_version = "1"     # (Output - not set in config)
  }
}
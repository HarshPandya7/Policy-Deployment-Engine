resource "google_edgecontainer_vpn_connection" "non_compliant" {
  name     = "invalid-name"
  location = "invalid-region"
  cluster  = "invalid-cluster-format"
  router   = "invalid-router-format"  # ❌ Wrong router format
}

resource "google_edgecontainer_vpn_connection" "non_compliant_router" {
  name     = "vpn-test-connection"
  location = "australia-southeast1"
  cluster  = "projects/gdce-dev/locations/australia-southeast1/clusters/gdceclusterlabels-c"
  router   = "wrong-format"  # ❌ Invalid router format
}
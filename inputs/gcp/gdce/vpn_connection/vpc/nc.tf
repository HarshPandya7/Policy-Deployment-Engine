resource "google_edgecontainer_vpn_connection" "non_compliant" {
  name     = "invalid-name"  # ❌ Doesn't start with "vpn-"
  location = "invalid-region"  # ❌ Not approved location
  cluster  = "invalid-cluster-format"  # ❌ Wrong cluster format
  vpc      = "invalid-vpc-format"  # ❌ Wrong VPC format
}

resource "google_edgecontainer_vpn_connection" "non_compliant_vpc" {
  name     = "vpn-test-connection"
  location = "australia-southeast1"
  cluster  = "projects/gdce-dev/locations/australia-southeast1/clusters/gdceclusterlabels-c"
  vpc      = "wrong-format"  # ❌ Invalid VPC format
}
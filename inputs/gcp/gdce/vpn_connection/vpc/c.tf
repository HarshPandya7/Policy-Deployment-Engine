resource "google_edgecontainer_vpn_connection" "compliant" {
  name     = "vpn-production-cluster"
  location = "australia-southeast1"
  cluster  = "projects/gdce-dev/locations/australia-southeast1/clusters/gdceclusterlabels-c"
  vpc      = "projects/gdce-dev/global/networks/production-vpc"  # ✅ Optional but valid format
}

resource "google_edgecontainer_vpn_connection" "compliant_no_vpc" {
  name     = "vpn-staging-access"
  location = "us-central1"
  cluster  = "projects/gdce-dev/locations/us-central1/clusters/gdceclusterlabels-c"
  # ✅ No VPC specified - optional field
}
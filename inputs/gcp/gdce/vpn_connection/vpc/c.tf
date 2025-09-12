resource "google_edgecontainer_vpn_connection" "compliant" {
  name     = "vpn-production-cluster" #Required
  location = "australia-southeast1"  #Required
  cluster  = "projects/gdce-dev/locations/australia-southeast1/clusters/gdceclusterlabels-c" #Required
  vpc      = "projects/gdce-dev/global/networks/production-vpc"  #  Optional but valid format (Policy to be tested)
}

// resource "google_edgecontainer_vpn_connection" "compliant_no_vpc" {
//  name     = "vpn-staging-access"
//  location = "us-central1"
//  cluster  = "projects/gdce-dev/locations/us-central1/clusters/gdceclusterlabels-c"
//  #  No VPC specified - optional field
//}
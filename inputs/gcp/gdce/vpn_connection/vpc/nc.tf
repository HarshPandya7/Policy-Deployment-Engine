resource "google_edgecontainer_vpn_connection" "non_compliant" {
  name     = "invalid-name"  #  Doesn't start with "vpn-" #Required
  location = "invalid-region"  #  Not approved location #Required
  cluster  = "invalid-cluster-format"  #  Wrong cluster format #Required
  vpc      = "invalid-vpc-format"  #  Wrong VPC format (Policy to be tested)
}

//resource "google_edgecontainer_vpn_connection" "non_compliant_vpc" {
//  name     = "vpn-test-connection"
//  location = "australia-southeast1"
//  cluster  = "projects/gdce-dev/locations/australia-southeast1/clusters/gdceclusterlabels-c"
//  vpc      = "wrong-format"  #  Invalid VPC format
//}
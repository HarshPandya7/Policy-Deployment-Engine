resource "google_edgecontainer_vpn_connection" "compliant" {
  name     = "vpn-production-cluster" #Required
  location = "australia-southeast1" #Required
  cluster  = "projects/gdce-dev/locations/australia-southeast1/clusters/gdceclusterlabels-c" #Required
  router   = "projects/gdce-dev/locations/us-central1/routers/production-router"  #  Proper format (Policy to be tested)
}

resource "google_edgecontainer_vpn_connection" "compliant" {
  name     = "vpn-production-cluster"
  location = "australia-southeast1"
  cluster  = "projects/gdce-dev/locations/australia-southeast1/clusters/gdceclusterlabels-c"
  router   = "projects/gdce-dev/locations/us-central1/routers/production-router"  #  Proper format
}

resource "google_edgecontainer_vpn_connection" "compliant_no_router" {
  name     = "vpn-staging-access"
  location = "us-central1"
  cluster  = "projects/gdce-dev/locations/us-central1/clusters/gdceclusterlabels-c"
  #  No router specified - optional field
}
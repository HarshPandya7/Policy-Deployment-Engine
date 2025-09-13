resource "google_edgecontainer_vpn_connection" "nc" {
  name     = "invalid_name-nc" #Required
  location = "invalid-region" #Required
  cluster  = "invalid-cluster-format" #Required
  router   = "invalid-router-format"  #  Wrong router format  (Policy to be tested)
}

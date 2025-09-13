resource "google_edgecontainer_node_pool" "nc" {
  name          = "np-invalid_labels-nc" #Required
  location      = "australia-southeast1" #Required
  cluster       = "gdceclusterlabels-c" #Required
  node_location = "us-central1-edge-customer-a" #Required
  node_count    = 2  #Required

  node_config {
    labels = {
      #  Missing required labels: team, cost-center
      environment = "invalid-env"    #  Invalid environment value
      random      = "value"          #  Has random labels but missing required ones
    }
  }
}

resource "google_edgecontainer_node_pool" "nc-no_labels" {
  name          = "np-no-labels-nc-no_labels"
  location      = "australia-southeast1"
  cluster       = "gdceclusterlabels-c"
  node_location = "us-central1-edge-customer-a"
  node_count    = 1

  #  No node_config block at all - missing all required labels
}
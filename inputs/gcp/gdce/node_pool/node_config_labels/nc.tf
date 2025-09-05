resource "google_edgecontainer_node_pool" "non_compliant" {
  name          = "np-invalid-labels"
  location      = "australia-southeast1"
  cluster       = "gdceclusterlabels-c"
  node_location = "us-central1-edge-customer-a"
  node_count    = 2

  node_config {
    labels = {
      #  Missing required labels: team, cost-center
      environment = "invalid-env"    #  Invalid environment value
      random      = "value"          #  Has random labels but missing required ones
    }
  }
}

resource "google_edgecontainer_node_pool" "no_labels" {
  name          = "np-no-labels"
  location      = "australia-southeast1"
  cluster       = "gdceclusterlabels-c"
  node_location = "us-central1-edge-customer-a"
  node_count    = 1

  #  No node_config block at all - missing all required labels
}
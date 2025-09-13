resource "google_edgecontainer_node_pool" "nc" {
  name          = "np-monitoring-nc"          #  Good name
  location      = "australia-southeast1"
  cluster       = "gdceclusterlabels-c"    #  Valid cluster
  node_location = "us-central1-edge-customer-a"  #  Approved location
  node_count    = 2                        #  Good count
  project       = "wrong-project"          #  Wrong project
}
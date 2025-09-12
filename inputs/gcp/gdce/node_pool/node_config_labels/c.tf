resource "google_edgecontainer_node_pool" "compliant" {
  name          = "np-production-workers"
  location      = "australia-southeast1"
  cluster       = "gdceclusterlabels-c"
  node_location = "us-central1-edge-customer-a"
  node_count    = 3

  node_config {
    labels = {
      environment  = "production"    # Valid environment
      team         = "platform"      # Has team label
      cost-center  = "platform-123"  # Has cost-center
      custom       = "value"         # Optional custom labels
    }
  }
}

resource "google_edgecontainer_node_pool" "compliant_dev" {
  name          = "np-dev-workers" #Required
  location      = "australia-southeast1" #Required
  cluster       = "gdceclusterlabels-c" #Required
  node_location = "us-central1-edge-customer-a" #Required
  node_count    = 2 #Required

  node_config {
    labels = {
      environment  = "dev"           # Valid environment
      team         = "development"   # Has team label  
      cost-center  = "dev-456"       # Has cost-center
    } #Policy to be tested 
  }
}
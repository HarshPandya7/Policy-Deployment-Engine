
resource "google_edgecontainer_cluster" "nc" {
  name     = "gdceclusterlabels-nc" #Required
  location = "australia-southeast1" #Required
  
 labels = {
    # Missing required labels: owner, environment, cost-center
    # Only has random labels that don't match the pattern
    environment = "test"
  } #policy to be tested 
  
  networking {
    #overly permissive CIDR ranges
    cluster_ipv4_cidr_blocks  = ["0.0.0.0/0"]
    services_ipv4_cidr_blocks = ["0.0.0.0/0"]
  } #Required
 
  authorization {
    #invalid/unapproved admin email
    admin_users {
      username = "invalid@example.com"
    }
  } #Required

  fleet {
    #hardcoded project number instead of dynamic lookup
    project = "projects/1234567890"
  } #Required
}

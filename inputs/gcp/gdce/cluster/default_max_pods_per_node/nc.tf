
resource "google_edgecontainer_cluster" "nc" {
  name     = "gdceclusterlabels-nc" #Required 
  location = "australia-southeast1" #Required 
  
  default_max_pods_per_node = 110  #(exceeds 30) (Policy to be tested)
  networking {
    #overly permissive CIDR ranges
    cluster_ipv4_cidr_blocks  = ["0.0.0.0/0"]
    services_ipv4_cidr_blocks = ["0.0.0.0/0"]
  }
 
  authorization {
    #invalid/unapproved admin email
    admin_users {
      username = "invalid@example.com"
    } #Required 
  }

  fleet {
    #hardcoded project number instead of dynamic lookup
    project = "projects/1234567890"
  } #Required 
}

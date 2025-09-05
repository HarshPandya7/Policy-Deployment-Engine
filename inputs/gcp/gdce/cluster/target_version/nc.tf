
resource "google_edgecontainer_cluster" "nc" {
  name     = "gdceclusterlabels-nc"
  location = "australia-southeast1"

  networking {
    #overly permissive CIDR ranges
    cluster_ipv4_cidr_blocks  = ["0.0.0.0/0"]
    services_ipv4_cidr_blocks = ["0.0.0.0/0"]
  }
 
  authorization {
    #invalid/unapproved admin email
    admin_users {
      username = "invalid@example.com"
    }
  }

  fleet {
    #hardcoded project number instead of dynamic lookup
    project = "projects/1234567890"
  }

  #outdated version
  target_version = "1.0.0"
}

resource "google_edgecontainer_cluster" "c" {
  name     = "gdceclusterlabels-c"
  location = "australia-southeast1"

  networking {
    cluster_ipv4_cidr_blocks  = ["10.0.0.0/16"]
    services_ipv4_cidr_blocks = ["10.1.0.0/16"]
  }

  authorization {
    admin_users {
      username = "hpandya368@gmail.com"
    }
  }

 fleet {
  project = "projects/gdce-dev"
}

  target_version = "1.5.0"
}

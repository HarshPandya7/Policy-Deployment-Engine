resource "google_edgecontainer_cluster" "c" {
  name     = "gdceclusterlabels-c"
  location = "australia-southeast1"

  maintenance_policy {
    window {
      recurring_window {
        window {
          start_time = "2023-01-01T09:00:00Z"
          end_time   = "2023-01-01T17:00:00Z"
        }
        recurrence = "FREQ=WEEKLY;BYDAY=SA"
      }
    }
  }
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
}

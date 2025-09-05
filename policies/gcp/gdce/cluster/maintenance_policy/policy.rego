package terraform.gcp.security.gdce.cluster.maintenance_policy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.cluster.vars

conditions := [
    # 1. Overly permissive CIDR ranges
    [
        {
            "situation_description": "Cluster has overly permissive networking CIDR blocks.",
            "remedies": ["Use restricted CIDR ranges for cluster and services, e.g., 10.0.0.0/16"]
        },
        {
            "condition": "Cluster networking CIDR blocks should not allow 0.0.0.0/0",
            "attribute_path": ["networking", 0, "cluster_ipv4_cidr_blocks"],
            "values": ["0.0.0.0/0"],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Cluster has overly permissive service CIDR blocks.",
            "remedies": ["Use restricted CIDR ranges for cluster and services, e.g., 10.1.0.0/16"]
        },
        {
            "condition": "Service networking CIDR blocks should not allow 0.0.0.0/0",
            "attribute_path": ["networking", 0, "services_ipv4_cidr_blocks"],
            "values": ["0.0.0.0/0"],
            "policy_type": "blacklist"
        }
    ],

    # 2. Invalid admin users
    [
        {
            "situation_description": "Cluster admin user is not approved.",
            "remedies": ["Set authorized admin to hpandya368@gmail.com"]
        },
        {
            "condition": "Admin user must be in approved list",
            "attribute_path": ["authorization", 0, "admin_users", 0, "username"],
            "values": ["hpandya368@gmail.com"],
            "policy_type": "whitelist"
        }
    ],

    # 3. Maintenance Policy - Fixed check
    [
        {
            "situation_description": "Cluster maintenance policy window is not configured.",
            "remedies": ["Configure maintenance window to avoid production disruptions", "Set recurring window for maintenance"]
        },
        {
            "condition": "Maintenance policy must be configured",
            "attribute_path": ["maintenance_policy"],
            "values": [{}],  # ✅ Check that maintenance_policy exists (not null/empty)
            "policy_type": "whitelist"
        }
    ],

    # 4. Incorrect fleet project
    [
        {
            "situation_description": "Cluster fleet project is incorrect.",
            "remedies": ["Set fleet project to gdce-dev"]
        },
        {
            "condition": "Fleet project must match gdce-dev",
            "attribute_path": ["fleet", 0, "project"],
            "values": ["projects/gdce-dev"],
            "policy_type": "whitelist"
        }
    ]
]

# ------------------------------------------------------------
# Compliance messages
# ------------------------------------------------------------
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

# Add this summary rule
summary := {
    "message": message,
    "details": details
}
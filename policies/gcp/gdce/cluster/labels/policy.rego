package terraform.gcp.security.gdce.cluster.labels
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
            "remedies": ["Use restricted CIDR ranges for cluster and services, e.g., 10.1.0.0/16"
            ]
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

    # 3. Mandatory Labels - Using pattern_whitelist with specific patterns
    [
        {
            "situation_description": "Cluster is missing required labels (owner, environment, cost-center).",
            "remedies": [
                "Add label: owner = <team_or_individual>",
                "Add label: environment = dev/stage/prod", 
                "Add label: cost-center = <department_code>"
            ]
        },
        {
            "condition": "Cluster must have all required labels with non-empty values",
            "attribute_path": ["labels"],
            "values": [{"owner": ".+", "environment": ".+", "cost-center": ".+"}],
            "policy_type": "pattern_whitelist"
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

summary := {
    "message": message,
    "details": details
}
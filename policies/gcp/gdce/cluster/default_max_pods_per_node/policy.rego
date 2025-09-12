package terraform.gcp.security.gdce.cluster.default_max_pods_per_node

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.cluster.vars

conditions := [
    
    # Default max pods per node
    [
        {
            "situation_description": "Cluster has excessive default maximum pods per node.",
            "remedies": ["Set default_max_pods_per_node to 30 or lower for better resource management"]
        },
        {
            "condition": "Default max pods per node should not exceed 30",
            "attribute_path": ["default_max_pods_per_node"],
            "values": [30],
            "policy_type": "max_value"
        }
    ],

  
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
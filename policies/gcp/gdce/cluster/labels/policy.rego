package terraform.gcp.security.gdce.cluster.labels
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.cluster.vars

conditions := [
    
    # Mandatory Labels - Using pattern_whitelist with specific patterns
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
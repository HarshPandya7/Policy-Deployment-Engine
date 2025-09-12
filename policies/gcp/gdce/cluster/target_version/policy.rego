package terraform.gcp.security.gdce.cluster.target_version
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.cluster.vars

conditions := [
    
    #  Outdated target version
    [
        {
            "situation_description": "Cluster is running outdated target version.",
            "remedies": ["Upgrade cluster target_version to 1.5.0 or higher"]
        },
        {
            "condition": "Target version must be 1.5.0",
            "attribute_path": ["target_version"],
            "values": ["1.5.0"],
            "policy_type": "whitelist"
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

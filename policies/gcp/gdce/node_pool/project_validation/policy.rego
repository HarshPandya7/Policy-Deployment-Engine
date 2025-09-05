package terraform.gcp.security.gdce.node_pool.project_validation
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.node_pool.vars  

conditions := [
    # Project validation only
    [
        {
            "situation_description": "Node pool is in incorrect project.",
            "remedies": ["Node pool must be in gdce-dev project", "Set project = 'gdce-dev' or remove to use provider default"]
        },
        {
            "condition": "Project must be gdce-dev or not specified (use provider default)",
            "attribute_path": ["project"],
            "values": ["gdce-dev", null],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

summary := {
    "message": message,
    "details": details
}
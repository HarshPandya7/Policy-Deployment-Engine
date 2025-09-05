package terraform.gdce.deployment.block_privileged_containers
import data.terraform.gcp.helpers
import data.terraform.gdce.deployment.vars

conditions := [
    [
        {"situation_description": "Privileged containers are not allowed for security reasons",
         "remedies": ["Remove privileged: true from container securityContext", "Use specific capabilities instead of privileged mode"]},
        {
            "condition": "privileged_container_check",
            "attribute_path": ["spec", "template", "spec", "containers", "*", "securityContext", "privileged"], 
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
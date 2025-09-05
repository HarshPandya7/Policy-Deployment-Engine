package terraform.gcp.security.gdce.node_pool.node_config_labels
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.node_pool.vars

conditions := [
    # 1. Check if node_config exists at all
    [
        {
            "situation_description": "Node pool is missing node_config block.",
            "remedies": ["Add node_config block with required labels"]
        },
        {
            "condition": "Node must have node_config block",
            "attribute_path": ["node_config"],
            "values": [{}],
            "policy_type": "whitelist"
        }
    ],

    # 2. Check if labels exist in node_config
    [
        {
            "situation_description": "Node pool is missing labels in node_config.",
            "remedies": ["Add labels to node_config block"]
        },
        {
            "condition": "Node must have labels in node_config",
            "attribute_path": ["node_config", 0, "labels"],
            "values": [{}],
            "policy_type": "whitelist"
        }
    ],

    # 3. Check individual required labels (using blacklist for missing keys)
    [
        {
            "situation_description": "Node pool is missing environment label.",
            "remedies": ["Add environment label to node_config"]
        },
        {
            "condition": "Node must have environment label",
            "attribute_path": ["node_config", 0, "labels", "environment"],
            "values": [null],  # Blacklist null (missing keys)
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Node pool is missing team label.",
            "remedies": ["Add team label to node_config"]
        },
        {
            "condition": "Node must have team label",
            "attribute_path": ["node_config", 0, "labels", "team"],
            "values": [null],  # Blacklist null (missing keys)
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Node pool is missing cost-center label.",
            "remedies": ["Add cost-center label to node_config"]
        },
        {
            "condition": "Node must have cost-center label",
            "attribute_path": ["node_config", 0, "labels", "cost-center"],
            "values": [null],  # Blacklist null (missing keys)
            "policy_type": "blacklist"
        }
    ],

    # 4. Label value validation
    [
        {
            "situation_description": "Node has invalid environment label value.",
            "remedies": ["Environment must be: dev, staging, or production"]
        },
        {
            "condition": "Environment label must be valid",
            "attribute_path": ["node_config", 0, "labels", "environment"],
            "values": ["dev", "staging", "production"],
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
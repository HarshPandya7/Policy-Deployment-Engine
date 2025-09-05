package terraform.gcp.security.gdce.node_pool.disk_encryption
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.node_pool.vars

conditions := [
    # 1. KMS Key format validation - USING BLACKLIST FOR INVALID PATTERN
    [
        {
            "situation_description": "Node pool has invalid KMS key format.",
            "remedies": ["Use proper KMS key format: projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey}"]
        },
        {
            "condition": "KMS key must not be invalid format",
            "attribute_path": ["local_disk_encryption", 0, "kms_key"],
            "values": ["invalid-key-format"],
            "policy_type": "blacklist"
        }
    ],

    # 2. KMS Key state validation (if available in plan)
    [
        {
            "situation_description": "Node pool has problematic KMS key state.",
            "remedies": ["Check KMS key permissions and availability", "Ensure key is enabled and accessible"]
        },
        {
            "condition": "KMS key state must be KEY_AVAILABLE",
            "attribute_path": ["local_disk_encryption", 0, "kms_key_state"],
            "values": ["KEY_AVAILABLE"],
            "policy_type": "whitelist"
        }
    ],

    # 3. KMS Key active version validation (if available)
    [
        {
            "situation_description": "Node pool has invalid KMS key version.",
            "remedies": ["Check KMS key version is valid and active"]
        },
        {
            "condition": "KMS key active version must be valid",
            "attribute_path": ["local_disk_encryption", 0, "kms_key_active_version"],
            "values": [""],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

summary := {
    "message": message,
    "details": details
}
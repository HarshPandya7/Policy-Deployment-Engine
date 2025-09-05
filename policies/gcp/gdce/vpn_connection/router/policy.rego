package terraform.gcp.security.gdce.vpn_connection.router
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.vpn_connection.vars

conditions := [
    # 1. Cluster format validation
    [
        {
            "situation_description": "VPN connection has invalid cluster format.",
            "remedies": ["Use proper cluster format: projects/{project}/locations/{location}/clusters/{cluster}"]
        },
        {
            "condition": "Cluster must not be invalid format",
            "attribute_path": ["cluster"],
            "values": ["invalid-cluster-format"],
            "policy_type": "blacklist"
        }
    ],

    # 2. Name validation
    [
        {
            "situation_description": "VPN connection name doesn't follow naming convention.",
            "remedies": ["Name must start with 'vpn-' followed by purpose and environment"]
        },
        {
            "condition": "VPN name must not be invalid",
            "attribute_path": ["name"],
            "values": ["invalid-name"],
            "policy_type": "blacklist"
        }
    ],

    # 3. Location validation
    [
        {
            "situation_description": "VPN connection is in invalid location.",
            "remedies": ["Use approved locations: australia-southeast1, us-central1, europe-west1"]
        },
        {
            "condition": "Location must be in approved list",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "us-central1", "europe-west1"],
            "policy_type": "whitelist"
        }
    ],

    # 4. Router validation (NEW - replaces VPC)
    [
        {
            "situation_description": "VPN connection has invalid Cloud Router.",
            "remedies": ["Use proper Cloud Router format: projects/{project}/locations/{location}/routers/{router}"]
        },
        {
            "condition": "Router must not be invalid format",
            "attribute_path": ["router"],
            "values": ["invalid-router-format", "wrong-format"],
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
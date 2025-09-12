package terraform.gcp.security.gdce.vpn_connection.router
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.vpn_connection.vars

conditions := [

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
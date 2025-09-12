package terraform.gcp.security.gdce.vpn_connection.vpc
import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.vpn_connection.vars

conditions := [
   
    # VPC validation - USING BLACKLIST
    [
        {
            "situation_description": "VPN connection has invalid VPC network.",
            "remedies": ["Use proper VPC network format: projects/{project}/global/networks/{network}"]
        },
        {
            "condition": "VPC must not be invalid format",
            "attribute_path": ["vpc"],
            "values": ["wrong-format", "invalid-vpc-format"],
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
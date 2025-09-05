package terraform.gcp.security.gdce.node_pool.basic_checks

import data.terraform.gcp.helpers
import data.terraform.gcp.security.gdce.node_pool.vars # Shared vars

conditions := [
	# 1. Node location validation
	[
		{
			"situation_description": "Node pool is in an invalid location.",
			"remedies": ["Use approved edge locations: us-central1-edge-customer-a, europe-west1-edge-customer-b"],
		},
		{
			"condition": "Node location must be in approved list",
			"attribute_path": ["node_location"],
			"values": ["us-central1-edge-customer-a", "europe-west1-edge-customer-b"],
			"policy_type": "whitelist",
		},
	],
	# 2. Node count validation
	[
		{
			"situation_description": "Node pool has too many or too few nodes.",
			"remedies": ["Set node count between 1 and 5 for optimal performance"],
		},
		{
			"condition": "Node count must be between 1 and 5",
			"attribute_path": ["node_count"],
			"values": [1, 5],
			"policy_type": "range",
		},
	],
	# 3. Name validation
	[
		{
			"situation_description": "Node pool name doesn't follow naming convention.",
			"remedies": ["Name must start with 'np-' followed by environment and purpose"],
		},
		{
			"condition": "Node pool name must follow naming convention",
			"attribute_path": ["name"],
			"values": ["np-.*"],
			"policy_type": "pattern_whitelist",
		},
	],
	# 4. Cluster validation
	[
		{
			"situation_description": "Node pool is attached to invalid cluster.",
			"remedies": ["Node pool must be attached to valid GDCE cluster"],
		},
		{
			"condition": "Cluster must be valid GDCE cluster",
			"attribute_path": ["cluster"],
			"values": ["gdceclusterlabels-c", "gdceclusterlabels-nc"],
			"policy_type": "whitelist",
		},
	],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

summary := {
	"message": message,
	"details": details,
}

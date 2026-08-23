output "rule_names" {
  description = "Names of the rules created in this rulebase"
  value = [
    checkpoint_management_access_rule.allow_internal_to_dmz_web.name,
    checkpoint_management_access_rule.allow_mgmt_to_all.name,
    checkpoint_management_access_rule.deny_all.name,
  ]
}

policy "approved_region" {
  source = "./approved_region.sentinel"
  enforcement_level = "advisory"
}

policy "data_residency" {
  source = "./data_residency.sentinel"
  enforcement_level = "advisory"
}

policy "approved_providers" {
  source = "./approved_providers.sentinel"
  enforcement_level = "advisory"
}
policy "provider_versions" {
  source = "./provider_versions.sentinel"
  enforcement_level = "advisory"
}

policy "trusted_modules" {
  source = "./trusted_modules.sentinel"
  enforcement_level = "advisory"
}
policy "approved_instance_types" {
  source = "./approved_instance_types.sentinel"
  enforcement_level = "advisory"
}
policy "encrypted_ebs" {
  source = "./encrypted_ebs.sentinel"
  enforcement_level = "advisory"
}

policy "network_security" {
  source = "./network_security.sentinel"
  enforcement_level = "advisory"
}
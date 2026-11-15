
policy "approved_region" {
  source = "./approved_region.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "data_residency" {
  source = "./data_residency.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "approved_providers" {
  source = "./approved_providers.sentinel"
  enforcement_level = "hard-mandatory"
}
policy "provider_versions" {
  source = "./provider_versions.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "trusted_modules" {
  source = "./trusted_modules.sentinel"
  enforcement_level = "hard-mandatory"
}
policy "approved_instance_types" {
  source = "./approved_instance_types.sentinel"
  enforcement_level = "hard-mandatory"
}
policy "encrypted_ebs" {
  source = "./encrypted_ebs.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "network_security" {
  source = "./network_security.sentinel"
  enforcement_level = "hard-mandatory"
}
locals {
  alibaba_region = "cn-hangzhou"
}

module "region_abbreviation" {
  source = "../../"
}

output "region_abbreviation" {
  value = module.region_abbreviation.alibaba_region_abbr_map[local.alibaba_region]
}

output "all_region_names" {
  value = module.region_abbreviation.region_names
}

output "all_abbreviations" {
  value = module.region_abbreviation.region_abbreviations
}

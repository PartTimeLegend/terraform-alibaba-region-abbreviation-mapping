output "alibaba_region_abbr_map" {
  value       = var.alibaba_region_abbr_map
  description = "The canonical map of Alibaba Cloud region IDs to abbreviations."
}

output "lookup_region_abbreviation" {
  value       = local.alibaba_region_abbr_lookup_map
  description = "Map for looking up a region abbreviation from either the canonical region ID or a normalized lowercase name without hyphens."
}

output "region_names" {
  value       = keys(var.alibaba_region_abbr_map)
  description = "List of canonical Alibaba Cloud region IDs."
}

output "region_abbreviations" {
  value       = values(var.alibaba_region_abbr_map)
  description = "List of all region abbreviations."
}

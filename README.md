# Terraform Alibaba Cloud Region Abbreviation Mapping

[![Tag](https://github.com/PartTimeLegend/terraform-alibaba-region-abbreviation-mapping/actions/workflows/tag.yml/badge.svg)](https://github.com/PartTimeLegend/terraform-alibaba-region-abbreviation-mapping/actions/workflows/tag.yml)

A simple module that provides mappings between Alibaba Cloud region IDs and standardized abbreviations for consistent resource naming.

## Features

- Mapping of Alibaba Cloud region IDs to short abbreviations
- Supports both canonical region IDs and normalized lowercase names without hyphens
- Helper output map to simplify regional naming across Alibaba Cloud resources
- Zero external dependencies

## Usage

### Basic Usage

```terraform
locals {
  alibaba_region = "cn-hangzhou"
}

module "region_abbreviation_mapping" {
  source  = "PartTimeLegend/region-abbreviation-mapping/alibaba"
  version = "~> 1.0" # Replace with the latest version
}

output "region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.alibaba_region]
}
```

### Using Normalized Region IDs

```terraform
module "region_abbreviation_mapping" {
  source = "PartTimeLegend/region-abbreviation-mapping/alibaba"
}

locals {
  canonical_region  = "cn-hongkong"
  normalized_region = "cnhongkong"
}

output "canonical_region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.canonical_region]
}

output "normalized_region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.normalized_region]
}
```

### Using the Region Lookup Map

```terraform
module "region_abbreviation_mapping" {
  source = "PartTimeLegend/region-abbreviation-mapping/alibaba"
}

locals {
  resource_name = "${module.region_abbreviation_mapping.lookup_region_abbreviation["cn-hangzhou"]}-app"
}
```

## Available Outputs

| Name | Description |
| ---- | ----------- |
| `alibaba_region_abbr_map` | Canonical map of Alibaba Cloud region IDs to their abbreviations |
| `lookup_region_abbreviation` | Lookup map supporting canonical region IDs and normalized lowercase names without hyphens |
| `region_names` | List of canonical Alibaba Cloud region IDs |
| `region_abbreviations` | List of all region abbreviations |

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.

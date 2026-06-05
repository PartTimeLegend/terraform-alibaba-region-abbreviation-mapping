variable "alibaba_region_abbr_map" {
  type        = map(string)
  description = "Map of Alibaba Cloud region IDs to short abbreviations for naming resources"
  default = {
    "cn-qingdao"      = "cnqd"
    "cn-beijing"      = "cnbj"
    "cn-zhangjiakou"  = "cnzjk"
    "cn-huhehaote"    = "cnhhht"
    "cn-wulanchabu"   = "cnwlcb"
    "cn-hangzhou"     = "cnhz"
    "cn-shanghai"     = "cnsh"
    "cn-nanjing"      = "cnnj"
    "cn-fuzhou"       = "cnfz"
    "cn-wuhan-lr"     = "cnwhlr"
    "cn-shenzhen"     = "cnsz"
    "cn-heyuan"       = "cnhy"
    "cn-guangzhou"    = "cngz"
    "cn-chengdu"      = "cncd"
    "cn-zhongwei"     = "cnzw"
    "cn-hongkong"     = "cnhk"
    "ap-southeast-1"  = "apse1"
    "ap-southeast-3"  = "apse3"
    "ap-southeast-5"  = "apse5"
    "ap-southeast-6"  = "apse6"
    "ap-southeast-7"  = "apse7"
    "ap-southeast-8"  = "apse8"
    "ap-northeast-1"  = "apne1"
    "ap-northeast-2"  = "apne2"
    "us-west-1"       = "usw1"
    "us-east-1"       = "use1"
    "eu-central-1"    = "euc1"
    "eu-west-1"       = "euw1"
    "eu-west-2"       = "euw2"
    "me-east-1"       = "mee1"
    "me-central-1"    = "mec1"
    "na-south-1"      = "nas1"
  }
}

locals {
  alibaba_region_abbr_map_normalized = {
    for region_name, abbreviation in var.alibaba_region_abbr_map :
    lower(replace(region_name, "-", "")) => abbreviation
  }

  alibaba_region_abbr_lookup_map = merge(
    var.alibaba_region_abbr_map,
    local.alibaba_region_abbr_map_normalized,
  )
}

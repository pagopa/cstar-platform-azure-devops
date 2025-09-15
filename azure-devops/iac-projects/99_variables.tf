variable "location" {
  type = string
}

variable "aks_dev_platform_name" {
  type        = string
  description = "AKS DEV platform name"
}

variable "aks_uat_platform_name" {
  type        = string
  description = "AKS UAT platform name"
}

variable "aks_prod_platform_name" {
  type        = string
  description = "AKS PROD platform name"
}

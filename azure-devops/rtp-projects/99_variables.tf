variable "location_short" {
  type = string
}

#
# Subscription
#

variable "dev_subscription_name" {
  type        = string
  description = "DEV Subscription name"
}

variable "uat_subscription_name" {
  type        = string
  description = "UAT Subscription name"
}

variable "prod_subscription_name" {
  type        = string
  description = "PROD Subscription name"
}

variable "project_name" {
  type        = string
  description = "Project name (e.g. pagoPA platform)"
}

variable "service_endpoint_azure_dev_name" {
  type        = string
  description = "azure service endpoint name for dev"
}

variable "service_endpoint_azure_uat_name" {
  type        = string
  description = "azure service endpoint name for uat"
}

variable "service_endpoint_azure_prod_name" {
  type        = string
  description = "azure service endpoint name for prod"
}

#
# ACR Workload
#
variable "acr_weu_service_connection_workload_identity_dev" {
  type        = string
  description = "The service connection ID for the ITA DEV workload identity in Azure Container Registry"
  default     = ""
}

variable "acr_weu_service_connection_workload_identity_uat" {
  type        = string
  description = "The service connection ID for the ITA UAT workload identity in Azure Container Registry"
  default     = ""
}

variable "acr_weu_service_connection_workload_identity_prod" {
  type        = string
  description = "The service connection ID for the ITA PROD workload identity in Azure Container Registry"
  default     = ""
}

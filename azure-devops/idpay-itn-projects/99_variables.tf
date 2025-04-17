variable "acr_ita_service_connection_workload_identity_dev" {
  type        = string
  description = "The service connection ID for the ITA DEV workload identity in Azure Container Registry"
  default     = ""
}

variable "acr_ita_service_connection_workload_identity_uat" {
  type        = string
  description = "The service connection ID for the ITA UAT workload identity in Azure Container Registry"
  default     = ""
}

variable "acr_ita_service_connection_workload_identity_prod" {
  type        = string
  description = "The service connection ID for the ITA PROD workload identity in Azure Container Registry"
  default     = ""
}

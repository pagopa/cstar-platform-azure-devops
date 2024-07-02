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

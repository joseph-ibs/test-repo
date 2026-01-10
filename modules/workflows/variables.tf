variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "sa_name" {
  type = string
}

variable "workflow_name" {
  type = string
}

variable "schedule" {
  type    = string
  default = "0 * * * *" # every hour"
}
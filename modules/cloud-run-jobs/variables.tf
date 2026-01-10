variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "sa_name" {
  type = string
}

variable "job_name" {
  type = string
}

variable "schedule" {
  type    = string
  default = "0 * * * *" # every hour"
}

variable "image_path" {
  type    = string
  default = "us-docker.pkg.dev/cloudrun/container/hello" # change here"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "cloud_run" {
  source = "../../modules/cloud-run"

  project_id   = var.project_id
  region       = var.region
  service_name = "sample-cloud-run-dev2"
  image        = "us-docker.pkg.dev/cloudrun/container/hello"
  sa_name      = "sample-cloud-run-dev2" 
}

module "cloud_run1" {
  source = "../../modules/cloud-run"

  project_id   = var.project_id
  region       = var.region
  service_name = "sample-cloud-run-dev1"
  image        = "us-docker.pkg.dev/cloudrun/container/hello"
  sa_name      = "sample-cloud-run-dev1" 
}

module "services" {
  source = "../../modules/services"

  project_id = var.project_id
}


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

module "workflows" {
  source        = "../../modules/workflows"
  project_id    = var.project_id
  region        = var.region
  sa_name       = "workflow-service-account"
  workflow_name = "gcs_to_bq_workflow"
  schedule      = "0 * * * *"
}

output "workflow_id" {
  value = module.workflows.workflow_id
}

module "cloud_run_job" {
  source     = "../../modules/cloud-run-jobs"
  project_id = var.project_id
  region     = var.region
  sa_name    = "cloud-run-invoker-service-account"
  job_name   = "python_job"
  schedule   = "0 * * * *"
}

output "cloud_run_job_id" {
  value = module.workflows.workflow_id
}
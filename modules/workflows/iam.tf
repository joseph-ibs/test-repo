resource "google_service_account" "workflow_service_account" {
  account_id   = var.sa_name
  display_name = "Cloud Scheduler Workflow Invoker"
}

resource "google_project_iam_member" "scheduler_workflow_invoker" {
  project = var.project_id
  role    = "roles/workflows.invoker"
  member  = "serviceAccount:${google_service_account.workflow_service_account.email}"
}


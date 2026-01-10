resource "google_service_account" "scheduler_sa" {
  account_id   = "scheduler-workflow-sa2"
  display_name = "Cloud Scheduler Workflow Invoker"
}

resource "google_project_iam_member" "scheduler_workflow_invoker" {
  project = var.project_id
  role    = "roles/workflows.invoker"
  member  = "serviceAccount:${google_service_account.scheduler_sa.email}"
}

resource "google_service_account" "cloud_run_service_account" {
  account_id   = var.sa_name
  display_name = "Cloud Run Invoker"
}

resource "google_project_iam_member" "scheduler_cloud_run_invoker" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = "serviceAccount:${google_service_account.cloud_run_service_account.email}"
}


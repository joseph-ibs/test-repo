# 1. The Cloud Scheduler Job
resource "google_cloud_scheduler_job" "run_job_schedule" {
  name             = "${var.job_name}-job"
  region           = var.region
  description      = "Triggers the Cloud Run job"
  schedule         = var.schedule
  time_zone        = "UTC"
  attempt_deadline = "320s"

  retry_config {
    retry_count = 1
  }

  http_target {
    http_method = "POST"
    # This URL targets the execution endpoint of your specific job
    uri = "https://${google_cloud_run_v2_job.cloud_run_job.location}-run.googleapis.com/v2/${google_cloud_run_v2_job.cloud_run_job.id}:run"

    oauth_token {
      service_account_email = google_service_account.cloud_run_service_account.email
    }
  }
}
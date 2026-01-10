resource "google_cloud_scheduler_job" "workflow_job" {
  name      = "${var.workflow_name}-job"
  region    = var.region
  schedule  = var.schedule
  time_zone = "UTC"

  http_target {
    http_method = "POST"

    uri = "https://workflowexecutions.googleapis.com/v1/projects/${var.project_id}/locations/us-central1/workflows/${var.workflow_name}/executions"

    oauth_token {
      service_account_email = google_service_account.workflow_service_account.email
    }

    headers = {
      Content-Type = "application/json"
    }

    body = base64encode(jsonencode({
      argument = jsonencode({
        url = "https://worldtimeapi.org/api/ip"
      })
    }))
  }
}
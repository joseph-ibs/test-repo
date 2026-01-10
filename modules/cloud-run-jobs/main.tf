resource "google_cloud_run_v2_job" "cloud_run_job" {
  name     = var.job_name
  location = "us-central1"

  template {
    template {
      containers {
        # Replace with your actual image path
        image = var.image_path


        resources {
          limits = {
            cpu    = "1"
            memory = "512Mi"
          }
        }

        # Optional: Add environment variables
        env {
          name  = "LOG_LEVEL"
          value = "DEBUG"
        }
      }

      # Number of retries before marking a task as failed
      max_retries = 1

      # Duration before a task is killed
      timeout = "600s"
    }
  }
}
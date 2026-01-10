resource "google_monitoring_alert_policy" "workflow_alert" {
  display_name = "Workflow Alert"
  combiner     = "OR"
  conditions {
    display_name = "Workflow - Finished execution count"

    condition_threshold {
      filter = "resource.type = \"workflows.googleapis.com/Workflow\" AND metric.type = \"workflows.googleapis.com/finished_execution_count\" AND metric.labels.status = \"FAILED\""

      comparison      = "COMPARISON_GT"
      threshold_value = 1
      duration        = "0s"

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_SUM"
      }

      trigger {
        count = 1
      }
    }
  }

  documentation {
    content   = "Check workflow"
    mime_type = "text/markdown"
    subject   = "Workflow failed"
  }

  notification_channels = [google_monitoring_notification_channel.email_channel.id]

  alert_strategy {
    auto_close = "21600s" # 6 hours
  }
}



resource "google_monitoring_alert_policy" "cloud_run_job_alert" {
  display_name = "Cloud Run Job Alert"
  combiner     = "OR"
  conditions {
    display_name = "Cloud Run Job Failure"

    condition_threshold {
      filter = "resource.type = \"cloud_run_job\" AND metric.type = \"run.googleapis.com/job/completed_execution_count\" AND metric.labels.result != \"succeeded\""

      comparison      = "COMPARISON_GT"
      threshold_value = 1
      duration        = "0s"

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_COUNT"
      }

      trigger {
        count = 1
      }
    }
  }

  documentation {
    content   = "Check Cloud Run Job"
    mime_type = "text/markdown"
    subject   = "Cloud Rub Job failed"
  }

  notification_channels = [google_monitoring_notification_channel.email_channel.id]

  alert_strategy {
    auto_close = "21600s" # 6 hours
  }
}
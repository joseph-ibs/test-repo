output "cloud_run_job_id" {
  description = "The unique identifier for the Job"
  value       = google_cloud_run_v2_job.data_processor.id
}
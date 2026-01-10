output "workflow_id" {
  description = "The unique identifier for the workflow"
  value       = google_workflows_workflow.gcs_to_bq_workflow.id
}
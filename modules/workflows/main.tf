resource "google_workflows_workflow" "gcs_to_bq_workflow" {
  project         = var.project_id
  name            = "workflow"
  region          = var.region
  description     = "workflow to process gcs to bigquery"
  service_account = google_service_account.workflow_service_account.email


  source_contents = <<-EOF
  # This is a sample workflow. You can replace it with your source code.
  #
  # This workflow does the following:
  # - reads current time and date information from an external API and stores
  #   the response in currentTime variable
  # - retrieves a list of Wikipedia articles related to the day of the week
  #   from currentTime
  # - returns the list of articles as an output of the workflow
  #
  # Note: In Terraform you need to escape the $$ or it will cause errors.

  - getCurrentTime:
      call: http.get
      args:
          url: $${sys.get_env("url")}
      result: currentTime
  - readWikipedia:
      call: http.get
      args:
          url: https://en.wikipedia.org/w/api.php
          query:
              action: opensearch
              search: $${currentTime.body.dayOfWeek}
      result: wikiResult
  - returnOutput:
      return: $${wikiResult.body[1]}
EOF

  deletion_protection = false
}
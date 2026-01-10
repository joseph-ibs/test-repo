resource "google_monitoring_notification_channel" "email_channel" {
  display_name = "Ops Team Email"
  type         = "email"

  labels = {
    email_address = var.ops_email
  }
}
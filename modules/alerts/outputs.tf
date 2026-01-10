output "email_channel" {
  description = "The email_channel for the alert"
  value       = google_monitoring_notification_channel.email_channel.display_name
}
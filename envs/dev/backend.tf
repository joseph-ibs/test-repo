terraform {
  backend "gcs" {
    bucket  = "tf-state-myorg"
    prefix  = "dev/"
  }
}

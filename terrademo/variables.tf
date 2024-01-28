variable "credentials" {
  description = "My creadentials"
  default     = "./keys/my-creds.json"
}

variable "Project" {
  description = "Project"
  default     = "aqueous-radio-411522"
}

variable "region" {
  description = "Region"
  default     = "us-central1"
}



variable "location" {
  description = "Project Location"
  default     = "US"
}



variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "aqueous-radio-411522-terra-bucket"

}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDART"

}
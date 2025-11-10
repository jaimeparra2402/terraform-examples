variable "gcp_username" {
  description = "Nombre de usuario en Google Cloud"
  type        = string
  default     = "jpj451" 
}

variable "gcp_project" {
  description = "Nombre o ID del proyecto en Google Cloud"
  type        = string
  default     = "cc-25-26"  
}

variable "gcp_bucket_name" {
  description = "Nombre del bucket en Google Cloud Storage"
  type        = string
  default     = "bucket-451"  
}


resource "google_storage_bucket" "imagenes_bucket" {
  name                        = var.gcp_bucket_name
  location                    = "europe-southwest1"
  force_destroy               = true
  uniform_bucket_level_access = true

  labels = {
    owner    = var.gcp_username
    proyecto = var.gcp_project
  }
}

resource "google_storage_bucket_object" "imagen1" {
  name   = "el_enigma_de_la_habitacion_622.jpg"
  bucket = google_storage_bucket.imagenes_bucket.name
  source = "${path.root}/images/el_enigma_de_la_habitacion_622.jpg"
  content_type = "image/jpeg"
}

resource "google_storage_bucket_object" "imagen2" {
  name   = "una_historia_de_espana.jpg"
  bucket = google_storage_bucket.imagenes_bucket.name
  source = "${path.root}/images/una_historia_de_espana.jpg"
  content_type = "image/jpeg"
}

resource "google_storage_object_access_control" "public_imagen1" {
  bucket = google_storage_bucket.imagenes_bucket.name
  object = google_storage_bucket_object.imagen1.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_object_access_control" "public_imagen2" {
  bucket = google_storage_bucket.imagenes_bucket.name
  object = google_storage_bucket_object.imagen2.name
  role   = "READER"
  entity = "allUsers"
}

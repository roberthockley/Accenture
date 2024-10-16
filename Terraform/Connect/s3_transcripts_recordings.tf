resource "aws_s3_bucket" "transcripts" {
  bucket = "${var.project.tla}-recordings-transcripts"
}
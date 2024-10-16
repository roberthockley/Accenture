resource "aws_s3_bucket" "transcripts" {
  bucket = "${var.project.tla}-recordings-transcripts"
}

resource "aws_s3_bucket" "q" {
  bucket = "${var.project.tla}-connect-amazonq"
}
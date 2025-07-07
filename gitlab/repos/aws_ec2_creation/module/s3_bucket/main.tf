
 //*****create s3 bucket******//
  resource "aws_s3_bucket" "s3-bucket-1" {
  bucket = "project-1-tfstate-logs"

}
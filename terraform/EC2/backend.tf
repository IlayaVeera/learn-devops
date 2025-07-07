

terraform {
  backend "s3" {
   bucket = "project-1-tfstate"
   region="us-east-1"
   key="terrform.tfstate"
}
  }

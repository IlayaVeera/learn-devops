
terraform {
  backend "s3" {
   bucket ="2tier-statefile"
   region="us-east-1"
   key="terrform.tfstate"
   dynamodb_table = "terraform_lock_table"
   encrypt = true
}
}

Terraform import:
=======================

details:
- to convert existing infrastructure which had been created using GUI into terraform code
- to import missing resources into terraform code

steps:
	1. create aws resources using GUI.(ec2, vpc, s3)
	2. identify the resources need to import from aws
		aws ec2 describe-instances
		aws ec2 describe-vpcs
	3. setup terraform
		mkdir tf-proj && cd tf-proj
		touch main.tf.

	4. write initial terraform configuration

		provider "aws" {
			region= "us-east-1"

		resource "aws_vpc" "vpc" {
			}

		resource "aws_instance" "ec2" {
			}
		 
		
	5. terraform init

	6. import existing resources
		terraform import aws_vpc.vpc vpc-id
		terraform import aws_instance.ec2 instance-id

	7. generate configuration from imported state
		terraform show -no-color > terraform.state

	8. copy resource config from terraform.state and place in main.tf with only required attributes

	9. terraform plan
		result should be "No changes. Your infrastructure matches the configuration."
	10. terraform apply -auto-approve
		result should be "No changes. Your infrastructure matches the configuration."
		
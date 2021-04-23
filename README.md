# terraform-aws-eks
This repository contains IAC for aws eks provsioning using terraform

# Provisioning Kubernetes clusters on AWS with Terraform and EKS
First we need to create free teir aws account. Link to singup - https://portal.aws.amazon.com/billing/signup#/start

#AWS EKS Architecture 

<img width="1241" alt="Screen Shot 2021-04-23 at 2 47 26 PM" src="https://user-images.githubusercontent.com/23742008/115860643-d5ff3080-a442-11eb-8c55-be589f9a82ef.png">

#Prerequisites to start deployment of EKS

# AWS account with admin privileges 
  Account Number - 030286034520
  Access ID - AKIAQODJQGZMIGI5EK6W
  Access Key - /cHyd87VuOQ156ChNIxGrVdxwYbfwW8xxxxxxxx
  Console login link - https://030286034520.signin.aws.amazon.com/console

# Download and install kubectl 
  Link https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/#install-with-homebrew-on-macos

# Download and install aws-iam-authenticator
  https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html

# Install the awscli
  https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html
  
# Install the ekctl
  https://docs.aws.amazon.com/eks/latest/userguide/eksctl.html
  
# Install the terraform
  https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started

#Before starting with Terraform we should have configured our credentials in the AWS folder in our system as shown below.

$ aws configure
AWS Access Key ID [****************EK6W]: 
AWS Secret Access Key [****************AOwO]: 
Default region name [eu-west-1]: 
Default output format [json]:

# terraform state file location - { backend.tfvars }
 bucket               = "iac-aws-eks"
 key                  = "tf-state.json"
 region               = "us-west-1"
 workspace_key_prefix = "environment"
 
#terraform module for aws vpc, eks , workernode-spot & on-demand instance




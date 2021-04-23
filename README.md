# terraform-aws-eks
This repository contains IAC for aws eks provsioning using terraform

# Provisioning Kubernetes clusters on AWS with Terraform and EKS
First we need to create free teir aws account. Link to singup - https://portal.aws.amazon.com/billing/signup#/start

# AWS EKS Architecture 

<img width="1241" alt="Screen Shot 2021-04-23 at 2 47 26 PM" src="https://user-images.githubusercontent.com/23742008/115860643-d5ff3080-a442-11eb-8c55-be589f9a82ef.png">

# Prerequisites to start deployment of EKS

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
  https://www.vasos-koupparis.com/terraform-getting-started-install/
  
# Terraform analysis with Checkov
  https://github.com/bridgecrewio/checkov

# Before starting with Terraform we should have configured our credentials in the AWS folder in our system as shown below.

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
 
# EKS cluster launch using Terraform  -

1). Go to eks_cluster_using_terraform/modules/eks/providers.tf folder, replace the Access_key and secret_key in providers.tf file with new user access details. Also please make sure to pass any SSH keypair name to the variables.tf file.

2). Run #terraform init 
        #terraform plan 
        #terraform apply

3).Wait while the EKS cluster is created.
4) Run below command to update kube-config, Please make sure you have the "aws configure" command setup prior to running this step.

     aws eks --region us-east-2 update-kubeconfig --name my-cluster

6). Authorize worker nodes Get the config from terraform output, and save it to a yaml file:

    terraform output config-map > config-map-aws-auth.yaml

8). Apply the config map to EKS:

    kubectl apply -f config-map-aws-auth.yaml

9).You can verify the worker nodes are joining the cluster

    kubectl get nodes --watch

10). Cleaning up You can destroy this cluster entirely by running:

    terraform plan -destroy terraform destroy --force

12). Run below command to get the EKS load balancer endpoint, hit on the browser, the sample nginx page is ready to server traffic.

    kubectl get svc


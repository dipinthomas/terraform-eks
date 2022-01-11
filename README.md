# EKS Cluster

Terraform scripts to create EKS cluster for POC purpose, the idea is to get an EKS cluster running within minutes to perform some quick validations.  Cluster endpoint will be public but worker node will be running in a private subnet.

# Prerequisites

* Terraform v1.1.3 
* kubectl 1.22
* aws-cli 2.3.3

# Steps to run

## Step 1 : Clone this repository

```
git clone <repo_link>
```

## Step 2 : aws credentials

System should have login credentials configured before deploying the cluster.  Below command will request for aws *access_key* & *secret_key* 

```
aws configure
<entry access_key & secret_key>
```

## Step 3: AWS access verification

Run any AWS command to verify access.

```
aws s3 ls
<should return list of s3 buckets if any>
```

## Step 4: Terraform Deployment

Once above setps execution is successful you can deploy using below terraform commands

```
terraform init
terraform plan
terraform apply --auto-approve
```

## Step 5: Destroy Cluster

Assuming the state files is available on local or remote.

```
terraform destroy
```

# Improvments

Feel free to create a PR with improvements or raise a bug reuest which will be addressed immediately.

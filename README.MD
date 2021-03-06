# terraform-course

* These files are part of my Udemy course about Terraform
* Course URL: https://www.udemy.com/learn-devops-infrastructure-automation-with-terraform/?couponCode=TERRAFORM_GIT

# Compatibility

* This is the >=terraform-0.12 branch. For compatibility with older versions, use the terraform-0.11 branch.

# Demo overview
Demo Directory | Description
------------ | -------------
first-steps | First steps
demo-1 | First steps: Launching an EC2 instance
demo-2 | Using provisioner
demo-2b | Using provisioner on a Windows instance
demo-3 | Executing script locally
demo-4 | Outputting
demo-5 | Data Source
demo-6 | Modules
demo-7 | AWS VPC/NAT/Route Table/EIP/Internet Gateway/Public Private Subnet
demo-8 | EC2 instance within VPC with securitygroup
demo-9 | EC2 instance with EBS volumes
demo-10 | Userdata and cloudinit, running scripts on startup/template
demo-11 | Route53 (DNS)/Elastic IP/Static IPs
demo-12 | RDS
demo-13 | IAM
demo-14 | IAM Roles with S3 bucket
demo-15 | Autoscaling
demo-16 | Autoscaling with ELB (Elastic Load Balancer)
demo-17 | Elastic Beanstalk PHP 7 stack with RDS
demo-18 | Interpolations, VPC module
demo-18b | Project structure, best practices
packer-demo | Build AMIs with Packer
jenkins-packer-demo | Demo with jenkins and Packer
docker-demo-1 | Using ECR - The EC2 Container Registry
docker-demo-2 | Using ECS - The EC2 Container Service
docker-demo-3 | Using ECR/ECS with Jenkins in a complete workflow
module-demo | Using ECS + ALB in 4 modules to show how developing terraform modules work

# Summary of commands
terraform plan:  
terraform plan -out out.terraform: changes will be saved in `out.terraform` file  
terraform apply: wrapper for plan, out then remove  
terraform apply `out.terraform`: apply the changes from the file  
terraform fmt: format the file to look pretty
terraform get: get and update the modules
terraform graph: create a visual representation
import aws_instance i-xxxx: import from already existing architecture
teraform push: run terraform from a centralized server
terraform refresh: refresh remote state
terraform remote: configure remote storage
terraform show: show human readable output from a state
terraform state: use this command for advance state management

# output
output "ip": {aws_instance.public_ip}: use to output information we want from the provisioner/resource 

# provisioner
local-exec: run commands locally
remote-exec: run commands on instance
file: upload a file to the instance

# module
source: source to get terraform module from a remote website, will look for local folder if string starts with `./`

# Common procedures:
#### Syncing Time: Amazon will not create a resource if the time difference is too much
```
sudo apt install ntpdate && sudo ntpdate ntp.ubuntu.com
```

#### Changing hostname at cmd
```https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-hostname.html
```

#### change the root block device of instance
```
in resource "aws_instance", add
root_block_device {
  volume_size=16
  volume_type="gp2"
  delete_on_termination=true 
}
```

#### mounting EBS volume
```
df -h  # check storage
mkfs.ext4 /dev/<name of volume>  # make a filesystem on the volume
mkdir data
mount /dev/<name of volume> /data  # adding the volume to linux
vim /etc/fstab  # adding the volume as permanent so it auto attach on instance reboot
add the line '/dev/<name of volume> /data ext4 defaults 0 0'
----

```
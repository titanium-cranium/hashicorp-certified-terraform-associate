### Data Sources

1. Overview
   1. Allow data to be fetched/computed for use elsewhere in Terraform config
   2. Allows TF to make use of info defined outside of Terraform or by another TF config
   3. data block
2. Examples
   1. Can get specific Amazon resource by using multiple filters
```angular2html
# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}
```
3. Data sources can be used to fetch data for other resources
   1. creating an aws_instance,
   2. now can use `data.aws_ami.amzlinux.id` to get the AMI ID

4. Meta arguments
   1. Depends on
   2. provider
   3. no lifecycle
   4. count, for_each
   5. 

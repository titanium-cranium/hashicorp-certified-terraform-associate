### Workspaces

1. CLI Based workspaces (Local or REmote backend)
   1. default workspace
      1. cannot be deleted
   2. allow switching between multiple instances of a single config within its single backend
   3. Create a parallel distinct copy of a set of infrastructure to test a set of changes before modifying prod infrastructure
   4. Not recommended for different environments (dev, test, staging, prod)
      1. instead use separate config directories
   5. Different from cloud workspaces
   6. Each workspace has its own terraform.tfstate file
   7. Will create exactly the same resources in each workspace
      1. naming needs to be considered as AWS will not allow the same names for some resources
         1. e.g. append workspace name to the resource name
      2. can test against workspace name to determine things like count or resource size
         1. `count = terraform.workspace == "default" ? 2 : 1`
   8. When using count, need to add wildcard * to the resource name in outputs to identify the specific resource
      1. e.g. `aws_instance.web.*`
   9. Remote backends with workspaces
      1. tf block 
         1. add workspaces to path in backend block
```angular2html
  backend "s3" {
    bucket = "terraform-stacksimplify"
    key    = "workspaces/terraform.tfstate"  <----
    region = "us-east-1" 

    # For State Locking
    dynamodb_table = "terraform-dev-state-table"     
  }
```
2. Commands
   1. `tf workspace show`
   1. `tf workspace list`
   1. `tf workspace new`
   1. `tf workspace select`
   1. `tf workspace delete`

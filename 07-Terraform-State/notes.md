### Terraform State

1. Backend
   1. Responsible for storing state and providing an API for state locking
   2. State storage
      1. AWS S3 State Storage 
   3. State locking
      1. Dynamo DB
      2. remote tf state file can't be operated on while TF is running, state is locked
      3. can force unlock if necessary
      4. Add parameter to terraform block backend for state locking
         1. e.g. `dymamodb_table = "terraform-def-state-table"`
      5. Need to run tf init again because the tf block has changed
example
```
terraform {
  required_version = "~> 0.14" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "terraform-stacksimplify"
    key    = "dev/terraform.tfstate"
    region = "us-east-1" 
    dynamodb_table = "terraform-dev-state-table"    <-- for state locking, table created via AWS console?
  }
}
```

   4. TF Cloud & TF Enterprise always use their own state storage
      1. Ignore any backend block in the config file
   5. Backend types
      1. Enhanced backends
         1. store state & perform operations (apply, destroy)
         2. e.g. local backend, remote backend
         3. remote backends performing operations only with TF Cloud or TF enterprise
            1. this makes sense, s3 has no compute
      2. Standard backends
         1. only store state, rely on local backend for performing operations with CLI
         2. 
         3. 
   6. TF State commands
      1. tf show
         1. converts output of binary tf state to human readable format
      2. tf refresh
         1. reconcile local tfstate with actual infrastructure
         2. "drift" comes from when someone makes a change to cloud infrastructure via aws console or another means outside of tf control
         3. tf plan on its own
            1. runs refresh to begin with, but only updates state in memory, not in the state file
            2. e.g.
               1. adding a tag to an instance in aws console
                  1. tfplan runs refresh
                     1. finds new tag, but not in 'desired' state
                     2. plans to -remove- the tag that was added in aws console
                        1. because the new tag is not in the existing manifest files
         4. Best practice is to run refresh, then plan, then decide whether to keep or discard the drift
            1. keep
               1. update the manifest files to match the actual current tfstate
               2. run refresh, then plan again, then apply
            2. discard
               1. Just run apply, it will remove any drift
      3. tf plan
      4. tf state
         1. tf state list
            1. list of all resources in tfstate file
         2. tf state show <resource_name>
            1. show the resource in tfstate file
            2. handy when infra gets very large
         3. tf state mv <resource_name> <new_resource_name>
            1. rename a resource in tfstate file
            2. **VERY DANGEROUS**
         4. tf state rm <resource_name>
            1. remove a resource from tfstate file
            2. **VERY DANGEROUS**
            3. removes a resource from being managed by terraform
               1. doesn't destroy the instance (in and of itself)
               2. tfplan will create a new resource that is managed by tf
         5. tf state replace-provider <old_provider_name> <new_provider_name>
            1. e.g. instead of aws, you want to use a fork of aws
         6. DISASTER RECOVERY
            1. tf state pull 
               1. manually download the tfstate file from s3
            2. tf state push
               1. manually upload local tfstate file to s3
            3. tf state force-unlock <LOCK_ID>
               1. removes lock on state
      5. Forcing Re-creation of Resources
         1. tf taint <resource_name>
            1. forces destroy/re-create on next apply 
         2. tf untaint <resource_name>
            1. manually unmarks a resource as tainted
            2. 
      6. tf apply -target=<resource.resource_name>
         1. Not to be used except in unusual circumstances
      7. tf force-unlock

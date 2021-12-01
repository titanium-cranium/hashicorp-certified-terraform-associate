1. Workflow
   1. init
      1. initialize working directory
         1. kind of like git init
         2. downloads plugins
            1. providers
      2. Creates terraform lock file
         1. `.terraform.lock.hcl`
   2. validate
      1. validates config files
         1. syntactically valid
         2. internally consistent
   3. plan
      1. generate execution plan
      2. performs a refresh and determines what actions are necessary
   4. apply
      1. applies changes from the plan
      2. 
   5. destroy
      1. removes all or part of infrastructure

2. Review TF manifest for EC2 instance
   1. Preconditions
      1. ensure default vpc in respective region
         1. view in console default-vpc exists
      2. ensure AMI you are provisioning exists in that region
         1. if not update AMI ID
         2. AMI = Amazon Machine Image (e.g. amazon-linux for ec2)
      3. Verify AWS Credentials
      4. 

3. TF language syntax
   1. Basic structure
      1. .tf terraform manifests (or config)
   2. Must be in tf working directory to execute commands
   3. Hashicorp Language
      1. Terraform basic structure
         1. Blocks
            1. resource
            2. Top level
            3. Block inside blocks
               1. e.g. provisioners
               2. tags
            4. Labels
               1. depends upon type
                  1. Resource block has two labels (e.g. resource "aws_instance" "ec2demo")
                     1. type name
                  2. variable block only has one label
                     1. var name
                  3. 
         2. Arguments
            1. argument name, arg value 
         3. Comments
   4. Arguments
      1. configure a particular resource
         1. resource specific
            1. some required, some optional
            2. reference in docs
   5. Attributes
      1. Value exposed by a particular resource
         1. `resource_type.resource_name.attribute_name`
            1. more or instance vars of the resource object
   6. Meta-arguments
      1. change a resource type's behaviour, not resource specific
         1. e.g.  count and for_each define how many resources are created
      2. `depends_on`
      3. `count`
      4. `for_each`
      5. `provider`
      6. `lifecycle`
4. Top Level Blocks
   1. Fundamental Blocks
      1. Terraform settings
         1. Can appear outside of any other block
         2. 
      2. Provider Block
         1. Which provider AWS, AZure, GCP
      3. Resource Block
         1. Which resources to provision
   2. Variable Blocks
      1. Input Variables Block
      2. Output Values Block
      3. Local Values Block
   3. Calling/Referencing Block
      1. Data Sources Block
         1. Get information from cloud provider
      2. Modules Block
         1. ???  


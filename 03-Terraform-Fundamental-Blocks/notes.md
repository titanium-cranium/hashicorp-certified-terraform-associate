1. Fundamental Blocks
   1. Terraform Block
      1. `required version` of terraform
         1. checks whether local cli matches
         2. # TODO: Can this change per repo??
            1. tf init allows this I think
      2. `required_providers` 
         1. specify source 
         2. specify version
         3. `tf init -upgrade` required to change provider versions
      3. `backend`
         1. where terraform state information saved
      4. `experiments`
      5. `provider_meta` 
         1. Passing metadata to providers
   2. Provider Block
      1. Critical Block (AWS, GCP, Azure)
      2. Declare providers
         1. aws
            1. requires region & aws credentials in block
      3. Multi-providers
         1. Can have aws listed multiple times
            1. perhaps different regions? or different profiles
            2. requires an "alias" argument
            3. provider gets called in other blocks by (provider.alias)
               1. uses provider meta-argument: `provider = aws.aws-west-1`
      4. Belong to Root module
   3. Dependency Lock File
      1. `.terraform.lock.hcl`
      2. Only looks at PROVIDER dependencies
      3. For modules, 
         1. use EXACT VERSION CONSTRAINT 
      4. matches provider checksums during installation
   4. Resource Block
      1. Describes one (or more) infra objects
      2. Behaviour
         1. How TF handles resource declarations
      3. Provisioners
         1. Configure Resource post-creation actions
         2. # TODO: not clear about what this is exactly 

### Terraform Resources

1. Syntax
2. Behaviour
   1. create
   2. destroy
   3. destroy and re-create
      1. e.g. change region
   4. update in place
      1. e.g. change tags
3. state file `terraform.tfstate`
   1. Current state of what is present in the cloud
      1. best to keep remote for sharing among team
   2. Current state vs Desired State
4. Meta-arguments
   1. depends_on
      1. handle hidden resource/module dependencies that TF can't automatically infer
      2. explicitly specifying a dependency only necessary when resource relies on some other resource behaviour but doesn't access any of that resource's data in its arguments
         1. e.g. other resource needs to be created before this resource
      3. available in module blocks and resource blocks
      4. list of references to other resources in the same or child modules
      5. No arbitrary expressions
      6. Use only as a last resort
   2. count
      1. resource or module block includes count arg, will create that many instances
      2. each resource created can be distinctly identified by its index
         1. count.index
            1. zero based
            2. `aws_instance_myvm[i]`
      3. can be used in both resource and module blocks
      4. CANNOT be used with for_each in same block
      5. count.index can be used for dynamic naming etc. (see example c2-ec2-instance.tr)
      6. 
   3. for_each
      1. resource or module block includes for_each arg, will create one instance per item in the list
      2. each object is accessible in the constructor block
         1. if the arg is an array:
            1. each.key only (each.value is not available)
         2. if the arg is a hash/dict:
            1. each.key returns i hash key
            2. each.value returns the i hash value
      3. CANNOT be used with count in the same block
   4. lifecycle
      1. nested block inside resource
      2. commands
         1. create_before_destroy = true
         2. prevent_destroy = true
            1. only works if the resource is named (removing the description of the resource *will* destroy the resource)
         3. ignore_changes = true
   5. provider
      1. provider = provider.alias
   6. provisioners
      1. discussed in section 9
   7. 

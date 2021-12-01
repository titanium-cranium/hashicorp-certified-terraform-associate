1. Terraform Variables

   1. Input variables
      1. allows aspects of modules to be customized without altering the module's own source code
         1. allowing modules to be shared between diff configurations
      2. Basics
      3. cli prompt
         1. If no default value exists and no var is given in cli or tf_vars tf will then prompt for input
      4. cli -var
         1. self-explanatory
      5. Env vars (TF_var_name)
         1. `export TF_VAR_var_name = "xxx"`
      6. terraform.tfvars
         1. tf autoload values will override defaults
         2. 
      7. file.tfvars
         1. same as terraform.tfvars
         2. able to put diff vars in diff files
         3. e.g. prod.tfvars for production instance vs. dev.tfvars for development instance
         4. NOT autoloaded, must be requested with -var-file arg
      8. -var-file arg
         1. self-explanatory
      9. auto.tfvars
         1. e.g. web.auto.tfvars
            1. autoloaded during tf plan or tf apply
      10. List/Map in Input vars
          1. can use `list(string)  or map(string` to create multiple values)
      11. Custom Validation rules
      12. Sensitive input vars
      13. syntax
          1. `variable "ec2_ami_id" {
             type = "string"
             description = "The ID of the AMI to use"
             default = "ami-0b3c5d1e7f9b7d0d3"
             validation {
               min_length = 1 && max_length = 255
               error_message= "The AMI ID must be between 1 and 255 characters long"
             }
             sensitive = true`
          2. used in resource def as `var.ec2_ami_id`
      14. variable precedence (loading order)
          1. TF_VAR_var_name
          2. terraform.tfvars
          3. terraform.tfvars.json
          4. *.auto.tfvars
          5. -var, -var-file cli options
          Variables will be overwritten in this order.

   2. output values (variables?)
      1. print values to stdout
      2. child module can expose resource attributes to parent module
      3. syntax
      `output "output_variable_name" {
         description = "some desc"
         value = resource.resource_name.attribute_name
      }`
      4. prints actual output values to stdout at end of tf apply
      5. 

   3. local variables
      1. Use in moderation
         1. can hide values
      2. syntax
      `locals {
         bucket-name = "$[var.app-name}-${var.env_name}-bucket"
      }`
      3. typically present in file when defining resources 
      4. 

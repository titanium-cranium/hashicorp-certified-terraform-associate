###  Provisioners

1. Description
   1. Used to model specific actions on the local machine or on a remote machine in order to prepare servers
      1. passing data into virtual machines
      2. running configuration mgmt software (e.g. packer, chef, ansible)
   2. Should only be used as a LAST RESORT
   3. Use a first-class TF provider (aws, gcloud, azure) or other as first choice
   4. Operation
      1. Creation-time
      2. Destroy-time
   5. Failure behaviour
      1. Continue
         1. ignore error and continue with creation/destruction
      2. Fail
         1. raise error and stop applying (default behaviour)
         2. if "creation" provisioner, taint resource
   6. Types
      1. File Provisioner
         1. used to copy files or dirs from the machine executing TF to the newly created resource
            1. ssh, winrm
      2. remote-exec Provisioner
      3. local-exec Provisioner
   7. Connection Block
      1. Most provisioners require access to the remote resource via ssh or WnRM
         1. expect a nested connection block with details about how to connect
      2. Cannot refer to parent resource by name,
         1. instead use self object (a bit like a python class)
         2. Unless it's a null resource, then you can use the parent resource's name

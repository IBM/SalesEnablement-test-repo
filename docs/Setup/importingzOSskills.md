# Importing pre-packaged z/OS skills
Provided with Version 2 of watsonx Assistant for Z is a set of pre-packaged skills which can be used to automate various tasks on z/OS, such as running different console commands and retrieving logs from batch jobs.

The list of pre-packaged skills available include:

- Authorized program list

- z/OS IPL Information

- Display zOS parmlib datasets

- Unix System services options

- Display zOS subsystems

- List spool files

- Retrieve dataset content

- Retrieve spool file content

- Retrieve z/OS Management Facility (OSMF) job status

IBM watsonx Orchestrate requires that any OSMF environment you connect to for skill execution has certificate authority (CA) signed certificates. In the case of the Ansible Automation Platform (AAP) & Wazi z/OS environment provisioned in IBM Technology Zone (ITZ), the z/OS system is not currently using CA signed certificates and therefore cannot execute the pre-packaged skills on your own z/OS system. For demo purposes, it is still recommended to import them so that the pre-packaged skills can be shown. 
     
Work is in progress to modify the ITZ environments so that they are enabled for skill execution using these pre-packaged skills. In the meantime, the underlying automation for these pre-packaged skills can still be demonstrated using the Ansible skill ‘z/OS Operator Command’ which is available to import. This works because the pre-packaged skills are executing console commands directly using OSMF APIs which can also be run using the Ansible template skill ‘z/OS Operator command’. For example, here are the console commands being used in some of the pre-packaged skills:

- Authorized Program list – ```operator command -> d prog,lnklist```
- z/OS IPL Information - ```operator command -> d iplinfo```
- Display zOS parmlib datasets - ```operator command -> d parmlib```
  
You can import the pre-packaged skills into your sandbox environment by downloading the .zip file from <a href="https://ibm.box.com/s/fs0keb7mhbovv0dhnls4h9akmbsjiubd" target="_blank"> here</a> and following <a href="https://www.ibm.com/docs/en/watsonx/waz/2.x?topic=importing-prepackaged-zos-skills" target="_blank">these instructions</a>.

You must extract the imbedded JSON file and modify the file for your environment by following <a href="https://www.ibm.com/docs/en/watsonx/waz/2.x?topic=files-building-skills-from" target="_blank">these instructions</a>.
# Importing pre-packaged z/OS skills
Provided with Version 2 of watsonx Assistant for Z is a set of pre-packaged skills. These skills are used to automate various tasks on z/OS, such as running different console commands and retrieving logs from batch jobs.

The list of pre-packaged skills available include:

- Authorized program list

- z/OS IPL Information

- Display zOS parmlib datasets

- UNIX System Services options

- Display zOS subsystems

- List spool files

- Retrieve dataset content

- Retrieve spool file content

- Retrieve z/OS Management Facility (OSMF) job status

IBM watsonx Orchestrate requires that any OSMF environment you connect to for skill execution has certificate authority (CA) signed certificates. 
     
As an example, the following are console commands that are used in some of the pre-packaged skills:

- Authorized Program list – ```operator command -> d prog,lnklist```
- z/OS IPL Information - ```operator command -> d iplinfo```
- Display zOS parmlib datasets - ```operator command -> d parmlib```
  
You can import the pre-packaged skills to your sandbox environment by downloading the compressed file <a href="https://ibm.box.com/s/fs0keb7mhbovv0dhnls4h9akmbsjiubd" target="_blank">here</a> and following <a href="https://www.ibm.com/docs/en/watsonx/waz/2.x?topic=importing-prepackaged-zos-skills" target="_blank">these instructions</a>.

Extract the embedded JSON file and modify the file for your environment by following <a href="https://www.ibm.com/docs/en/watsonx/waz/2.x?topic=files-building-skills-from" target="_blank">these instructions</a>.
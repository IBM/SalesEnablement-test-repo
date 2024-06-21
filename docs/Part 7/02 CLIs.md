In this exercise, explore several of the IBM Power Virtual Server (PowerVS) command line interfaces (CLIs). 

It is important to remember this is a shared environment and only limited administrative permissions are provided. 

For this exercise, the IBM Cloud Shell will be used. IBM Cloud Shell gives users complete control of their cloud resources, applications and infrastructure, from any web browser. IBM Cloud Shell provides pre-authenticated access to the latest tools and programming languages for cloud-based development, deployment and management of services and applications — all in a secure shell. IBM Cloud Shell is instantly accessible from the IBM Cloud portal. The IBM command line interface (CLI) along with all the IBM Cloud CLI plugins are pre-installed in IBM Cloud Shell, including the PowerVS CLIs.

It is also possible to install the IBM Cloud CLIs and PowerVS CLI plugin on other systems, like personal desktops, development servers, etc. To learn more about installing the PowerVS CLI locally click <a href="https://cloud.ibm.com/docs/power-iaas-cli-plugin?topic=power-iaas-cli-plugin-power-iaas-cli-reference" target="_blank">here</a>.

To get started, first open the IBM Cloud Shell from the IBM Cloud portal:

1. If not already opened, open the IBM Cloud Portal: <a href="https://cloud.ibm.com/" target="_blank">https://cloud.ibm.com/</a> and authenticate with your IBM Cloud credentials.
2. Change to the **{{account}}** account.

![](_attachments/SwitchAccounts-final.gif)

!!! tip
    If the browser window is narrow, this icon: ![](_attachments/SwitchAccountsIcon.png) may be seen instead of the current account name as shown in the screen capture above.

3. Click the IBM Cloud Shell icon ![](_attachments/CloudShellIcon.png).

![](_attachments/StartCloudShell-new.png)

The next steps are performed in using the IBM Cloud Shell window that was opened.

First, create a SSH private key file using the key provided in the IBM Technology Zone's reservation welcome e-mail.

Remember, to avoid typographical errors **copy** the command line using the ![](_attachments/CopyToClipboard.png) icon when it is available. Then paste the contents into the IBM Cloud Shell using ++ctrl++**+v**, ++cmd++**+v**, or right click and select paste at the prompt in the IBM Cloud Shell.

4. Display all the PowerVS plugin command line options.

```
ibmcloud pi --help | more
```
??? tip "Tip for novice Linux users!"
    Those not familiar with Linux commands, don't worry. The above command is actually 2 commands. The first is ```ibmcloud pi --help```. This executes the **help** option of the PowerVS plugin. The second command is the ```more``` command which pauses the output being displayed. The **"|"** or **pipe** character takes the output from the first command and sends it as input to the second command. To learn more about Linux commands do an Internet search on **Linux primer**.

5. Press the **space bar** to continue the output. Continue to press space bar several times to scroll through the complete output.

Notice the last part of the message says: **Enter 'ibmcloud pi [command] --help' for more information about a command.** Use this to get more help on individual PowerVS plugin commands.

6. List all the PowerVS workspaces provisioned in the account.

```
ibmcloud pi workspace ls
```

!!! info "Sample output"
    ![](_attachments/service-list-2024.png)

Note, the **PowerVS-L3-workspace** may not appear in your output.

To view the PowerVS instances in the workspace, the workspace target must first be set for the PowerVS plugin.

7. Set the workspace target using the instance ID of the workspace.

```
workspaceID=`ibmcloud pi workspaces 2>&1 | grep {{powerVS.serviceInstanceName}} | tail -1 | cut -f1 -d' '`
```

??? tip "Tip for novice Linux users!"
    The last command did 5 actions. First, it listed the workspace list like in step 6 and redirected both the error and standard output to the standard output stream (**2>&1**). Next, the output is filtered (grep) to just show the line for the {{powerVS.serviceInstanceName}}. Then the output from the **grep** command is sent to the **cut** command where all the output except the first field up to to the first space character is ignored (**-f -d' '**). And finally, the output from the **cut** command was stored in an environment variable called **workspaceID**. Why did we do this? Because no one wants to type **crn:v1:bluemix:public:power-iaas:wdc07:a/ba0e33c9056f470ca19de009747ec654:e7156c4d-eaf3-43e6-a972-a9782efa5e8d::** in order to run the next command.

8. Use the **$workspaceID** environment variable to set the target of future PowerVS plugin commands to the workspace.

```
ibmcloud pi workspace target $workspaceID
```

!!! info "Sample output"
    ![](_attachments/service-target-2024.png)

9. List all the PowerVS instances provisioned in the targeted PowerVS workspace.

```
ibmcloud pi instance list
```

!!! info "Sample output"
    ![](_attachments/instances-2024.png)

10. View the details of the **{{aixServer1.name}}** instance.

```
ibmcloud pi instance get {{aixServer1.name}}
```

!!! info "Sample output"
    ![](_attachments/aixinstance-detail-2024.png)

**Hint**: Business Partners should record the value of the **Storage Pool Affinity** field in the output from the above command.

Thus far, all of these commands have been **read** commands. The PowerVS CLIs also support **create** and **update** commands, but remember that user IDs have limited access in this shared environment. Try the **instance update** command and see what happens.

11. Recall that our Power environment consists of a total of 3 PowerVM instances: {{aixServer1.name}}, {{linuxServer1.name}}, and {{ibmiServer1.name}}. Up until now we've primarily been issuing instructions to perform work against {{aixServer1.name}}. Given that the testing environment is primarily limited to read-only actions, let's inspect one of the other VMs and determine what (if any) differences exist between the various instances.

Issue the following command to the IBM Cloud Shell:
```
ibmcloud pi instance get {{linuxServer1.name}}
```

And then issue a second command:
```
ibmcloud pi instance get {{ibmiServer1.name}}
```

Notice that the two tables are nearly identical, but there are some differences due to the different operating systems specified.

12. There are numerous reasons why one might want to generate an SSH private key for managing a PowerVS environment. In fact, that's exactly what the service's administrators did in order to authorize access to the PowerVS instance — recall first connecting to the PowerVS virtual machines remotely via the IBM Cloud Shell with the supplied key information.

The IBM Cloud Shell is capable of generating an SSH key that is configured for password-less authentication (in other words, allowing users to authenticate without needing to also supply a password). This can be done using IBM Cloud Shell, or any Linux environment, using the following ssh-keygen command:

```
ssh-keygen -t ed25519 -N '' -f newKey
```

!!! info "Sample output"
    ![](_attachments/part7_step12.png)

Use the PowerVS CLIs to create a key for the instance using an imported RSA public key. Specify the key pair generated above as the source (newKey). Do so using the following command. (Note: newKeyPOWER is the name of the IBM Power CLI-generated key that is to be created; newKey is the SSH key generated earlier using the IBM Cloud Shell).

!!! tip "SSH keys"
    Be aware that the SSH key-pair generated and assigned by this step is specific to IBM Power Systems. These are distinct from ones generated previously using the IBM Cloud Shell.

```
ibmcloud pi ssh-key create newKeyPOWER --key newKey
```

!!! info "Sample output"
    ![](_attachments/sshkeyCreate.png)

As expected, the instruction fails to execute because of insufficient (locked down) permissions within this testing environment. Next, experiment with other IBM Power CLIs. Many instructions and commands will meet with similar results, but it nevertheless is good practice given that there is no risk to the system within this sandbox environment.


13. Restart the **{{linuxServer1.name}}** instance.

```
ibmcloud pi instance {{linuxServer1.name}} -o soft-reboot
```

!!! info "Sample output"
    ![](_attachments/instance-soft-reboot-2024.png)
    Note, an enhancement request has been submitted to improve the CLI error messages.

There are over 100 PowerVS CLIs. Feel free to explore these using the TechZone environment. Remember, use ```ibmcloud pi --help``` or ```ibmcloud pi <command> --help``` to get detailed information on a command's usage.

Now, it is time to provision a VMware Cloud Foundation (VCF) instance. Use the click-thru demonstration to practice provisioning a VCF instance.

The VCF instance in this click-thru demonstration was created with a **consolidated** architecture and not a **standard** architecture with separate management and workload clusters.

!!! tip
    
    In this click-thru demonstration, several different user interfaces are used: the IBM Cloud Portal for VCF, IBM Cloud Portal for VPC, and Microsoft Remote Desktop. When switching between these interfaces a **Click to Continue** button will appear. Simply click it and the context will switch to the next interface.
    
    If you are ever not sure where to click or what to do next? Simply click anywhere on the screen and the spot to click next will be highlighted.

1. Open the link and then click play ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

**Click-thru demo:** <a href="https://ibm.github.io/SalesEnablement-VMware-L3/includes/vcf-managing/index.html" target ="_blank">Provision an instance of IBM Cloud for VMware Cloud Foundation</a>

2. Click the **VMware** ![](_attachments/VMicon.png) icon in the left menu bar.
3. Click **Cloud Foundation** under **Resources** in the left menu.
4. Click **vmware-explore** in the table of VCF instances.

In the summary view, general information about the instance is displayed including the type of subscription, region, and resource group. Also, find a link to the virtual private cloud (VPC) instance where the VCF instance is deployed.

5. Click **vcf-ibm-1cc-vpc** under **VPC name**.

A new browser tab is opened to the overview page of the VPC. For this demonstration, the focus is on the VCF instance and not the VPC. Information available under the VPC section might be required during steady state management of the instance.

6. Click **Click to Continue**.
7. Click the **VMware Solutions** browser tab.
8. Click **Advanced Edition** under **Plan**.

This page shows all the VMware software components that are licensed for each plan. Note, it is not possible to change subscription plans after the instance is provisioned.

9. Click the **x** at the upper left to close the page.
10. Click the **Infrastructure** tab.

This VCF instance was deployed with the **consolidated** architecture and thus only one domain/cluster is listed. 

11. Click **6 uplinks** in the table.

This page displays both the private and public uplinks that are associated with the consolidated cluster.

12. Click the **x** at the upper right to close the page.
13. Click **us-east-2-m01** in the table.

Observe the details about the cluster. Notice that this cluster has 5 hosts.

14. Click **bx2d-metal-96x384** under **Host profile**.

Hosts in a cluster must be homogeneous in their configurations. 

15. Click the host profile pop-up to close it.
16. Click **vSAN** under **Storage type**.

A summary of the provisioned storage is displayed.

17. Click the storage summary pip-up window to close it.
18. Click **8** under **Subnets**.

Observe the list of subnets that are associated with the cluster. Click the individual subnets to open the subnets page in the VPC infrastructure portal pages.

19. Click the **x** at the upper right to close the page.
20. Click **Add host**.

Notice in the **Add host** dialog, that no ability to change the host profile is available as all hosts in a cluster must be of the same configuration. 

21. Click the **Host quantity** field.

As mentioned in the provisioning demonstration, the number of hosts that are allowed per cluster is limited by both VMware limitations and IBM Cloud VPC limitations.

Before adding the hosts, the hostname suffix can be modified. In this demonstration, new hosts are not added.

22. Click **Cancel**.
23. Click **Access information**.

This page displays all the information that is related to the VMware management components associated with the VCF instance. The virtual fully qualified domain name (FQDN), application ID, and passwords are found here and can be used to access those management tools. Later, you will access the SDDC manager by using this information.

24. Click **Actions** at the upper right.

The **Actions** menu is available on all tabs that are associated with the VCF instance. These quick links are useful when managing the instance.

- **Refresh**
  
  Refreshes the current view.

- **Go to VPC** 
  
  Opens a new browser tab to the VPC section of the IBM Cloud portal like seen earlier.

- **Go to Schematics**

  Opens a new browser tab to the IBM Schematics workspace for the instance. This page contains the logs that are associated with the provisioning process and other activity that is associated with the instance.

- **Go to Logging Service**

  Opens a new browser tab to the IBM Cloud logging instance that was configured for the VCF instance (and possibly other cloud services).

- **Delete Instance**

  Starts the automated process to delete the VCF instance.

25.  Click **Refresh**.
26.  Click **Go to SDDC console**.

Take a moment to read the information in the **Accessing the SDDC Manager console** dialog. In short, there are two ways to access the console that is running on the private VPC network. One is through a virtual private network (VPN), and the other is by using a jump server. Recall during the provisioning process a jump server can be provisioned in the VPC to access the VMware components. As the jump server is a Microsoft Windows server, a Microsoft Windows Remote Desktop client must be used to access it. 

27. Click **Cancel**.
28. Click **Click to Scroll**.
29. Click the **Copy** icon ![](_attachments/copyIcon.png) next to the FQDN for the SDDC Manager.
30. Click **Click to Continue**.

This view shows a tile with the IP address and administrator authentication credentials for the host SDDC Manager instance.

31. Click the **VCF-JumpServer-BB** tile.

The Microsoft Windows Remote Desktop opens a connection to the Windows Server. A browser window is already opened, which is used to open the web-based interface to the SDDC Manager.

32.  Click the browser's URL field.
33.  Click **Paste** to paste the SDDC Manager FQDN copied earlier.

To authenticate to the SDDC Manager, the local account credentials need to be used.

34. Click **Click to Continue**.
35. Click the **Copy** icon ![](_attachments/copyIcon.png) next to the local account information for the SDDC Manager.
36. Click **Click to Continue**.
37. Click **example@domain.local** in the user ID field.
38. Click **administrator@vsphere.local**
39. Click the **Password** field.
40. Click **Paste** to paste the SDDC local account password copied earlier.
41. Click **LOGIN**
    
SDDC Manager is used to run administration tasks on the VMware Cloud Foundation instance. The SDDC Manager UI provides an integrated view of the physical and virtual infrastructure and centralized access to manage the physical and logical resources

42. Click **Hosts** under **Inventory**.
    
Observe the same 5 hosts that were provisioned in the consolidated cluster of the VCF instance.

Again, the purpose of this demonstration was to highlight the management capabilities of VCF from the IBM Cloud portal. You can learn more about VMware SDDC Manager <a href="https://docs.vmware.com/en/VMware-Cloud-Foundation/5.0/vcf-admin/GUID-D143F07A-B3FA-4A14-8D03-BFD2C1810D2E.html" target="_blank">here</a>.

That concludes the **managing** portion of the demonstration.
The following module guides Business Partners and IBM sellers through the process of provisioning **VMware as a Service (VMwaaS)** *single-tenant* with the IBM Cloud portal. Extra context on parameters and options is provided illustrating the value of features to users along with links to extra reference material.

#
# Click-Thru demonstration
-----------------------------

 Use the click-thru demonstration to practice the provisioning process. The fields that require a text entry (for example Provider Virtual Data Center name) are automatically populated in the click-thru demonstration. 

!!! Note "Navigation in the click-thru demonstration."
    
    Not sure where to click or what to do next? Click anywhere on the screen within the click-thru demo page and the spot to interact with next is highlighted. Step-by-step instructions on how to run the demo follow.

#
# Step-by-step Instructions
----------------------

!!! Important "Read before continuing!"

    VMware Solutions, including the VMwaaS and other offerings, are accessible through the <a href="https://cloud.ibm.com/vmware" target="_blank">VMware portal on IBM Cloud</a>. For this Level 3 course, these steps are intended to be followed in the **click-thru demonstration**; however, they can also be used to create a new instance. If you provision a live VMwaaS instance in your *personal* IBM Cloud account, then your account (and credit card that is associated with that account) is billed for the deployment. **Your user ID does not have permissions to complete these steps in the IBM Technology Zone (ITZ) environment associated with this course. These resources are already created in the ITZ environment.**

##
## Provision a site (single-tenant)


1. Open the click-thru demo and then click play ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

     **Click-thru demo:** <a href="https://ibm.github.io/SalesEnablement-VMware-L3/includes/VMwaaS-provision-site/index.html" target ="_blank">Provision an instance of VMwaaS</a>

2. Click the VMware (![](_attachments/VMicon.png)) icon in left-hand side navigation menu.
3. Click the **VMware as a Service** tile (middle of the sceen).

    A VMwaaS single-tenant **site** is a deployment of VMware vCloud Director on dedicated infrastructure. A **virtual data center (VDC)** is a logical data center that uses the infrastructure resources of a **site**. A **site** must be created before a VDC can be provisioned. A **Provider Virtual Data Center (PVDC)** is a grouping of compute and storage resources from a single VMware vCenter Server. A provider virtual data center consists of one or more resource pools (clusters) and one or more datastores.

4. Click the **Cloud Director Site** tile.
5. Click in the **Name** field.
   
    Specify a descriptive name for the Cloud Director site as it cannot be changed after the site is provisioned. 

6. Click the **Resource Group** drop-down menu.

    Resource groups are used to help manage resources and billing in an IBM Cloud account.

7. Click the **Enablement-L3** resource group.
8. Click in the **Provider Virtual Data Center (VDC) name** field.
9. Click the **Dallas 12** in the **Provider VDC location** table.

    VMwaaS is not available in all IBM Cloud data centers. Always verify the current locations in the IBM Cloud portal or the documentation <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-tenant-plan-deploy#tenant-plan-deploy-locations" target="_blank">here</a>.

10. Click in the **Cluster name** field.

    A single-tenant **site** consists of one or more VMware vCenter **clusters**. Clusters are the building blocks of PVDCs. When initially provisioning a VMwaaS site, just one cluster can be provisioned. More clusters can be added later. A minimum of 2 hosts are required for NFS-only storage clusters. A minimum of 6 hosts are required for vSAN plus optional NFS storage clusters. All hosts in a cluster must be homogeneous in their configuration and must be chosen from the supported configurations. Supported configurations will change over time, consult the IBM Cloud portal or the documentation <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-tenant-plan-deploy#tenant-plan-deploy-bms-req" target="_blank">here</a> for the current supported configurations. Hosts can be added and removed to increase and decrease capacity of the cluster. This capability will be explored in the next section of this demonstration guide. 

11. Click the **vSAN + optional NFS storage** radio button.

    ??? question "BP quiz question"
    Take note of the available storage capacity options.

    VMwaaS supports both network file storage (NFS) and VMware vSAN (virtual Storage Area Network) storage. You can select NFS only storage or vSAN storage with optional NFS storage. 
        
    vSAN with optional NFS storage is only available in IBM Cloud data centers with networks of 25 gigabits (GbE) bandwidth. vSAN clusters use bare metal host profiles with local flash storage. vSAN clusters can also use NFS storage.

    VWMare vSAN deduplication and compression are available to reduce redundant data within each disk group. This option can increase overall storage space based on the data type.

    Storage encryption is provided with unique IBM-managed encryption keys per instance with encrypted VMware storage profiles

12. Click the **NFS-only storage** radio button.

    !!! Important
        In this click-thru demo and in the associated ITZ environment, the VMwaaS **site** that is created is a **NFS-only** site. This option was chosen to reduce long-term costs of the environment. The **vSAN** provisioning options are explored in the click-thru demo, but a **vSAN** cluster is not provisioned or available in the ITZ environment.

13. Click the **+** icon to add a **0.25 IOPS/GB** NFS storage device.

    With NFS, clients can choose from 0.25, 2, 4, and 10 input/output operations per second per gigabyte (IOPS/GB) performance options. A minimum of one unit of 2 IOPS/GB or higher must be selected in NFS-only clusters.

14. Click the **Veeam Backup and Replication** toggle button to disable the installation of Veeam.

    At the time this document was written, the only add-on service available at provisioning time was Veeam. To learn more about Veeam, go <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-tenant-veeam" target="_blank">here</a>. Veeam is not deployed for the demonstration.

15. Click the **I have read and agreed to the following license agreements** checkbox.
16. Click the **Create** button.

The provisioning process is automated and includes provisioning the bare metal servers and deploying the VMware software stack. Provisioning time varies based on the number and configuration of the bare metal servers. When the ITZ environment used for this learning plan was originally created, the provisioning of the site took approximately 48 hours. Unfortunately longer than expected as the unofficial target is ~24 hours.

##
## Provision a virtual data center (single-tenant)

When the provisioning process of the **site** is complete, the status turns from **Creating** to **Available**. When the site is available, a VDC can be created within the PVDC. Use the click-thru demo and these steps to learn about this process.

1. Open the click-thru demo and then click play ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

     **Click-thru demo:** <a href="https://ibm.github.io/SalesEnablement-VMware-L3/includes/VMwaaS-provision-VDC/index.html" target ="_blank">Provision a virtual data center</a>

2. Click the **Virtual data centers** tab.
3. Click **Create new +**
4. Click the **Virtual data center** tile.
5. Click in the **Name** field.

    Specify a descriptive name for the VCD as it cannot be changed after the site is provisioned.

6. Click the **Resource Group** drop-down menu.

    Resource groups are used to help manage resources and billing in an IBM Cloud account.

7. Click the **Enablement-L3** resource group.

    Recall that a VDC must be associated with a **site**. Since only 1 site currently exists in this account, the **Location**, **Cloud Director Site**, and **Provider Virtual Data Center** fields are already populated and cannot be changed. If other sites or PVDCs were configured, the user would need to specify which ones to use.

8. Click the **Fast provisioning of VMs using linked clones** toggle button.

    The **Fast provisioning of VMs using linked clones** option saves time by using linked clones for virtual machine provisioning. This option is enabled at the provider virtual data center (PVDC) level. Fast provisioning can be enabled for any VDCs created within the PVDC. If not enabled, all provisioning operations use full clones. To learn more about fast provisioning, check out VMware's documentation <a href="https://docs.vmware.com/en/VMware-Cloud-Director/10.4/VMware-Cloud-Director-Tenant-Portal-Guide/GUID-4C232B62-4C95-44FF-AD8F-DA2588A5BACC.html" target="_blank">here</a>. 

9. Click the **Performance - M** radio button in the **Edge types** table.

    VDCs connect to the public and IBM private networks through edges. Edges can also be used to connect multiple VDC networks together. Currently, four choices of **edge** types are supported. Be sure to note the networking elements that can be enabled with each: 

    - **Efficiency** These edges allocate networking resources that can be used by up to 100 VDCs before another efficiency edge needs to be created. Processors and memory are used from the single tenant site. New edge storage is allocated at an extra cost. Subsequent VDCs, up to 100, can use this edge at no extra cost. This option is suitable for saving resources and costs with independent networking control per VDC.

    - **Performance - M** This option is suitable when only Layer 2 (L2) through L4 features such as Network Address Translation (NAT), routing, L4 firewall, and L4 load balancers are required. This option is suitable when the total throughput requirement is less than two gigabits per second (Gbps).

    - **Performance - L** This option is suitable when only L2 through L4 features such as NAT, routing, L4 firewall, and L4 load balancers are required. This option is suitable when the total throughput requirement is in the range of two to 10 Gbps.

    - **Performance - XL** This option is suitable when the total throughput required is multiple Gbps for L7 and one or more virtual private networks (VPNs) are required. 

    The **Create without network edge** option is suitable for centralized networking administration and control over multiple VDCs. Learn more about this option <a href="https://cloud.ibm.com/docs/vmware-service?topic=vmware-service-vdc-adding#vdc-adding-procedure" target="_blank">here</a>.

10. Click the **I have read and agreed to the following license agreements** checkbox.
16. Click the **Create** button.

The provisioning process is automated. Provisioning time varies based on the site configuration and network edge option selected. When the ITZ environment used for this learning plan was originally created, the provisioning of the site took approximately 2 hours.

Now that a **site** and a **VDC** are provisioned it is time to look at the management capabilities through the IBM Cloud portal.
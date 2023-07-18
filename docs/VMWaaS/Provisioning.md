The following module guides Business Partners and IBM sellers through the process of provisioning a **VMware as a Service (VMWaaS)** with the IBM Cloud portal. Extra context on parameters and options is provided illustrating the value of features to users along with links to extra reference material.

#
# Click-Thru demonstration
-----------------------------

Begin by simulating how to provision a VMware Shared instance. Use the click-thru demonstration to practice the provisioning process. The fields that require a text entry (for example Provider Virtual Data Center name) are pre-populated in the click-thru demonstration. Open the link and then click play ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

!!! Note "Navigation"
    Not sure where to click or what to do next? Click anywhere on the screen within the click-thru demo page and the spot to interact with next is highlighted. Step-by-step instructions on how to run the demo follow.

#
# Step-by-step Instructions
----------------------

VMware Solutions, including the VMWaaS and other offerings, are accessible through the <a href="https://cloud.ibm.com/vmware" target="_blank">VMware portal on IBM Cloud</a>. For this Level 3 course, these steps are intended to be followed in the click-thru demonstration; however, they can also be used to create a new instance. If you provision a live VMWaaS instance in your *personal* IBM Cloud account, then your account (and credit card that is associated with that account) is billed for the deployment. **You'r user ID does not have permissions to complete all the steps in the IBM Technology Zone (ITZ) environment associated with this course.**

#
# Provision a site (single-tenant)


1. Open the click-thru demo and then click play ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

   **Click-thru demo:** <a href="https://ibm.github.io/SalesEnablement-test-repo/includes/VMaaS-provision-site/index.html" target ="_blank">Provision an instance of VMWaaS</a>

2. Click the VMware (![]_attachments/VMicon.png)) icon in navigation menu.
3. Click the **VMware as a Service** tile.

    A VMWaaS single-tenant **site** is a deployment of VMware vCloud Director on dedicated infrastructure. A **virtual data center (VDC)** is a logical data center that uses some or all of the resources of a **site**. A **site** must be created prior to creating VDCs. A **site** can have zero or more **VDCs**. 

4. Click the **Cloud Director Site** tile.
5. Click in the **Name** field.

   Specify a descriptive name for the Cloud Director site as it cannot be changed after the site is provisioned. 

6. Click the **Resource Group** drop-down menu.

   Resource groups are used to help manage resources and billing in an IBM Cloud account.

7. Click the **Enablement-L3** resource group.
8. Click in the **Provider Virtual Data Center (VDC) name** field.
9. Click the **Dallas 12** in the **Provider VDC location** table.

   VMaaS is not available in all IBM Cloud data centers. Always verify the current support locations in the IBM Cloud portal or the documentation <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-tenant-plan-deploy#tenant-plan-deploy-locations" target="_blank">here</a>.

10. Click in the **Cluster name** field.

    A single-tenant **site** consists of one or more VMware vCenter **clusters**. Clusters are the building blocks of PVDCs. When initially provisioning a VMWaaS site, just one cluster can be provisioned. More clusters can be added later. A minimum of 2 hosts are required for NFS-only storage clusters. A minimum of 6 hosts is required for vSAN plus optional NFS storage clusters. Hosts can be added and removed to increase and decrease capacity of the cluster. All hosts in a cluster must be homogeneous in their configuration and must be chosen from the support configurations.

    Clients specify the hosts from a set of bare metal configurations. Supported configurations will change over time, consult the IBM Cloud portal or the documentation <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-tenant-plan-deploy#tenant-plan-deploy-bms-req" target="_blank">here</a> for the current supported configurations.

    VMWaaS supports both network file storage (NFS) and VMware vSAN (virtual Storage Area Network) storage. You can select NFS only storage or vSAN storage with optional NFS storage. 

11. Click the **vSAN + optional NFS storage** radio button.

    vSAN with optional NFS storage is only available in IBM Cloud data centers with networks of 25 gigabits (GbE). vSAN clusters use bare metal host profiles with local flash storage and a RAID 6, FTT=2 policy. vSAN clusters can also use NFS storage.

    If you want to save storage space, you can enable vSAN deduplication and compression to reduce redundant data within each disk group. This option can increase overall storage space based on the data type.

12. Click the **NFS-only storage** radio button.

!!! Important
    In this click-thru demo and in the associated ITZ environment, the VMWaaS **site** that is created is a **NFS-only** site (learn more about these terms in a few minutes). This option was chosen to reduce long-term costs of the environment. The **vSAN** provisioning options are explored in the click-thru demo, but a **vSAN** cluster is not provisioned or available in the ITZ environment.

13. Click the **+** icon to add a **0.25 IOPS/GB** NFS storage device.

    With NFS, clients can choose from 0.25, 2, 4, and 10 input/output operations per second per gigabyte (IOPS/GB) performance options. A minimum of one unit of 2 IOPS/GB or higher must be selected in NFS-only clusters.

14. Click the **Veeam Backup and Replication** toggle button to disable the installation of Veeam.

    At the time this document was written, the only add-on service available at provisioning time was Veeam. To learn more about Veeam, go <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-tenant-veeam" target="_blank">here</a>. Veeam is not deployed for the demonstration.

15. Click the **I have read and agreed to the following license agreements** checkbox.
16. Click the **Create** button.

The provisioning process is automated and includes provisioning the bare metal servers and deploying the VMware software stack. Provisioning time varies based on the number and configuration of the bare metal servers. When the ITZ environment used for this learning plan was originally created, the provisioning of the site took approximately XXX hours.


#
# Provision a virtual data center (single-tenant)

The **Fast provisioning of VMs using linked clones** option saves time by using linked clones for virtual machine provisioning. This option is enabled at the provider virtual data center (PVDC) level. You can also enable fast provisioning for any VDCs created within the PVDC. If not enabled, all provisioning operations use full clones. To learn more about fast provisioning, check out VMware's documentation <a href="https://docs.vmware.com/en/VMware-Cloud-Director/10.4/VMware-Cloud-Director-Tenant-Portal-Guide/GUID-4C232B62-4C95-44FF-AD8F-DA2588A5BACC.html" target="_blank">here</a>. 


**Network edge**

VDCs connect to the public and IBM private networks through edges. Edges can also be used to connect multiple VDC networks together. Currently, four choices of **edge** types are supported: 
- **Efficiency** 	These edges allocate networking resources that can be used by up to 100 VDCs before another efficiency edge needs to be created. The first time an efficiency edge is selected new CPU, RAM, and storage resources are required. CPU and RAM are used from the single tenant site. New edge storage is allocated at a cost. Subsequent VDCs up to 100 can use this edge at no extra cost. This option is suitable for saving resources and costs with independent networking control per VDC.
- **Performance - M** 	This option is suitable when only Layer 2 (L2) through L4 features such as Network Address Translation (NAT), routing, L4 firewall, and/or L4 load balancers are required and the total throughput requirement is less than 2 gigabits per second (Gbps).
- **Performance - L** 	This option is suitable when only L2 through L4 features such as NAT, routing, L4 firewall, L4 load balancer are required and the total throughput is in the range 2 - 10 Gbps.
- **Performance - XL** 	This option is suitable when the total throughput required is multiple Gbps for L7 and VPN. 

The **Create without network edge** option is suitable for centralized networking administration and control over multiple VDCs. Learn more about this option <a href="https://cloud.ibm.com/docs/vmware-service?topic=vmware-service-vdc-adding#vdc-adding-procedure" target="_blank">here</a>.
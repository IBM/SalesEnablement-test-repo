The following module guides Business Partners and IBM sellers through the process of provisioning a **VMware as a Service (VMwaaS)** *multitenant* instance with the IBM Cloud portal. Extra context on parameters and options is provided illustrating the value of features to users along with links to extra reference material.

#
# Click-Thru demonstration
-----------------------------

 Use the click-thru demonstration to practice the provisioning process. The fields that require a text entry (for example Virtual Data Center name) are automatically populated in the click-thru demonstration. 

!!! Note "Navigation in the click-thru demonstration."
    
    Not sure where to click or what to do next? Click anywhere on the screen within the click-thru demo page and the spot to interact with next is highlighted. Step-by-step instructions on how to run the demo follow.

#
# Step-by-step Instructions
----------------------

!!! Important "Read before continuing!"

    VMware Solutions, including the VMwaaS and other offerings, are accessible through the <a href="https://cloud.ibm.com/vmware" target="_blank">VMware portal on IBM Cloud</a>. For this Level 3 course, these steps are intended to be followed in the **click-thru demonstration**; however, they can also be used to create a new instance. If you provision a live VMwaaS instance in your *personal* IBM Cloud account, then your account (and credit card that is associated with that account) is billed for the deployment. **Your user ID does not have permissions to complete these steps in the IBM Technology Zone (ITZ) environment associated with this course. These resources are already created in the ITZ environment.**

##
## Provision a multitenant Virtual Data Center (VDC)


1. Open the click-thru demo and then click play ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

     **Click-thru demo:** <a href="https://ibm.github.io/SalesEnablement-VMware-L3/includes/VMwaaS-mt-provisioning/index.html" target ="_blank">Provision a multitenant instance of VMwaaS</a>

2. Click the VMware (![](_attachments/VMicon.png)) icon in the navigation menu.
3. Click the **VMware as a Service** tile.
4. Click the **Help me choose** link.

These windows provide clients additional information and differentiation between the VMwaaS single- and multitenant offerings. If you are not already familiar with the offerings, read the descriptions that are provided.

5. Click the **Compare** tab.
6. Click the **x** at the upper right to close the help information window.
7. Click in the **Name** field.

    Specify a descriptive name for the VCD as it cannot be changed after the site is provisioned.

8. Click the **Resource Group** drop-down menu.

    Resource groups are used to help manage resources and billing in an IBM Cloud account.

9. Click the **Enablement-L3** resource group.


Notice the 2 **Pricing plan** tiles. Clients can choose either an on-demand or reserved pricing model. Learn more about the available pricing plans <a href="https://cloud.ibm.com/docs/vmware-service?topic=vmware-service-mt_pricing" target="_blank">here</a>. It is important to understand that with the on-demand model resources are not preallocated. Delays might occur when requesting extra resources. With the reserved model, resources are preallocated and availability is guaranteed. However, clients are charged for the resources even if they aren't used.


1.  Click the **Location** button.

At the time this click-thru demonstration was created, VMwaaS multitenant was only available in Dallas, Frankfurt, and Washington, DC. Refer to the product <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-tenant-plan-deploy" target="_blank">documentation</a> or the IBM Cloud Portal for the list of currently supported locations.

11. Click **Washington, DC**.

At the time this click-thru demonstration was created, only a single **Cloud Director Site** was available in the Washington, DC location. Other management site's will be added as the number of VDCs grow.

12. Click the **Provider Virtual Data Center** button.

Clients can select a specific datacenter with in the selected location geography. Clients want to have this flexibility as they deploy workloads that require higher availability across datacenters. 

13. Click the **WDC07** datacenter.
14. Click the **information** icon ![](_attachments/infoIcon.png) above the **Fast provisioning of VMs using linked clones** toggle button.


    The **Fast provisioning of VMs using linked clones** option saves time by using linked clones for virtual machine provisioning. This option is enabled at the provider virtual data center (PVDC) level. Fast provisioning can be enabled for any VDCs created within the PVDC. If not enabled, all provisioning operations use full clones. To learn more about fast provisioning, check out VMware's documentation <a href="https://docs.vmware.com/en/VMware-Cloud-Director/10.4/VMware-Cloud-Director-Tenant-Portal-Guide/GUID-4C232B62-4C95-44FF-AD8F-DA2588A5BACC.html" target="_blank">here</a>. 

15. Click the **Fast provisioning of VMs using linked clones** toggle button.
16. Click the **information** icon ![](_attachments/infoIcon.png) above the **Network edge** toggle button.

    VDCs connect to the public and IBM private networks through edges. Edges can also be used to connect multiple VDC networks together. Currently, four choices of **edge** types are supported. Note the networking elements that can be enabled with each: 

    - **Efficiency** These edges allocate networking resources that can be used by up to 100 VDCs before another efficiency edge needs to be created. Processors and memory are used from the single tenant site. New edge storage is allocated at an extra cost. Subsequent VDCs, up to 100, can use this edge at no extra cost. This option is suitable for saving resources and costs with independent networking control per VDC.

    - **Performance - M** This option is suitable when only Layer 2 (L2) through L4 features such as Network Address Translation (NAT), routing, L4 firewall, and L4 load balancers are required. This option is suitable when the total throughput requirement is less than two gigabits per second (Gbps).

    - **Performance - L** This option is suitable when only L2 through L4 features such as NAT, routing, L4 firewall, and L4 load balancers are required. This option is suitable when the total throughput requirement is in the range of two to 10 Gbps.

    - **Performance - XL** This option is suitable when the total throughput required is multiple Gbps for L7 and one or more virtual private networks (VPNs) are required. 

    The **Create without network edge** option is suitable for centralized networking administration and control over multiple VDCs. Learn more about this option <a href="https://cloud.ibm.com/docs/vmware-service?topic=vmware-service-vdc-adding#vdc-adding-procedure" target="_blank">here</a>.

17. Click the table of listing the different edge types.
18. Click the **information** icon ![](_attachments/infoIcon.png) above the **Enable consumption limits** toggle button.

??? question "BP quiz question"
    Take note of resources that can be used to limit consumption.

vCPU and RAM charges for on-demand VDCs are based on the amount that is used for running workloads. To control costs, clients can use limits to restrict the maximum amount of vCPU and RAM usage in the VDC.

19. Click the **vCPU limit (cores)** entry box.

At the time this click-thru demonstration was created, the default value for vCPU cores was set to the maximum of a VDC. In the future, expect the default to be the minimum of 1, instead of the maximum of 2000.

20. Click the **RAM limit (GB)** entry box.

At the time this click-thru demonstration was created, the default value for RAM was set to the maximum of a VDC. In the future, expect the default setting to be the minimum of 1, instead of the maximum of 40960.

21. Click the **I have read and agreed to the following license agreements** checkbox.
22. Click the **Create** button.

The provisioning process is automated. Provisioning time varies based on the configuration and network edge option selected. When the ITZ environment used for this learning plan was originally created, the provisioning of the site took approximately 15 minutes.

Now that a multitenant **VDC** is provisioned, it is time to look at the management capabilities through the IBM Cloud portal.
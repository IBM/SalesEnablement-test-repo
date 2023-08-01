!!! Important "**This chapter is optional for Sales but required for Technical Sales.**"

The network for a VMware as a Service environment is a critical element that clients must plan carefully. Some information on network planning is provided in the IBM Cloud documentation <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-vdc-adding" target="_blank">here</a>. VMware also has good documentation that is accessible through the vCloud Director web console or <a href="https://docs.vmware.com/en/VMware-Cloud-Director/10.4/VMware-Cloud-Director-Tenant-Portal-Guide/GUID-0544FE2A-B036-43E0-B549-40BACDF261B6.html" target="_blank">here</a>. The network implementation in this demonstration environment is minimal and should not be considered as a best of practice.

In this click-thru demonstration, use VMware Cloud Director (vCloud Director or vCD) to create data center groups, expand the scope of an edge gateway, and how to create a network for virtual machines (VMs). **Data Center Groups** allow administrators to group VDCs together to share network resources. Recall the second VDC created ({{itz.VMwaaS.vdc2}}) was created with no edge gateway. To allow network connectivity to virtual machines provisioned in the {{itz.VMwaaS.vdc2}} VDC, there needs to be a network and an edge gateway that is associated with the VDC. Next, learn how to create a data center group, expand the scope of the existing edge gateway, and how to create a network for the two VDCs.

!!! Important "You cannot perform these steps in the IBM Technology Zone (ITZ) environment."

    In ITZ, your IBM Cloud ID will have limited access controls to the IBM Cloud account that is used. Specifically related to the steps in this click-thru demo, you will NOT be able to do these actions. However, you will be able to view the resources created and modified in this section.  In the next chapter, you will have the ability to create, modify, and destroy virtual machines running in VMwaaS. 

#
# Click-Thru demonstration
-----------------------------

 Use the click-thru demonstration to practice. The fields that require a text entry (for example Provider Virtual Data Center name) are pre-populated in the click-thru demonstration. 

!!! Note "Navigation in the click-thru demonstration."
    
    Not sure where to click or what to do next? Click anywhere on the screen within the click-thru demo page and the spot to interact with next is highlighted. Step-by-step instructions on how to run the demo follow.

#
# Step-by-step Instructions
----------------------

##
## Network setup in VMware vCloud Director

1. Open the click-thru demo and then click play ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

     **Click-thru demo:** <a href="https://ibm.github.io/SalesEnablement-test-repo/includes/VMwaaS-setupNetwork/index.html" target ="_blank">Set up the network in vCloud Director</a>

2. Click **Go to VMware console**.

Note, each of the virtual data centers that are displayed are part of the same **site**/**provider virtual data center (PVDC)**, and use the same management infrastructure and vCD (VMware console) instance.

3. Click **SIGN IN WITH SINGLE SIGN-ON**.

Single-sign on (SSO) is enabled between IBM Cloud Identity and Access Management (IAM) and vCD when the site is created. It is possible to disable this feature.  You can learn more about this capability <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-iam-integration" target="_blank">here</a>.

4. Click the **Networking** tab.
5. Click the **Data Center Groups** tab.
6. Click **New**.
7. Click the **{{itz.VMwaaS.vdc1}}** radio button.
8. Click the **Name** entry field.
9.  Click **Next**.
10. Click the first checkbox (![](_attachments/checkBox.png)) to select all VDCs.
11. Click **Next**.
12. Click **Finish**.

Now that the **Data Center Group** is created, the scope of the existing edge gateway needs to be expanded from just the original VDC {{itz.VMwaaS.vdc1}} to include both VDCs.

12. Click the **Edge Gateways** tab.
13. Click the **{{itz.VMwaaS.vdc1}}** edge gateway in the table.

Notice in the **Scope** table, the **Organization Virtual Data Center** value is set to just the **{{itz.VMwaaS.vdc1}}** VDC.

14. Click **INCREASE SCOPE**.
15. Click the radio button for the **{{itz.VMwaaS.dcgroup}}** entry.
16. Click **OK**.

Now, notice that the **Scope** changed from the single VDC to the new **{{itz.VMwaaS.dcgroup}}** Data Center Group.

Next, a network needs to be created so virtual machines can have network connectivity.

17. Click the **Networks** tab.
18. Click **New**.
19. Click the **Data Center Group** radio button.
20. Click the **{{itz.VMwaaS.dcgroup}}** radio button.
21. Click **NEXT**.
22. Click **NEXT**.

A **Routed** network is chosen to allow the virtual machines to communicate with each other within the VDCs, and potentially outside to other resources like the Internet or other IBM Cloud services.

23. Click in the **Name** field.
24. Click in the **Gateway CIDR** field.

For this demonstration environment, the nonroutable 192.168.1.1/24 private network is specified. Later, explore how network address translation (NAT) can be configured to allow Internet access that uses the public IP addresses associated with the VDCs.

25. Click **NEXT**.
26. Click **NEXT**.
27. Click in the **Primary DNS** field.

Google's Public DNS (8.8.8.8) was initially specified when this click-thru demonstration was created. In the current ITZ environment, IBM Cloud public DNS addresses (161.26.0.10 and 161.26.0.11) are specified.

28. Click **NEXT**.
29. Click **NEXT**.
30. Click **FINISH**.

Now that the network is configured, the next step is to activate DHCP so VMs are automatically assigned network addresses when they are provisioned.

31. Click the **{{itz.VMwaaS.network}}** entry.
32. Click **DHCP**.
33. Click **ACTIVATE**.
34. Click **NEXT**
35. Click **ADD**
36. Click in the **Pools** field.

For this demonstration environment, the entire range of addresses are added to the DHCP pool.

37. Click **NEXT**.
38. Click in the **DNS Server 1** field.

Google's Public DNS (8.8.8.8) was initially specified when this click-thru demonstration was created. In the current ITZ environment, IBM Cloud public DNS addresses (161.26.0.10 and 161.26.0.11) are specified.

39. Click **NEXT**.
40. Click **FINISH**.

Basic network setup is now complete. No more click-thru demonstrations! In the next chapter, using your ITZ reservation, you will access the VMwaaS environment that was created and use vCD to provision and access virtual machines.
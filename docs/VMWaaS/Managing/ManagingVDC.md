In this click-thru demonstration, explore the management activities for a virtual data center (VDC) instance on IBM Cloud. Note, there are limited administrative tasks via the IBM Cloud portal for VDCs. Keep in mind all the steps shown here can be used in the IBM Technology Zone (ITZ) environment you provisioned up to the point of clicking **Create** or **Delete**. Attempts to create new resources in the ITZ environment result in an error similar to the one shown.

![](_attachments/CreateFailure.png)

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
## Manage a VDC and add a second VDC

1. Open the click-thru demo and then click play ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

     **Click-thru demo:** <a href="https://ibm.github.io/SalesEnablement-test-repo/includes/VMwaaS-add-VDC/index.html" target ="_blank">Add a virtual data center (VDC)</a>

2. Click the **{{itz.VMwaaS.vdc1}}** entry in the table of VDCs.

Notice the list of **Public IPs** associated with the VDC. These addresses can be used to assign to individual virtual machines (VMs) provisioned in the VDC or assigned to networks using network address translation (NAT).

3. Click the **Actions** drop-down menu.

The ability to delete a VDC is available both in this drop-down menu and in the VDC table from the previous screen. Recall the information about deleting clusters from the previous chapter. Deleting VDCs can only be done if all workloads are stopped in that VDC.

4. Click **Refresh**.
5. Click the **VMWare as a Service** link in the bread crumb list.
6. Click **Create new +**.
7. Click in the **Name** field.
8. Click the **Resource Group** drop-down menu.
9. Click **Enablement-L3**.
10. Click the **Fast provisioning of VMs using linked clones** toggle button.

Read the information message about the network edge. The original VDC created in this PVDC only had 2 hosts and a **Performance - M** network edge was created. Sufficient compute and memory resources are not available to add an efficiency edge. Thus the **Create without network edge** is automatically enabled for this VDC. In a later chapter, learn how to create a VDC group using the VMware vCloud Director web console, which allows this VDC to use the existing **Performance - M** network edge.

11. Click the **I have red and agreed to the following license agreements** checkbox.
12. Click **Create**.

The new VDC is now provisioning. Remember, VDCs use the existing infrastructure clusters of the PVDC so provisioning times are relatively quick, in this case about 30 minutes.


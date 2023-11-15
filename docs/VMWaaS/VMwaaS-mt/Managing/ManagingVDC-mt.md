In this click-thru demonstration, explore the management activities for a multi-tenant virtual data center (VDC) instance on IBM Cloud. Note, there are limited administrative tasks through the IBM Cloud portal for VDCs. All the steps that are shown here can be used in the IBM Technology Zone (ITZ) environment you provisioned up to the point of clicking **Create** or **Delete**. Attempts to create new resources in the ITZ environment result in an error similar to the one shown.

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
## Manage a multitenant VDC instance

1. Open the click-thru demo and click play ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

     **Click-thru demo:** <a href="https://ibm.github.io/SalesEnablement-VMware-L3/includes/VMwaaS-mt-managing/index.html" target ="_blank">Manage a multi-tenant virtual data center (VDC)</a>

2. Click the **VMware** (![](_attachments/VMicon.png)) icon in the navigation menu.
3. Click the **VMware as a Service** option under **Resources** in the left menu.
4. Click the **{{itz.VMwaaSmt.vdc}}** entry in the table of VDCs.

Notice the list of **Public IPs** associated with the VDC. These addresses can be used to assign to individual virtual machines (VMs) provisioned in the VDC or assigned to networks that use network address translation (NAT).

5. Click the **Modify limit** button.
6. Click the **Enable consumption limits** toggle button.

When consumption limits are turned off, the set limits for vCPU and memory are removed for the VDC. This allows users with appropriate permissions to add virtual machines that use any amount of vCPU and memory up to the limits of an entire VDC.

7. Click the **Enable consumption limits** toggle button again.
8. Click the **vCPU** field.
9. Click the **RAM** field.
10. Click the **Modify** button.

Modifying a VDC takes a few minutes and does not affect workloads running in the VDC. Notice the status of the VDC changes to **Modifying** and when complete it returns to **Available**.

11. Click the **Add-on services** tab.

At the time this click-thru demonstration was created, no additional services were available. Over time, other services will be added to the catalog and made available with automated installations. You can expect to see Veeam and other third-party solutions added soon.

12. Click the **Summary** tab.
13. Click the **Actions** pull-down menu.

Notice, from here, clients can integrate the VDC into IBM Cloud monitoring, delete the instance, and refresh the status of the instance summary page.  

14. Click **Refresh**
15. Click the **VMware console** button.

A new browser window or tab opens with the VMware vCloud Director (vCD) web console for the VDC. By default, vCD is integrated with IBM Cloud Identity and Access Management (IAM) system. You can learn more about VDC single sign-on with IBM Cloud IAM <a href="https://cloud.ibm.com/docs/vmware-service?topic=vmware-service-iam-integration&interface=ui" target="_blank">here</a>.

16. Click **SIGN IN WITH SINGLE SIGN-ON**.

In the next chapter, learn more about deploying workloads to a VDC.
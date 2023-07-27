One of the many reasons clients consider VMware as a Service (VMwaaS) on IBM Cloud is for the ease of rapidly deploying virtual machines (VMs) to run their business workloads. In this chapter, step-by-step instructions are provided on how to use VMware Cloud Director (vCD) to create and access VMs running in the VMwaaS virtual data centers (VDCs). 

Thus far, the experience provided in this learning plan has been through videos and click-thru demonstrations. A hands-on environment of the **VMwaaS** instance built during the earlier modules is available through an IBM Technology Zone (ITZ) environment that you can reserve <a href="https://techzone.ibm.com/collection/ibm-cloud-for-vmware-level-3/journey-complete-learning-activity-for-ibm-cloud-for-vmware-level-3-sales-enablement" target="_blank">here</a>.

!!! warning "LIMITED ACCESS"
    The user access provided to the instance in ITZ is restricted utilizing IBM Cloud's Identity and Access Management controls. Users will have the ability to view the VMware Shared instances already provisioned in the account via the IBM Cloud Portal and the ability to deploy a VM and/or vApp using VMware vCloud Director. Users will NOT have the ability to provision or modify VMwaaS instances, sites, or virtual data centers. However, even with these restrictions, the environment can be used in performing demonstrations using a "baking-show" demonstration approach as an alternative to using the click-thru demos. To learn more about the "baking-show" method, check out this <a href="https://cruxcollaborative.com/insights/your-software-demo-should-be-more-like-a-cooking-show" target="_blank">article</a>.

    Note: other ITZ environments are available for IBM Cloud for VMware Solutions that may provide additional access.  Use "VMware on IBM Cloud" in the ITZ search tool.

??? info "See all the VMware Shared specific IAM access provided in the ITZ environment"

    ![](_attachments/VMwaaSIAMGroup.png)

#
# Step-by-step Instructions
----------------------

##
## Create a reservation for the demonstration environment in ITZ

1. Open a web browser to the **IBM Cloud for VMware Solutions - Level 3** environment reservation page.

<a href="https://techzone.ibm.com/my/reservations/create/638a1f6a308f5500188808a7" target="_blank">Create a reservation</a>.

2. Click the **Reserve now** radio button.
3. Click the **Practice / Self Education** tile.
4. Enter **Level 3 training** in the **Purpose description** field.
5. Click the **Preferred Geography** pull-down and select **AMERICAS - us-south region -dal10 datacenter**.

The **End date and time** should be set for 3 days. You can shorten that direction here. After the reservation is ready, you can also extend the reservation up to a maximum of 6 days.

6. Click the **I agree to IBM Technology Zone's T&Cs** checkbox.
7. Click **Submit**.

It takes approximately 20 minutes for the reservation to be processed. You can monitor the progress of the reservation <a href="https://techzone.ibm.com/my/reservations" target="_blank">here</a>.

When the status of the reservation is **Ready**, continue to the next steps.

1. Open a web browser to the **IBM Cloud Portal**.

<a href="cloud.ibm.com" target="_blank">Create a reservation</a>.

When the page loads, authenticate using your IBM Cloud ID and password.  The authentication process will vary depending on the primary account your ID is associated with and any multi-factor authentication or other security controls in place for the account.


##
## Create, modify, access, and delete a VM

XXxXXXXXXXXXX

You should now feel comfortable creating, modifying, and deleting VMs using vCD. At this time, feel free to explore the other capabilities exposed through vCD. Keep in mind, the access permissions your IBM Cloud ID has is limited. For example, recall in the network setup demonstration a new Data Center Group and Network was created. If you go to those screen in vCD you will notice the **NEW** option is not available to you.  This is because your IAM access controls in this account do not include the **VMwaaS Director Network Admin** access. This limitation was put in place to allow many users to share the environment and limit exposure of resources to attacks from the Internet.

In the final chapter of this section of the IBM Cloud for VMware Services Level 3 course see how everything you learned here can be used to deliver an effective client demonstration using the ITZ environment for VMwaaS.
One of the many reasons clients consider VMware as a Service (VMwaaS) on IBM Cloud is for the ease of rapidly deploying virtual machines (VMs) to run their business workloads. In this chapter, step-by-step instructions are provided on how to use VMware Cloud Director (vCD) to create and access VMs running in the VMwaaS virtual data centers (VDCs). 

Thus far, the experience provided in this learning plan has been through videos and click-thru demonstrations. As an optional exercise, a hands-on environment of the **VMwaaS** instance built during the earlier modules is available through an IBM Technology Zone (ITZ) environment that you can reserve <a href="https://techzone.ibm.com/collection/ibm-cloud-for-vmware-level-3/journey-complete-learning-activity-for-ibm-cloud-for-vmware-level-3-sales-enablement" target="_blank">here</a>.

!!! warning "LIMITED ACCESS"
    The user access provided to the instance in ITZ is restricted utilizing IBM Cloud's Identity and Access Management controls. Users will have the ability to view the VMware Shared instances already provisioned in the account via the IBM Cloud Portal and the ability to deploy a VM and/or vApp using VMware vCloud Director. Users will NOT have the ability to provision or modify VMwaaS instances, sites, or virtual data centers. However, even with these restrictions, the environment can be used in performing demonstrations using a "baking-show" demonstration approach as an alternative to using the click-thru demos. To learn more about the "baking-show" method, check out this <a href="https://cruxcollaborative.com/insights/your-software-demo-should-be-more-like-a-cooking-show" target="_blank">article</a>.

    Note: other ITZ environments are available for IBM Cloud for VMware Solutions that may provide additional access.  Use "VMware on IBM Cloud" in the ITZ search tool.

??? info "See all the VMware Shared specific IAM access provided in the ITZ environment"

    ![](_attachments/VMwaaSIAMGroup.png)

#
# Step-by-step Instructions
----------------------

##
## Create, modify, access, and delete a VM

XXxXXXXXXXXXX

You should now feel comfortable creating, modifying, and deleting VMs using vCD. At this time, feel free to explore the other capabilities exposed through vCD. Keep in mind, the access permissions your IBM Cloud ID has is limited. For example, recall in the network setup demonstration a new Data Center Group and Network was created. If you go to those screen in vCD you will notice the **NEW** option is not available to you.  This is because your IAM access controls in this account do not include the **VMwaaS Director Network Admin** access. This limitation was put in place to allow many users to share the environment and limit exposure of resources to attacks from the Internet.

In the final chapter of this section of the IBM Cloud for VMware Services Level 3 course see how everything you learned here can be used to deliver an effective client demonstration using the ITZ environment for VMwaaS.
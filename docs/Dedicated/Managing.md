Now it is time to manage the VMware vCenter Server (VCS) instance. Use the click-thru demonstration below to practice managing a VCS instance.

!!! tip
    Not sure where to click or what to do next? Simply click anywhere on the screen and the spot to click next will be highlighted.

1. Open the link below and then click the play button ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

**Click-thru demo:** <a href="https://ibm.github.io/SalesEnablement-VMware-L3/includes/VMware-Dedicated-Managing/index.html" target ="_blank">Manage an instance of IBM Cloud VMware Solutions **Dedicated**</a>

2. Click the **VMware** ![](_attachments/VMicon.png) icon in the left hand menu bar.
3. Click the **Resources** option in left hand menu.
4. Click the **vCenter Server** option under **Resources** in left hand menu.
5. Click the **{{itz.dedicated.instanceName}}** entry in the list of VCS instances.
6. Click the **Actions** pulldown menu at top right.
7. Click the **Delete instance** option.

Read the information provided regarding deleting a VCS instance.

8. Click the **Cancel** button.
9. Click the **Infrastructure** option in left hand menu.
10. Click the **{{itz.dedicated.clusterName}}** entry in the list of clusters.

Recall from the provisioning click-thru demonstration that a three node converged cluster was created. From this page hosts can be added and removed from the cluster.

11. Click the **Add** button to add a host.

Notice the options for adding a host to the existing cluster.

In addition to specifying the number of hosts to add, the bare metal server configuration can be specified. As a best practice, all hosts in a cluster should be homogeneous, that is, they should all have the same bare metal configuration. Thus, the default is to utilize the same configuration as the existing hosts. In some circumstances, it may be necessary to provision hosts of a different flavor. These could include the need to have hosts with more memory or performance, the need to move off of configurations going out of support, etc. In these circumstances, the best practice is to provision all the new hosts, and then de-provision the old hosts allowing VMware to automatically move workloads from the old to the new hosts.

12. Click the **{{itz.dedicated.clusterName}}** link at the top of the page.
13. Click the **Add** button for **Storage**.

Notice additional storage shares can be added to the cluster. Shares can be added using any of the performance settings: 0.25, 2, 4, or 10 input/output operations per second per gigabyte (IOPS/GB).

14. Click the **{{itz.dedicated.clusterName}}** link at the top of the page.
15. Click the **View resource** link next to **Private VLAN** in the **Network interface** section.

Take a minute to review the details of the **Private VLAN** that was created when the cluster was created.

16. Click anywhere on the screen to return to the cluster overview page.
17. Click the **Infrastructure** option in left hand menu.
18. Click the **Add** button.

Recall, when originally provisioned, this VCS instance was created with a single consolidate cluster for both the VMware management, workloads, and edge services. From this page, new workload and edge services clusters can be added to the existing VCS instance. The information required and steps to complete the configuration of the additional workloads are very similar to when the original cluster was provisioned.

Notice, new workload clusters can be provisioned in different IBM Cloud data centers with different bare metal server configurations. This flexibility allows client scenarios like:

  - production workloads run on **high performance** clusters and test workloads run on lower cost, lower performance clusters

  - highly available (HA) workloads across geographic regions

  - disaster recovery (DR)

19. Click the **Edge services cluster** radio button.

??? question "BP quiz question"
    Take note of CPU model options for **Edge services clusters**.

20. Click the **{{itz.dedicated.instanceName}} (primary)** link at the top of the page.
21. Click the **Services** option in the left hand menu.
22. Click the **Veeam** link in the table of **Services**.

Notice the details provided for the **Veeam** service. Instructions and the necessary IDs and passwords are provided for accessing the **Veeam** instances that were automatically deployed with the VCS instance. Note, one of the first steps that clients will want to perform is to configure Veeam to backup deployed VMs.

23. Click anywhere on the screen to continue.
24. Click the **Add** button.

Notice that all the services that were not initially deployed at provisioning are still available to be deployed using automation. Review the services again in the next steps.

25. Click the **Business continuity and migration** title to hide the tile.
26. Click the **Security and compliance** title to hide the tile.
27. Click the **Transformation and modernization of VMware applications** title to hide the tile.
28. Click the **Management tools** title to hide the tile.
29. Click the **{{itz.dedicated.instanceName}} (primary)** link at the top of the page.
30. Click the **Licensing** option in the left hand menu.

{{offering.name}} offers multiple options for VMware NSX licensing. Notice the different capabilities of each licensing option. Clients can change the license for NSX.

31. Click the **Change license** button.
32. Click the **Choose edition** pull-down menu.
33. Click the **Cancel** button.
34. Click the **Deployment history** option in the left hand menu.

This screen image was created shortly after the provisioning completed for the instance. Notice only 10 of the 37 entries are displayed. For a complete list, expand the section below.

??? "Full listing of events in chronological order"
    11/14/22 10:50	Start creating instance user and required services

    11/14/22 10:51	Ordering additional private VLAN

    11/14/22 10:51	Ordering license of vCenter Server

    11/14/22 10:51	Ordering vCenter Server upcharges

    11/14/22 10:51	Ordering 1 NFS Storage(s) for cluster vcs-dv-consolidated

    11/14/22 10:51	Start ordering management share

    11/14/22 10:51	Ordering 2 socket NSX license or licenses of vCenter Server

    11/14/22 10:51	Creating instance user and required services completed

    11/14/22 10:52	Start ordering 3 bare metal ESXi servers

    11/14/22 10:52	Verifying bare metal ESXi servers order

    11/14/22 10:52	Start ordering Windows VSI for Active Directory/DNS

    11/14/22 10:52	Start ordering subnets

    11/14/22 10:52	Additional private VLAN is provisioned

    11/14/22 10:53	Granting access to NFS storages to new subnet

    11/14/22 10:53	Subnet is ready

    11/14/22 11:20	Windows VSI for Active Directory/DNS is ready

    11/14/22 14:41	Bare metal ESXi server(s) with Private IP address(es) 10.87.32.138, 10.87.32.161, 10.87.32.175 are ready for cluster

    11/14/22 14:42	Start ordering IBM CloudBuilder VSI

    11/14/22 15:05	IBM CloudBuilder VSI is ready

    11/14/22 15:09	Successfully trunked the additional private VLAN to bare metal servers

    11/14/22 15:17	IBM CloudBuilder is ready for service

    11/14/22 16:48	Start vCenter Server installation and configuration

    11/14/22 17:06	vCenter Server installation and configuration completed

    11/14/22 19:07	Start management services setup

    11/14/22 19:12	IBM operational services are running

    11/14/22 19:13	Ordering new VSI for Clouddriver

    11/14/22 19:13	Preparing Clouddriver

    11/14/22 19:26	Clouddriver VSI (10.87.32.142) is provisioned

    11/14/22 19:42	Dismissing IBM CloudBuilder VSI

    11/14/22 19:54	Start ordering service infrastructure

    11/14/22 19:55	Service infrastructure Veeam endurance iSCSI storage is ready

    11/14/22 19:56	Start requesting service creation to IBM CloudDriver

    11/14/22 19:56	Start obtaining service infrastructure

    11/14/22 21:52	Service Veeam has been installed successfully.

    11/14/22 21:55	Release Clouddriver (10.87.32.142)

    11/14/22 21:56	vCenter Server instance is ready to use

    11/14/22 23:55	Cancel Clouddriver VSI (10.87.32.142)


35. Click the **Summary** option in the left hand menu.

Notice the information provided for the various VMware management components. The user ID and passwords to the components are made available to the client's administrators as VCS is NOT a fully managed service. The client is responsible for managing the VMware components like VCS, NSX, etc. Learn more about customer responsibilities <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-vc_compl_info" target="_blank">here</a>.

36. Click the **vCenter console** link at the top of the page.

Note, in order to access the vCenter console a VPN connection to the IBM Cloud private network must first be provisioned. At a high level these are:

- Create a VPN password from your IBM Cloud user details page.
- Log in to the data center VPN portal using your VPN credentials.
- Copy the IP address and the host name of the vCenter Server and paste it into the hosts file (/etc/hosts) on your local computer

More information about this process can be found <a href="https://www.ibm.com/cloud/vpn-access" target="_blank">here</a>.


37. Click the **LOGIN** button.

At this point, those familiar with VMware vCenter should feel right at home with the vCenter environment. As stated earlier, this demonstration guide is focused on the **IBM Cloud** aspects of the {{offering.name}} offering and not VMware components deployed as part of the offering. In the final steps, review a few of the vCenter pages that align with the configuration parameters specified when the VCS instance was deployed.

On the **Summary** page, notice this vCenter instances is managing 1 cluster that currently has 3 hosts and 12 virtual machines. Recall from the provisioning we created 1 consolidated cluster with 3 hosts.

38. Click the **Hosts & Clusters** tab.
39. Click the **Datastores** tab.

Recall when this VCS instance was created, only 1 data store was added. However, as part of the base deployment several others were created as well for the management components.

40. Click the **VMs** tab.

All the VMs that are currently deployed are associated with the VMware management components, edge services, and Veeam. At this point, clients could begin to deploy their own workloads.

That concludes the **managing** portion of the demonstration.

There are several aspects of managing a VMware as a Service (VMwaaS) multitenant instance on IBM Cloud. At a high level, these are the management of the "on IBM Cloud" aspects of a VMwaaS instance and managing the virtual data center (VDC) with VMware vCloud Director (vCloud Director). 

Using the IBM Cloud portal to manage aspects of the **Virtual Data Center (VDC)** is straight forward and includes tasks like:

- adding, removing, and setting limits for compute resources
  
- adding and removing other services

- adding and removing VDCs

Managing the VDC is done with the VMware vCloud Director web console, which is accessible through the IBM Cloud portal. These tasks are covered in the [**Using VMwaaS** chapter](../../Using/UsingIntro.md). This aspect of management includes common VMware administrative tasks like:

- adding and deleting networks, firewalls, VPNs, and network address translation (NAT) rules
  
- adding and deleting virtual machines (VMs), virtual applications (vApps), and affinity rules

- managing storage policies and named disks

- and other virtual data center capabilities that are exposed through the vCloud Director web console

Both of these domains are explored in this demonstration guide. When demonstrating to clients, sellers are encouraged to focus on the "on the IBM Cloud" aspects of the solution.

!!! Important "Read before continuing!"

    As mentioned earlier, your user ID in the IBM Technology Zone (ITZ) environment will not have sufficient permission to perform many of the activities described. Click-thru demonstrations are provided to walk through tasks that provision additional resources. When performing client demonstrations, sellers can utilize these click-thru demonstrations or a _baking show_ approach of demonstrating these tasks can be used. This is done by following the same steps described in the click-thru demo using the ITZ environment to walk through the provisioning steps in the IBM Cloud Portal up to the point of clicking **Create**. Instead of clicking **Create**, explain what would happen and then switch to the already created instance of the resource. The video found in **The client demonstration** chapter illustrates this approach.


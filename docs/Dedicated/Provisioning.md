Now it is time to provision a VMware vCenter Server (VCS) instance. Use the click-thru demonstration below to practice provisioning a VCS instance.

Note, fields that require a text entry (e.g. service name) are pre-populated in the click-thru demonstration.

!!! tip
    Not sure where to click or what to do next? Simply click anywhere on the screen and the spot to click next will be highlighted.

1. Open the link below and then click the play button ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

**Click-thru demo:** <a href="https://ibm.github.io/SalesEnablement-VMware-L3/includes/VMware-Dedicated-Provisioning/index.html" target ="_blank">Provision an instance of IBM Cloud VMware Solutions **Dedicated**</a>

2. Click the **VMware** ![](_attachments/VMicon.png) icon in the left hand menu bar.
3. Click the **VMware vCenter Server** tile.

??? question "BP quiz question"
    Take note of the VMware vSphere version.

4. Click in the **Instance name** text entry field.

The Instance name field will automatically change to {{itz.dedicated.instanceName}}. The IBM Cloud portal provides the ability to provision a new instance based on a previously saved template.

5. Click the **Resource Group** pull-down menu.
6. Select the **{{itz.resourceGroup}}** option.

VCS supports multisite vCenter Server instances. In this demonstration, only a primary instance is provisioned. Learn more about multisite vCenter instances <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-vc_multisite" target="_blank">here</a>.

7. Click **Licensing** in the left hand menu.

Learn more about the licensing options <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-vc_orderinginstance-licensing-settings" target="_blank">here</a>.

??? question "BP quiz question"
    Take note of the 4 NSX license options.

8. Under the **NSX** section, click the pull-down menu that currently shows **Data Center SP Professional**.
9. Select the **Data Center SP Advanced** option.

In this deployment, a single **Consolidated** cluster will be used. **Consolidated** clusters are used for both the management components of the VCS deployment as well as client workloads. This is typically fine for small deployments, and will potentially save the client some money. However, for larger deployments with varying performance requirements for workloads, separating the management cluster from other workload clusters is the preferred architecture. Refer to the documentation for more details on management and workload clusters <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-scb-orderinginstance-consoli" target="_blank">here</a>.

Later the other options for to provision dedicated **Workload** and **Edge services** clusters will be explored, but for this environment a single **Consolidated** cluster is used.

10. Under **Data center location**, click the **Geography** pull-down menu that currently shows **NA South**.

Notice, VCS instances can be deployed in many of the IBM Cloud data centers located around the world. Typically, data centers are selected based upon geographic location either for data sovereignty and/or proximity reasons. However, it is also important to note that not all the IBM Cloud data centers have the same capabilities. Consult the **IBM Cloud data center availability** section of the documentation <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-vc_planning" target="_blank">here</a>.

11. Select the **NA West** option.
12. Select the **SJC04** data center option.

Next, a hardware configuration for the bare-metal servers needs to be specified. VCS can be provisioned on many different hardware configurations, including SAP certified hardware.

13. Click the **Dual Intel Xeon Silver 4210** radio button in the **CPU model** table.
14. Click the **RAM** pull-down menu that currently shows **768 GB**.
15. Select the **128 GB** option.
16. Click the **Include a separate, additional workload cluster** checkbox.

Notice the form expands to allow a new hardware configuration to be specified for a separate **Workload** cluster just like for the **Consolidated** cluster. If a client desires to separate their workload cluster from the management cluster, this option should be selected. Often clients will opt for multiple workload cluster based upon the CPU, memory, and storage requirements of the workloads.

17. Click the **Include a separate, additional workload cluster.** checkbox again to **disable** the separate **Workload cluster**.
18. Click the **Edge services cluster** checkbox.

A dedicated **Edge services** cluster is often desirable for large deployments that require additional separation of the edge services and custom firewall components. Notice the hardware options for the **Edge services** cluster are fewer than for the **Consolidate** and **Workload** clusters.

19. Click the **Edge services cluster** checkbox again to **disable** the separate **Edge services cluster**.
20. Click the **Domain name** text entry field under the **Network interface** section.

Network planning for any VCS deployment is critical. Clients are expected to make informed decisions when provisioning their VCS environment and when specifying network configuration options. More planning information is available in the VCS documentation starting <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-vc_networkingonvcenterserver" target="_blank">here</a>.

A valid **Domain name** needs to be specified for the VCS deployment. The Domain name field will automatically change to **myroot.mydomain.com** for this environment. Notice how both the **Hostname prefix** and **Domain name** fields are used to specify the complete hostnames for the bare-metal servers. The **Configure host names individually** checkbox can be used for clients that desire to specify hostnames individually.

21. Click the **Add-on services** option in left hand menu.

When ordering a VCS instances, clients can also include add-on services.

22. Click the **Edit** link in the **Veeam 11** tile under **Recommended services**.

Veeam on IBM Cloud seamlessly integrates directly with your VMware hypervisors to help your enterprise achieve high availability. This service provides recovery points and time objectives for your applications and data. The recovery points and time objectives can be provided in less than 15 minutes after configuration is completed. By using this service, you control both the backup and restore of all virtual machines (VMs) for your infrastructure directly from the Veeam console. Veeam on IBM Cloud is a non-IBM product that is offered under terms and conditions from Veeam, not IBM

23. Click the **Name** text entry field in the **Configure Veeam** dialog.

The **Name** field will automatically change to **veeam-l3**.

In the next steps, specify the size and performance of the storage to be used by Veeam. More information on Veeam capacity planning can be found <a href="https://helpcenter.veeam.com/archive/one/100/reporter/capacity_planning_for_repositories.html" target="_blank">here</a>.

24. Click the **Storage size** pull-down menu that currently shows **4000 GB**.
25. Select the **2000 GB** option.
26. Click the **Storage performance** pull-down menu that currently shows **0.25 IOPS/GB**.
27. Select the **0.25 IOPS/GB** option.
28. Click **Save**.
29. Click the **Edit** link in the **Caveonix RiskForesight 4.0.0** add-on services tile.

The Caveonix RiskForesight™ service can help to manage cyber risk and compliance risk with proactive monitoring and automated defense controls to protect against threats and to meet industry or government regulations. Learn more about Caveonix <a href="" target="_blank">here</a>.

30. Click **Cancel**.
31. Click the toggle switch in the **Caveonix RiskForesight 4.0.0** add-on services tile to disable Caveonix.
32. Click the **Business continuity and migration** pull-down menu.

The VMware HCX service extends the networks of on-premises data centers into IBM Cloud, and it helps migrate virtual machines (VMs) to and from IBM Cloud without any conversion or change. HCX creates an abstraction layer that enables application mobility and infrastructure hybridity through securely stretched networks. Clients can modernize their VMware environment without the need to refactor or modify existing applications, as HCX enables a seamless transformation. With HCX, clients can bring their IP subnet ranges into IBM Cloud while ensuring the IP consistency through a hybrid deployment and by providing high-level security with end-to-end Suite B encryptions. Learn more about HCX <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-hcx_considerations" target="_blank">here</a>.

The Zerto service integrates replication and disaster recovery capabilities into the deployment offerings to protect and recover data in VMware virtual environments on IBM Cloud. Learn more about Zerto <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-addingzertodr" target="_blank">here</a>.

33. Click the **Business continuity and migration** pull-down menu again.
34. Click the **Security and compliance** pull-down menu.

The Entrust CloudControl service (formerly known as HyTrust CloudControl) enforces and controls compliance against security standards, which includes role-based access control (RBAC), approval, and auditing. Learn more about Entrust CloudControl <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-entrust-cc_considerations" target="_blank">here</a>.

The F5 BIG-IP service (F5 BIG-IP Virtual Edition) provides intelligent layer 4 thru layer 7 load balancing and traffic management services at a local and global scale, provides robust network and web application firewall protection, and secure and federated application access. Learn more about F5 BIG-IP <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-f5_considerations" target="_blank">here</a>.

The FortiGate Virtual Appliance service deploys a pair of FortiGate Virtual Appliances to a VCS environment, which can help reduce risk by implementing critical security controls within virtual infrastructure. Learn more about FortiGate Virtual Appliance <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-fortinetvm_considerations" target="_blank">here</a>.

Juniper vSRX is a virtual security appliance that provides security and networking services at the perimeter or edge in virtualized private or public cloud environments. Within a VMware infrastructure, vSRX runs as a pair of virtual machines (VMs) within the VMware vSphere environment. Learn more about Juniper vSRX <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-juniper-overview" target="_blank">here</a>.

35. Click the **Security and compliance** pull-down menu again.
36. Click the **Transformation and modernization of VMware applications** pull-down menu.

The Red Hat OpenShift for VMware service deploys a Red Hat OpenShift cluster by using an automated deployment of the VMware SDDC (Software Defined Data Center) architecture. The Red Hat OpenShift components are deployed as virtual machines (VMs) or appliances by using VMware NSX software-defined networking. Learn more about Red Hat OpenShift for VMware <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-ocp_overview" target="_blank">here</a>.

37. Click the **Transformation and modernization of VMware applications** pull-down menu again.
38. Click the **Management tools** pull-down menu.

The vRealize Operations and vRealize Log Insight services deploy the VMware vRealize Operations (vROps) and VMware vRealize Log Insight (vRLI) tools. These tools help clients operate and monitor the performance, health, and capacity of their IBM-hosted, dedicated VMware environment. The service also includes vRLI to help troubleshoot issues by using log files more quickly. Learn more about VMware vRealize Operations and Log Insight <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-vrops_overview" target="_blank">here</a>.

39. Click the **Management tools** pull-down menu again.
40. Click the **I understand that the account listed below will be charged for infrastructure** checkbox.
41. Click the **I have read and agreed to the third-party service agreements listed below** checkbox.
42. Click **Create**.

Notice the messages being displayed. The status of the provisioning process can be observed.

43. Click **Resources** in left hand menu.
44. Click **vCenter Server** under **Resources** in the left hand menu.
45. Click the **{{itz.dedicated.instanceName}}** in the table.

Notice the **Creating** status at the top of the screen by the instance name.

46. Click the **Infrastructure** option in the left hand menu.

Notice the single, consolidated cluster requested earlier listed in the table and the status is **Initializing**.

47. Click the **Deployment history** option in the left hand menu.

Notice the steps and timestamps as the VCS instances is being provisioned.
Now, fast forward 11 hours.

48. Click anywhere on the screen.

Notice 11 hours have elapsed and the VCS instance is now ready to use.

Proceed to the next module of this demonstration script to learn how to manage a VCS instance.

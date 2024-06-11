
The IBM Power servers used by {{offering.name}} are located in IBM data centers, distinct from the IBM Cloud servers with separate networks and direct-attached storage. These environments operate in their own environment and the internal networks are fenced; however, they still offer connectivity options to meet customer requirements, including public internet. This carefully calibrated infrastructure enables Power Virtual Server (PowerVS) to maintain key enterprise software certification and support that customers would receive with on-premises infrastructure, but with the added flexibility and capabilities that come from an IBM Cloud deployment.

The IBM Power Systems Virtual Server **workspace** (formerly known as a **service**), allows users to quickly create and deploy one or more virtual server instances (that are running either the AIX, IBM i, or Linux operating systems). After provisioning a PowerVS virtual server instance (VSI or may also be referred to as a virtual machine (VM)), users get access to VSI without the need to manage or operate the physical servers. However, users must manage the operating system, software applications, and data. Given that this course is primarily a demonstration of infrastructure as a service, the guide does not delve deeply into the application layer or the day to day administrative tasks. The guide will explore the fundamentals of working with PowerVS VSIs.

Before creating a PowerVS virtual server, understand the difference in terminology between a PowerVS **workspace** and a PowerVS **instance**. Think of the PowerVS **workspace** as a container for all PowerVS instances at a specific geographic region. PowerVS **instances** are virtual machines (VMs). The service is available from the Resource List in the IBM Cloud Portal. For example, a Cloud account can have multiple PowerVS workspaces: one in Dallas, Texas, and another in Washington, D.C. Each service can contain multiple VSIs (aka VMs). A workspace must be associated with an IBM Cloud resource group which helps in grouping resources and assigning permissions. To learn more, refer to <a href="https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-getting-started" target="_blank">Getting Started with IBM Power Virtual Server</a>.

The key parameters for a PowerVS service are:

- **Datacenter location**: As of June 2024, PowerVS is co-located with 21 IBM Cloud datacenters located around the world. When selecting a datacenter, consider choosing the datacenter located nearest the majority of the end users that will be accessing the workloads running in PowerVS.

- **Workspace name**: The PowerVS workspace name will appear in the IBM Cloud Portal under the provisioned workspace. Specify a name that is easily understood and recognized.

- **Resource group**: Resource groups are used to organize resources in an IBM Cloud account. Administrative and access rights for all PowerVS resources are associated with the PowerVS workspace and not individual PowerVS instances (VMs). Once a PowerVS workspace is assigned to a resource group, the resource group cannot be changed.

- **Integrations**: Optional integrations are also available from IBM Cloud. As of June 2024, the only integration available is with IBM Cloud Monitoring. IBM Cloud Monitoring allows users to gain visibility into the resources (VSIs) in the workspace.

In the chapter to follow, view a video of a PowerVS server being provisioned and replicate the steps taken using a click-through guided demonstration.

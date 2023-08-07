IBM Cloud for VMware as a Service (VMwaaS) provides the VMware Cloud Director platform as a managed service. IBM does the configuration, hosting, operations, and lifecycle management of the VMware software so clients can quickly deploy their VMware-based cloud computing environments with simplified management and reduced costs.

The architecture diagram illustrates both the separation of IBM Cloud clients (referred to as *Customer* in the diagram) and of the management responsibilities between IBM and clients.

![](_attachments/vmware-aas-archi.svg)

!!! Important "Please read!"

    All sellers, especially technical sellers, should read the VMwaaS overview documentation found <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-vmware-aas-overview" target="_blank">here</a>. Additionally, while most of the underlying VMware products that are utilized in the offering are hidden from the end client, some clients may ask about the versions utilized. This information is available in the VMware as a Service release notes found <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-vmware-service-relnotes" target="_blank">here</a>.
Today, compute resources are available as single-tenant, dedicated hosts on IBM Cloud bare metal servers, with multiple host configurations available to address various workload requirements. Both Network File Storage (NFS) and VMware vSAN storage options are available, along with an ecosystem of enterprise-grade add-on services for backup, migration, and disaster recovery.

As mentioned earlier, VMwaaS utilizes a shared responsibility model that includes IBM-managed infrastructure and IBM managed VMware components and services up to the hypervisor. For details on the client responsibilities when using VMWaaS go <a href="https://cloud.ibm.com/docs/vmwaresolutions?topic=vmwaresolutions-vmaas-understand-responsib" target="_blank">here</a>. The division of responsibility should be explained to clients.

#
# Next Steps

In the following modules, you will:

- Explore the process of provisioning a **VMwaaS** instance with the IBM Cloud portal.

- Learn how to manage a **VMwaaS** instance using both the IBM Cloud portal and VMware Cloud Director (vCloud Director).
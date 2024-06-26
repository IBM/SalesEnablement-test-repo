A shared processor Pool (SPP) is a pool of processor capacity that is shared between a group of virtual server instances. Unlike a virtual server instance that has a dedicated and defined maximum amount of processing capacity, you can set the reserved cores in SPP that is available at the pool level. SPPs are mainly used to control software licensing costs by limiting the number of processors an uncapped VSI can use.

Learn more about SPPs <a href="https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-manage-SPP" target="_blank">here</a>.

1. Click the **Shared processor pools** option in the side menu under the {{powerVS.serviceInstanceName}} workspace.

![](_attachments/SPPMenu.png)


2. Click **Create pool +**

![](_attachments/SPPtable.png)

3. Enter a name in the **Name** field and then click **Continue**.

![](_attachments/SPPProvision1.png)

!!! Warning "Remember you will not be able to provision a new SPP*

4. Select a **machine type**.
5. Specify the number of **reserved cores** and click **Finish**.

![](_attachments/SPPProvision2.png)

Once all these properties are specified, you would accept the terms and conditions and provision the SPP. Once provisioned, clients could specify the SPP when provisioning new VSIs.

6. Click **Cancel**.

![](_attachments/SPPProvision3.png)

7. Click the **Pool placement groups** tab.

![](_attachments/SPPtablePPGtab.png)

Pool placement groups are a set of shared processor pools with a single colocation policy which determines the host in which a shared processor pool in the group is deployed in relation to others in the group.

Learn more about pool placement groups <a href="https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-manage-SPP#configure-SPP-PG" target="_blank">here</a>.

8. Click **Create group +**.

![](_attachments/SPP-PPG.png)

To create a pool placement group, simply specify a group name and the colocation policy of either **same server** or **different server**.

![](_attachments/SPP-PPG-1.png)

The **same server** option specifies that all VSIs in this placement group will be placed on the same server. This is known as an **affinity** policy.

The **different server** option specifies that all VSIs in this placement group will be placed on different servers. This is also known as an **anti-affinity** policy.

9. Click **Cancel**

Affinity and anti-affinity policies are mainly used to assist in building high availability (HA) and disaster recovery (DR) deployments.

Learn more about High Availability (HA) and Disaster Recovery (DR) options in PowerVS <a href="https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-ha-dr" target="_blank">here</a>.
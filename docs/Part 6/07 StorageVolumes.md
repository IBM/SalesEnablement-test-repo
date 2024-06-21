As mentioned earlier IBM Power Virtual Server (PowerVS) supports multiple tiers of storage. Learn more about the available storage tiers <a href="https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-about-power-iaas#storage-tiers-spec-private-cloud" target="_blank">here</a>. Every PowerVS virtual server instance consists of a boot volume and optionally additional storage volumes. While IBM manages the underlying physical storage, it is the client's responsibility to manage and protect the data on instances.

1. Click the **Storage volumes** option in the side menu under the {{powerVS.serviceInstanceName}} workspace.

![](_attachments/StorageVolumesMenu.png)

2. Click **Create volume +**.

![](_attachments/StorageVolumeTable.png)

To create a new storage volume, a few parameters must be specified. The first 4 parameters are the name of the volume, the storage tier, the number of volumes to create, and the size.

![](_attachments/StorageVolumeCreate-1.png)

a. Each storage volume in a workspace must have a unique name.

b. A tier of storage must be specified. This can change later. The storage tier represents the performance characteristics of the volume and directly relates to the cost of the volume. See the earlier link for more information on the 4 storage tiers supported by PowerVS.

c. It is possible to create up to 10 storage volumes at a time. Each of these volumes will have the same attributes as far as tier, size, shareability, storage pool, and affinity rules.

d. The size of a volume can range from 1 Gigabyte (GB) upt to 238,705 GB. Storage volumes can be increased after they are provisioned but NOT decreased.

The second set of parameters that need to be specified when creating a storage volume relate to the volumes shareability, storage pool, and affinity rules.

![](_attachments/StorageVolumeCreate-2.png)

e. Storage volumes can be marked as **shareable**. This attribute allows a single volume to be shared between multiple PowerVS virtual server instances. This is typically used when developing highly available (HA) deployments, for instance when using PowerHA's system mirroring capabilities. Learn more about HA and Diaster Recovery (DR) in PowerVS <a href="https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-ha-dr" tareget="_blank">here</a>.

f. A storage volume must be assigned to a storage pool. By default, the volume is assigned to any pool that has sufficient capacity. However, if the volume needs to be controlled by affinity rules, it can either be assigned to an affinity pool or an anti-affinity pool. Affinity can be based upon either other storage volumes or upon virtual server instances (VSIs), also known as virtual machines (VMs). If a storage volume is marked with an affinity policy, it will be created in the same pool as other other volumes with which it needs to have affinity. This is typically used for cloning and snapshots.If a storage volume is marked with an anti-affinity policy, it will be created in a different pool from other volumes with which it needs anti-affinity. This is typically used for HA and logical mirroring of volumes.

g. As mentioned above, the affinity/anti-affinity object can be either another storage volume or a VM/VSI.

f. Depending on the affinity/anti-affinity object selection (g), the pull down menu will be populated with the existing volumes or VMs/VSIs that the policy should be applied with or against.

3. Click **Cancel**.

![](_attachments/StorageVolumeCreate-3.png)

Learn more about affinity and anti-affinity policies <a href="https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-powervs-faqs#affinity">here</a>.

4. Click **Edit** under the ![](_attachments/ellipses.png) for one of the existing storage volumes.

![](_attachments/StorageVolumeEditMenu.png)

As mentioned earlier, it is possible to modify some of the attributes of a storage volume.

![](_attachments/StorageVolumeEdit-1.png)

a. The name of the volume can be modified after it has been provisioned. Just remember, the name must be unique within the PowerVS workspace.

b. The tier can be modified. One caveat is that if volume is currently set to Fixed IOPs or is being changed to the Fixe IOPs tier, the size of the volume can not be changed at the same time.

c. The size of the volume can be increased from its current size up to the maximum of 238,705 GB. The size of the volume cannot be decreased.

d. Non-bootable volumes can be toggled between shared and unshared.

e. A volume can be marked as bootable. Bootable volumes can not be shared. It is possible for a single VSI to have multiple bootable volumes. PowerVS will randomly select a bootable volume as the instance's boot volume if the original is no longer bootable. Virtual server instances must have at least one bootable volume.

5. Click **Cancel**.

![](_attachments/StorageVolumeEdit-3.png)

Storage volumes that are not actively in use by VSI can also be deleted from the edit menu.

Learn more about managing storage volumes <a href="https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-modifying-instance#modifying-volume-network" target="_blank">here</a>.
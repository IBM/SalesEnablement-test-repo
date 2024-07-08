The **dedicated host** capability on IBM Power Virtual Server (PowerVS) offers clients the ability to provision an entire Power server for their exclusive use. Clients can handle mission-critical workloads with complete isolation, control, and security.

The hourly billing for a Dedicated host on PowerVS covers the entire server. Using a dedicated host provides extra flexibility to create virtual server instances and control their placement, along with a unique shared processor pool capability. This means clients can optimize their cloud infrastructure by using single-tenant servers to manage software licensing costs. Most importantly, dedicated hosts increase isolation from other cloud tenants, ensuring their operations run smoothly and securely.

!!! important "Important information regarding the demonstration environment!"
    In this demonstration environment, full access to the IBM Cloud account is NOT provided. Users will NOT have the ability to step through the provisioning process for a dedicated host in the demonstration environment. The following click through demonstration covers the provisioning steps of a dedicated host.

**Due to limited number available dedicated hosts and associated costs, a dedicated host was not reserved for this demonstration environment in IBM Technology Zone.**

Note, fields that require a text entry (e.g. workspace name) are pre-populated in the click-thru demonstration.

!!! tip
    Not sure where to click or what to do next? Simply click anywhere on the screen and the spot to click next will be highlighted.

1. Open the link below and then click the play button ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

    **Click-thru demo:** <a href="https://ibm.github.io/SalesEnablement-test-repo/includes/Provisioning-a-DedicatedHost/index.html" target ="_blank">Provision a Dedicated Host</a>

2. Click **Dedicated hosts** in left menu bar.
3. Click **Reserve host +**.
4. Click **Create new +**.

Dedicated host groups can be shared with additional workspaces to share capacity of reserved dedicated hosts. 

Dedicated hosts can only be reserved into host groups created by the current workspace. Once a dedicated host is reserved, it cannot be moved between host groups. 

5. Click in the **Dedicated host group name** text entry field.
   
Note, the ability to share the **Dedicated host group** between workspaces. Selected workspaces will have secondary access to all dedicated hosts within the group and will be able to consume and view their capacity. Secondary workspaces cannot reserve dedicated hosts into the group, or share with additional workspaces.

6. Click **Save**.
7. Click in the **Host name** text entry field.
8. Click the **Machine type** pull-down menu.

As of July 2024, PowerVS supports reserving either Power S922 or S1022 servers as dedicated hosts. Availability of dedicated hosts vary by data center. At the time this click through demonstration was created, the data center specified by the workspace only had S922 servers available. 

9. Click **S922 (15 cores | 0.98 TB)**.
10. Click **Finish**.
11. Click **I agree to the Terms and conditions**.

The next step would be to click **Create**. 
Once reserved, users are able to provision virtual server instances using either the provided standard operating system images or imported custom images. Shared processor pools (SPPs) can also be created in a dedicated host. Learn more about dedicated hosts <a href="https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-dedicated-host" target="_blank">here</a>.


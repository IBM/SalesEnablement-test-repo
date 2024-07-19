A deployable architecture is cloud automation for deploying a common architectural pattern that combines one or more cloud resources. It is designed to provide simplified deployment by users, scalability, and modularity. A deployable architecture incorporates one or more modules. Deployable architectures are coded in Terraform, which you configure with input variables to achieve a desired behavior. Learn more about deployable architectures <a href="https://cloud.ibm.com/docs/secure-enterprise?topic=secure-enterprise-understand-module-da" target="_blank">here</a>.

As of July 2024, IBM Power Virtual Server (PowerVS) has 2 deployable architectures in the IBM Cloud Catalog.

- **Power Virtual Server with VPC landing zone**
    
    Provisioning Power Virtual Server with Virtual Private Cloud (VPC) landing zone by using deployable architectures provides an automated deployment method to create an isolated PowerVS workspace and connect it with IBM Cloud services and public internet. Network management components like DNS, NTP, proxy servers and NFS as a Service might be installed. Comparing the provisioning through the projects UI, user interaction is minimized and ready-to-go deployment time of a PowerVS workspace is reduced from days to less than 1 hour. Learn more about this deployable architecture <a href="https://cloud.ibm.com/docs/powervs-vpc?topic=powervs-vpc-automation-solution-overview" target="_blank">here</a>.

- **Power Virtual Server for SAP HANA**

    SAP solution provisioning on PowerVS using deployable architectures provides an automated deployment method to create a PowerVS landscape with SAP HANA systems. User interaction is minimized and SAP system deployment time is reduced from weeks to days. This deployable architecture is a composition or **stack** of this deployiable architecture and the Power Virtual Server with VPC. Learn more about this deployable architecture <a href="https://cloud.ibm.com/docs/sap-powervs?topic=sap-powervs-automation-solution-overview" target="_blank">here</a>.

The click through demonstration that follows steps through the provisioning of the **Power Virtual Server with VPC landing zone** deployable architecture. A brief tour of the environment is also provided in the click through demonstration. The deployed solution is available in the IBM Technology Zone environment associated with this demonstration guide. You will have view-only access to the PowerVS workspace and the associated virtual private cloud (VPC).

Use the click through demonstration to experience provisioning a deployable architecture for PowerVS.

Note, fields that require a text entry (for example workspace name) are pre-populated in the click through demonstration.

!!! tip
    Not sure where to click or what to do next? Click anywhere on the screen and the next spot to click is highlighted.

1. Open the following link and then click play ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

    **Click through demo:** <a href="https://ibm.github.io/SalesEnablement-test-repo/includes/Provisioning-a-DeployableArchitecture/index.html" target ="_blank">Provision a Dedicated Host</a>
Now it is time to provision an AIX PowerVS instance (VSI). Use the click-thru demonstration below to practice. Refer to the video for talking points if the click-thru demonstration is utilized with clients.

Note, fields that require a text entry (e.g. instance name) are pre-populated in the click-thru demonstration.

!!! tip
    Not sure where to click or what to do next? Simply click anywhere on the screen and the spot to click next will be highlighted.

1. Open the link below and then click the play button ![](_attachments/ClickThruPlayButton.png) to begin the demonstration.

    **Click-thru demo:** <a href="https://ibm.github.io/SalesEnablement-test-repo/includes/Provision-LinuxVM/index.html" target ="_blank">Create an IBM Power Virtual Server Instance</a>

2. Click **{{powerVS.serviceInstanceName}}** in **Workspaces** table.
3. Click **View virtual servers**.
4. Click **Create instance +**.

The next steps refer to the entries in the **General** section of the **Create virtual server instance** form.

5. Click in the **Instance name** text entry field.
6. Click the **Add to a server placement group** information icon (![](_attachments/infoIcon.png)).
7. Click the information pop-up to dismiss it.
8. Click the **Add to a shared processor pool** information icon (![](_attachments/infoIcon.png)).
9. Click the information pop-up to dismiss it.
10. Click the **Virtual server pinning** information icon (![](_attachments/infoIcon.png)).
11. Click the information pop-up to dismiss it.
12. Click the **Select virtual server pinning** pull-down.
13. Click **None**.
14. Click the **Select SSH key** pull-down.
15. Click **{{powerVS.sshKey}}**.
16. Click the **Continue** button in the **General** section.

The next steps refer to the entries in the **Boot image** section of the **Create virtual server instance** form.

17. Click the **Select OS** pull-down.
18. Click **AIX**.
19. Click the **Configure for Epic workloads** information icon (![](_attachments/infoIcon.png)).
20. Click the information pop-up to dismiss it.
21. Click the **Select image** pull-down.
22. Click **7300-02-01**.
23. Click the **Tier** pull-down (it will already be set to **Tier3 (3 IOPs/GB)**).
24. Click **Tier 3 (3 IPOs/GB)**.
25. Click the **Continue** button under the **Boot image** section.

The next steps refer to the entries in the **Profile** section of the **Create virtual server instance** form.

26. Click the **Select machine type** pull-down.
27. Click **s922**.
28. Click the **Core type** information icon (![](_attachments/infoIcon.png)).
29. Click the information pop-up to dismiss it.
30. Click the **Cores** information icon (![](_attachments/infoIcon.png)).
31. Click the information pop-up to dismiss it.
32. Click the **Continue** button under the **Profile** section.

The next steps refer to the entries in the **Storage volumes** section of the **Create virtual server instance** form.

33. Click the **Create volume +** button.
34. Click in the **Name in VSI** text entry field.
35. Click **+** to increase the size of the volume to 2GB.
36. Click the **Tier** pull-down (it will already be set to **Tier3 (3 IOPs/GB)**).
37. Click **Tier 3 (3 IPOs/GB)**.
38. Toggle the **Shareable**  button to **On**.
39. Click the **Create and attach** button.
40. Click the **Continue** button under the **Storage volumes** section.

The next steps refer to the entries in the **Network interfaces** section of the **Create virtual server instance** form.

Note: for this demonstration, the instance will be provisioned using a public network (Internet facing). Using the public network makes demonstrating access to instances easy, but most production deployments of PowerVS will utilize private networks and control access using Direct Link, Virtual Private Network (VPN), or Megaport Software Defined Network (SDN). To learn more about PowerVS networking options, look <a href="https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-network-architecture-diagrams" target="_blank">here</a>.

41. Toggle the **Public networks** button to **On**.
42. Click the **Attach +** button.
43. Click the **Select Network** pull-down.
44. Click **{{powerVS.privateSubnet}}**.
45. Click **Attach**.
46. Click the **Finish** button under the **Network interfaces** section.
47. Click the **I agree to the Terms and conditions** checkbox.
48. Click **Create**.

The AIX PowerVS instance is now being provisioned. This process took approximately 15 minutes when creating the TechZone environment. Notice the value under the **Status** column of the **Virtual server instances** table. Once the status changes to an **Active** state, the instance is ready to be accessed.

In the next Part of the demonstration script, learn how to use the IBM Cloud Portal to manage PowerVS instances.

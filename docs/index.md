Welcome to the IBM Cloud Satellite Technology Sales Enablement Level 3 demonstration guide. The goal of this demonstration guide is to provide IBM and Business Partner Sales and Technical Sales the knowledge and tools to perform introductory demonstrations of IBM Cloud Satellite.

There are 4 parts to this demonstration guide as seen in the left hand navigation:

 - Part 1 - Setup
   
   Learn about the environment that will be utilized for this learning activity, the prerequisites required, and how to create a reservation for the environment in IBM Technology Zone (ITZ).

 - Part 2 - Provisioning and configuring IBM Cloud Satellite

   Learn about the provisioning process for IBM Cloud Satellite *Location*, Satellite-enabled *Services*, and *Link endpoints*. Note, in this activity a new IBM Cloud Satellite Location will NOT be provisioned. Rather, a shared, pre-provisioned Satellite Location and cloud-enabled service (Red Hat OpenShift on IBM Cloud) will be utilized. Videos are provided that demonstrate the provisioning processes for these resources.

 - Part 3 - Satellite Config

   Learn about Satellite *Config* and how it is used to easily deploy Kubernetes resources to RedHat OpenShift clusters maintained in a GitHub repository. 

 - Part 4 - The demonstration

   In the final section, learn how to demonstrate to client's some of the value of IBM Cloud Satellite. Guidance on performing a client demonstration using the shared ITZ environment is provided that illustrates how IBM Cloud Satellite and cloud-enabled services are provisioned, and how Sat Config can be used to deploy and manage Kubernetes resources easily and consistently.

Some content will be a labeled as **Required for technical sales only**. However, individuals in sales roles are highly encouraged to complete these sections and include them in their demonstrations. Step-by-steps directions are provided, but some technical knowledge and experience with source control systems like GitHub and basic Yet Another Markup Language (YAML) is assumed.

!!! important "Important"

    Note: all images and videos used in this demonstration guide were created in June 2023. There may be differences between these images and videos than the current IBM Cloud Portal, Red Hat OpenShift web console, and other user interfaces shown.

## Helpful tips for using this demonstration environment

Throughout the lab, you will see images that are examples of what you should be seeing in the IBM Cloud Portal, Red Hat OpenShift web console, and other web pages and tools used in this guide. The following styles of highlighting is used:

- Action highlight box: Illustrates where to click,  enter, or select an item:

![](_attachments/ClickActionRectangle.png)

- Path/explore highlight box: Illustrates one of two things:

    - the path to follow to get to a specific location in the user interface
    - areas to explore

![](_attachments/PathExploreHighlight.png)

- Copy to clipboard box: Text that is copied to local clipboard. Click the copy icon (highlighted below) and then paste using local operating systems paste function, for example, entering ++ctrl++**+v**, ++cmd++**+v**, or right click and select paste.

![](_attachments/Usage-Clipboard.png)

<!-- Additionally, there are several "click-thru" demonstrations.  Links to click-thru demonstrations will open in a new browser window or tab with a screen similar to the image below.

![](_attachments/ClickThruStartPage.png)

Click the play button ![](_attachments/ClickThruPlayButton.png) in the middle of the screen to start the demo. Then, simply follow the steps in the demonstration guide. If at any point you are unsure where to click, click anywhere on the screen and a highlight box will appear showing where to click next. -->

## Acronyms

The following acronyms are used throughout this demonstration guide:


    - cmd - The command key on your keyboard
    - ctrl - The control key on your keyboard
    - ITZ - IBM Technology Zone
    - YAML - Yet Another Markup Language
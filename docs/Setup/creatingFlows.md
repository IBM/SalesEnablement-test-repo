# Creating skill flows
As seen in the previous section, running the Ansible skill to **Gather z/OS facts**, the skill executed successfully and was verified within the Ansible Automation Platform (AAP) console by viewing the job output. However, the output wasn’t displayed by the assistant. To enable this scenario, a skill flow is needed. Skills are often more valuable when combined with other skills. You can create a skill flow to use two or more skills together to finish a task (like returning the output of a previous skill). When you create a skill flow, you map the output of one skill as the input for subsequent skills. Learn more about creating skill flows <a href="https://www.ibm.com/docs/en/watsonx/waz/2.x?topic=combining-skills-into-skill-flows" target="_blank">here</a>.

As mentioned in a previous section, there are some default utility skills that are provided out of the box with the “Z Skills Accelerator” which are leveraged to return the output of a skill. To accomplish this, we will import the Ansible Utility skill called **Retrieve job output**.

## Add the utility skill

1. Open IBM watsonx Orchestrate **Skill studio**.

    ![](_attachments/skillFlow0.png)

2. Expand **Create** and click **Import API**.

    ![](_attachments/skillFlow1.png)

3. Click the **z/OS Skills accelerator (Trial)** tile.

    ![](_attachments/skillFlow2.png)

4. Enter the following values in the **z/OS Skills accelerator** form and then click **Connect**.

    Use the **URL**, **User Name**, and **Password** values recorded in the [Explore Ansible Automation Platform](exploreAAP.md) section earlier.

    **a**: Connection Type: `ansible`

    **b**: Application Name: <use the same application name as in previous section\>

    **c**: Connection URL: <enter the URL for your AAP UI\>

    **d**: User Name: <enter the AAP User Name (for UI access)\>

    **e**: Password: <enter the AAP User Password\>

    **f**: Search Pattern: `*`

    ![](_attachments/skillsForm.png)

5. Expand **Ansible Utility Skills** and click **Ansible Utility Skills**.

    ![](_attachments/skillFlow3.png)

6. Select **Retrieve job output** and click **Save as draft**.

    ![](_attachments/skillFlow4.png)

7. Click the ellipses (![](_attachments/ellipsesIcon.png)) for the **Retrieve job output** skill and select **Enhance this skill**.

    ![](_attachments/skillFlow5.png)

8. Review the skill settings and then click **Publish**.

    ![](_attachments/skillFlow6.png)

9. Select **Skill sets** from the main menu.

    ![](_attachments/skillFlow7.png)

10. Select (a) your draft assistant in the **Team Skills** drop-down list and (b) click the **Connections** tab.

    ![](_attachments/skillFlow8.png)

11. Click the **Search** (![](_attachments/searchIcon.png)) icon.

    ![](_attachments/skillSets3.png)

12. Search for the application name you specified earlier.

    ![](_attachments/skillSets4.png)

13. Click the (a) ellipses (![](_attachments/ellipsesIcon.png)) for your application and (b) click **Edit connection**.

    ![](_attachments/skillFlow9.png)

14. Verify the application is **Connected** (**a**) and then click **Close** (**b**).

    ![](_attachments/skillFlow10.png)

## Add the skills to your Personal skills
1. Click **Skill catalog** in the main menu.

    ![](_attachments/skillFlow11.png)

2.  Search for the application name you specified earlier.

    ![](_attachments/skillFlow12.png)

3.  Click the tile for your application.

    Note, the tile name is proceeded by **Ansible Controller Skills**.

    ![](_attachments/skillFlow13.png)

4.  Click **Add skill** for each of the skills you want to add to the flow.

    ![](_attachments/skillFlow14.png)

## Create the skill flow
1. Click **Skill studio** in the main menu.

    ![](_attachments/skillFlow15.png)

2.  Expand the **Create** drop-down menu and click on **Skill flow**.

    ![](_attachments/skillFlow16.png)

3.  Click the **+** icon.

    ![](_attachments/skillFlow17.png)

    Next, you need to add the **z/OS Gather Facts** skill and the **Retrieve job output** skill to the skill flow. Use the **Search apps** function to locate the skills.

4. Search for the application name you specified earlier and click it's tile.

    ![](_attachments/skillFlow18.png)

5.  Click **Add Skill** in the **z/OS Gather Facts** tile.

    ![](_attachments/skillFlow19.png)

6.  Verify the **z/OS Gather Facts** skill is added to the skill flow.

    ![](_attachments/skillFlow20.png)

7.  Click the **+** icon **after** the **z/OS Gather Facts** tile.

    ![](_attachments/skillFlow21.png)

8.  Repeat steps 5 and 6 for the **Retrieve job output** skill. 

    After adding the **Retrieve job output** skill, your skill flow should like like:

    ![](_attachments/skillFlow22.png)

    Next you must map the output values of the first skill to the input of the second skill. In this case, pass the “job id” output from **z/OS Gather Facts** as an input for **Retrieve job output**. 

9. Click the **Retrieve job output** tile.

    ![](_attachments/skillFlow23.png)

10. Select the **Input** tab and click in the **id** field.

    ![](_attachments/skillFlow24.png)

11. Click the **z/OS Gather Facts** skill in the **Mapping data for "id"** section.

    ![](_attachments/skillFlow25.png)

12. Click the **job** icon.

    ![](_attachments/skillFlow25-a.png)

13. Verify the **job** appears in the **id** field.

    ![](_attachments/skillFlow25-b.png)

14. Optionally, toggle the **Hide this from from the user** setting.

    For this lab guide, this option is left disabled. Learn more about this option <a href="https://www.ibm.com/docs/en/watsonx/waz/2.x?topic=combining-skills-into-skill-flows#hiding-input-and-output-forms" target="_blank">here</a>.

    ![](_attachments/skillFlow26.png)

15. Click the **x** to close mapping window.

    ![](_attachments/skillFlow27.png)

16. Click the pencil (![](_attachments/pencilIcon.png)).

    ![](_attachments/skillFlow28.png)

17. Enter a (a) **Name** and (b) **Description** for your skill flow and then (c) click **Save**.

    ![](_attachments/skillFlow29.png)

18. Expand the **Actions** pull-down list and click **Save as draft**.

    ![](_attachments/skillFlow30.png)

19. Expand the **Actions** pull-down list and click **Enhance**.

    ![](_attachments/skillFlow31.png)

    On the **Enhancing the skill** pages, you can:

    - modify the skill name, description, and version
  
    - add phrases (prompts) that will be recognized by the assistant to call the skill flow

20.  Click the **Phrases** tab.

    ![](_attachments/skillFlow32.png)

21. Replace the existing **phrases** (prompts) and then click **Publish**.

    Notice the default prompts are either not very intuitive (the skill flow name) or a bit verbose. Replace the existing phrases with phrases that you anticipate users will enter.

    !!! Bug "Be careful with the sample phrases you specify."

        During the development of the lab guide, it was discovered that some sample phrases with a `/` character can cause issues with the actions. Avoid using **z/OS** in the your sample phrases. This issue has been reported to the offering team.

    Example prompts:
    ```
    Show me zOS facts
    ```
    ```
    Gather and display zOS facts
    ```

    ![](_attachments/skillFlow33-b.png)

## Enable the skill flow in your assistant

1. Click **AI assistant builder** in the main menu.

    ![](_attachments/skillFlow34.png)

2.  Hover over the **Home** (![](_attachments/homeIcon.png)) and click **Actions**.

    ![](_attachments/skillFlow35.png)

3.  Click **New action**.

    ![](_attachments/skillFlow36.png)

4.  Click the **Skill-based action** tile.

    ![](_attachments/skillFlow37.png)

5.  Click the skill flow you created earlier and then click **Next**.

    **Note**: it may take a minute for the tiles to appear on the screen.

    ![](_attachments/skillFlow38.png)

6.  Enter an example prompt for the skill and click **Save**.

    You can use one of the prompts you used earlier for the skill flow.

    ```
    Show me zOS facts
    ```

    ![](_attachments/skillFlow39-b.png)

7.  Enter any additional phrases (prompts) and then click the **save** (![](_attachments/diskIcon.png)).

    ![](_attachments/skillFlow40-b.png)

8. Click close (**x**).

    ![](_attachments/skillFlow41-0.png)

9. Select the original skill you created (**a**) (not the skill flow you just created), click the ellipses (**b**), and then click **Delete** (**c**).

    ![](_attachments/skillFlow41-a.png)

10. Wait for system training to complete.

    **Note**: The message will change to "System is trained" and then disappear.

    ![](_attachments/skillFlow41-b.png)

11. Click **Preview**.

    ![](_attachments/skillFlow41-c.png)

12.  Enter one of the prompts you specified into the assistant preview.

    ```
    Show me zOS facts
    ```

    ![](_attachments/skillFlow42-b.png)

13. **Wait 10 seconds** and then click **Apply**.

    **Note**: It is important to wait for the first job to complete before submitting the second job in the flow.

    ![](_attachments/skillFlow43-b.png)

14. Review the results from the skill flow.

    Use both scroll bars in the assistant preview to review all of the returned information. The output should be similar to what was seen in the AAP web console. The character strings like `[0;32m` are special characters that are not properly displayed in the assistant preview interface.

    ![](_attachments/skillFlow44.png)

    ??? Example "Sample output form the Z/OS gather facts flow."

        Content 

        Identity added: /runner/artifacts/16/ssh_key_data (/runner/artifacts/16/ssh_key_data)
        [1;35m[WARNING]: Collection ibm.ibm_zos_core does not support Ansible version 2.14.2[0m
        
        PLAY [Gather z/OS-specific facts.] *********************************************
        
        TASK [Gather all facts about z/OS host.] ***************************************
        [0;32mok: [zos_host][0m
        
        TASK [Print gathered facts about the master catalog.] **************************
        [0;32mok: [zos_host] => {[0m
        [0;32m    "msg": [[0m
        [0;32m        "master catalog dsn: CATALOG.VS01.MASTER",[0m
        [0;32m        "master catalog volser: OPEVS1"[0m
        [0;32m    ][0m
        [0;32m}[0m
        
        TASK [Print only CPC and IODF info from gathered z/OS facts.] ******************
        [0;32mok: [zos_host] => {[0m
        [0;32m    "msg": [[0m
        [0;32m        "manufacturer: IBM",[0m
        [0;32m        "model: A00",[0m
        [0;32m        "plant: C1",[0m
        [0;32m        "iodf name: PROV.IODF00",[0m
        [0;32m        "iodf config: DEFAULT"[0m
        [0;32m    ][0m
        [0;32m}[0m
        
        TASK [Print out all gathered facts about the z/OS host.] ***********************
        [0;32mok: [zos_host] => {[0m
        [0;32m    "ansible_facts": {[0m
        [0;32m        "arch_level": "2",[0m
        [0;32m        "cpc_nd_manufacturer": "IBM",[0m
        [0;32m        "cpc_nd_model": "A00",[0m
        [0;32m        "cpc_nd_plant": "C1",[0m
        [0;32m        "cpc_nd_seqno": "20D90792EB76",[0m
        [0;32m        "cpc_nd_type": "008562",[0m
        [0;32m        "edt": "00",[0m
        [0;32m        "hw_name": "",[0m
        [0;32m        "ieasym_card": "(00,K2)",[0m
        [0;32m        "io_config_id": "00",[0m
        [0;32m        "iodate": "",[0m
        [0;32m        "iodesc": "",[0m
        [0;32m        "iodf_config": "DEFAULT",[0m
        [0;32m        "iodf_name": "PROV.IODF00",[0m
        [0;32m        "iodf_unit_addr": "DE28",[0m
        [0;32m        "ioproc": "",[0m
        [0;32m        "iotime": "",[0m
        [0;32m        "ipaloadxx": "K2",[0m
        [0;32m        "ipl_volume": "D25VS1",[0m
        [0;32m        "load_param_device_num": "DE28",[0m
        [0;32m        "load_param_dsn": "SYS0.IPLPARM",[0m
        [0;32m        "lpar_name": "",[0m
        [0;32m        "master_catalog_dsn": "CATALOG.VS01.MASTER",[0m
        [0;32m        "master_catalog_volser": "OPEVS1",[0m
        [0;32m        "nucleus_id": "1",[0m
        [0;32m        "operator_prompt_flag": "M",[0m
        [0;32m        "parmlib_dsn": "K2.PARMLIB",[0m
        [0;32m        "parmlib_volser": "USRVS1",[0m
        [0;32m        "primary_jes": "JES2",[0m
        [0;32m        "product_mod_level": "00",[0m
        [0;32m        "product_name": "z/OS",[0m
        [0;32m        "product_owner": "IBM CORP",[0m
        [0;32m        "product_release": "05",[0m
        [0;32m        "product_version": "02",[0m
        [0;32m        "smf_name": "VS01",[0m
        [0;32m        "sys_name": "VS01",[0m
        [0;32m        "sysplex_name": "LOCAL",[0m
        [0;32m        "tsoe_rel": "05",[0m
        [0;32m        "tsoe_ver": "4",[0m
        [0;32m        "vm_name": ""[0m
        [0;32m    }[0m
        [0;32m}[0m

        PLAY RECAP *********************************************************************
        [0;32mzos_host[0m                   : [0;        32mok=4                            [0m changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ig      nored=0   
        

The scenario shown above may or may not be relevant for your client's use case. It is intended to show you how to sequence skills together in a skill flow to create an action that your assistant triggers based on prompts using the pre-configured Ansible automation templates. You are encouraged to create your own skill flows and prompts using other skills available within the AAP instance. As an example, create a skill flow for the **z/OS Ping** skill. Be sure to add the **Retrieve job output** skill to view the results.

Next, learn about custom-built actions.
#!/bin/bash
#
# to get the lastest version of this script run the following command
# wget https://raw.githubusercontent.com/IBM/ibm-dte-openlab-samples/master/satellite/deployIBMSatL3.bash
# chmod +x ./satelliteSwapIPS.bash
#



# move to home directory if not already there
cd $HOME

# some variables we will need
export origIFS=$IFS
export TZ_ACCOUNT="b77832f89c084e1d994ec9ae8e1bce0e"
export AWSREGION="us-east-2"
export AWS_INSTALL="$HOME/awsinstall"        # directory for binary
export BIN="$HOME/bin"
export AWS_DESCRIBE_INSTANCES="$HOME/awsInstances.txt"
export IBMUniqueID=""
export USER_NAMESPACE=""
export VERSIONS=("kafka-mongo-redis" "food-delivery-backend" "food-delivery-frontend-v1" "food-delivery-frontend-v2" "development-route" "production-route")
export SUBSCRIPTIONS=("kafka-mongo-redis-on-all-clusters" "backend-on-all-clusters" "frontend-on-dev-clusters" "frontend-on-prod-clusters" "route-dev" "route-prod")
export PROD_CLUSTER_GROUP="food-delivery-production-clusters"
export DEV_CLUSTER_GROUP="food-delivery-development-clusters"
export GITREPO_RAW_URL_BASE="https://raw.githubusercontent.com/IBM/SalesEnablement-Satellite-L3/main"
export MKDOCS="mkdocs.yml"
export WGET_OPTIONS="-q --show-progress"

export configUUID=""

#---------------------------------------------------------------------------------------------
# get user information
#
#---------------------------------------------------------------------------------------------


getUserNamespace() {

# find the IBMUniqueID
IBMUniqueID=`ibmcloud account user-preference  --output JSON | jq -r .ibmUniqueId`
#echo ibmUniqueID = $IBMUniqueID


####
#
# Set namespace variable
# useing unique IBMid less the "IBMid-" prefix and adding "-ns"
# convert to all lower case as namespaces in OpenShift must be lower case
#
####
USER_NAMESPACE=`echo ${IBMUniqueID} | cut -d '-' -f 2`"-ns"
USER_NAMESPACE=${USER_NAMESPACE,,}
#echo USER_NAMESPACE=${USER_NAMESPACE}
}

#---------------------------------------------------------------------------------------------
# get all the YAML files from git repo
#
#---------------------------------------------------------------------------------------------
getAllYAMLFiles() {

for yamlBaseName in ${VERSIONS[@]}
do
	echo YamlBaseName=${yamlBaseName}
	wget ${WGET_OPTIONS} ${GITREPO_RAW_URL_BASE}/includes/${yamlBaseName}.yaml
done

echo get mkdocs.yml

wget ${WGET_OPTIONS} ${GITREPO_RAW_URL_BASE}/${MKDOCS}

# |**Subscription name**              | **Version**               | **Cluster group(s)**               |
#|-----------------------------------|---------------------------|------------------------------------|
#| kafka-mongo-redis-on-all-clusters | kafka-mongo-redis         | food-delivery-production-clusters<br>food-delivery-development-clusters|
#| backend-on-all-clusters           | food-delivery-backend     | food-delivery-production-clusters<br>food-delivery-development-clusters|
#| frontend-on-dev-clusters          | food-delivery-frontend-v1 | food-delivery-development-clusters |
#| frontend-on-prod-clusters         | food-delivery-frontend-v2 | food-delivery-production-clusters  |
#| route-dev                         | development-route         | food-delivery-development-clusters |
#| route-prod                        | production-route          | food-delivery-production-clusters  |

}

#---------------------------------------------------------------------------------------------
# verify users configuration exists
#
#---------------------------------------------------------------------------------------------

verifyConfig() {
	configJSON=`ibmcloud sat config get --config ${USER_NAMESPACE} --output JSON`
		if [ $? -ne 0 ]
		then
			echo "${USER_NAMESPACE} does not exist!"
	    echo "Checking you are in the correct TechZone account."
			ibmcloud account list | grep ${TZ_ACCOUNT}
			if [ $? -ne 0 ]
			then
				echo "You don't appear to have an ID in the TechZone account for this demosntration."
				echo "Aborting operations."
			  exit 1
			else
				echo "Attempting to switch accounts."
				ibmcloud target -c ${TZ_ACCOUNT}
				if [ $? -ne 0 ]
			  then
					echo "Unable to switch to TechZone account."
					echo "Aborting operations."
					exit 1
				else
					# make rescrusive call back to verifyConfig
				  verifyConfig
				fi
			fi
		fi
	# get conifgUUID from configJSON
	configUUID=`echo ${configJSON} | jq -r .uuid`
	echo "${USER_NAMESPACE} configuration exists - UUID = ${configUUID}"
}

#---------------------------------------------------------------------------------------------
# delete each of the versions
#
#---------------------------------------------------------------------------------------------
deleteVersions() {
	for yamlBaseName in ${VERSIONS[@]}
	do
		echo Deleting version ${yamlBaseName}
		ibmcloud sat config version rm --config ${configUUID} --version ${yamlBaseName}  -f
	done
}

#---------------------------------------------------------------------------------------------
# delete each of the SUBSCRIPTIONS
#
#---------------------------------------------------------------------------------------------
deleteSubscriptions() {
#	for subName in ${SUBSCRIPTIONS[@]}
#	do
#		echo Deleting subscription ${subName}
#		ibmcloud sat subscription rm --subscription ${subName} -f
#	done

	ibmcloud sat config get --config ${USER_NAMESPACE} --output json | jq -r '.subscriptions[]|"\(.uuid) \(.name)"'   | while read subUUID subNAME
	do
		echo uuid = $subUUID name = $subNAME
		# don't remove the namespace subscription until we get rid of everything in that openshift namespace first
		if [[ "${subNAME}" == "${USER_NAMESPACE}-sub" ]]
		then
			echo skip ${USER_NAMESPACE}-sub
		else
                	echo removing subscription: ${subUUID}
		        # ibmcloud sat subscription rm --subscription ${USER_NAMESPACE}-sub -f || errorOut "failed removing satellite subscriptions for: {$USER_NAMESPACE}"
		        ibmcloud sat subscription rm --subscription ${subUUID} -f
		fi
  done

  # don't remove the subscription for the namespaces
  #  echo removing ${USER_NAMESPACE}-sub
  #  ibmcloud sat subscription rm --subscription ${USER_NAMESPACE}-sub -f




}



#---------------------------------------------------------------------------------------------
# cleanup temporary files
#
#---------------------------------------------------------------------------------------------


cleanup() {

  if [ -f ${MKDOCS} ]; then
		rm ${MKDOCS}
	fi
	for yamlBaseName in ${VERSIONS[@]}
	do
	#	echo YamlBaseName=${yamlBaseName}
	  if [ -f ${yamlBaseName}.yaml ]; then
			rm ${yamlBaseName}.yaml
	  fi
		if [ -f ${yamlBaseName}yaml.orig ]; then
  		rm ${yamlBaseName}.yaml.orig
    fi
	done
#	rm $AWS_DESCRIBE_INSTANCES || echo "Unable to remove temporary file: $AWS_DESCRIBE_INSTANCES"
}

#---------------------------------------------------------------------------------------------
# Test an IP address for validity:
# Usage:
#      valid_ip IP_ADDRESS
#      if [[ $? -eq 0 ]]; then echo good; else echo bad; fi
#   OR
#      if valid_ip IP_ADDRESS; then echo good; else echo bad; fi
#---------------------------------------------------------------------------------------------
function valid_ip()
{
    local  ip=$1
    local  stat=1
# echo "valid_ip $ip"

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        OIFS=$IFS
        IFS='.'
        ip=($ip)
        IFS=$OIFS
        [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        stat=$?
    fi
# echo "valid_ip stat = $stat"
    return $stat
}

#---------------------------------------------------------------------------------------------
# prompt utility
# usage:
#    yesno "prompt with all spaces and punctiation (y|n)? "
#    returns 0 for Yes|Y|y
#    returns 1 for No|N|n
#---------------------------------------------------------------------------------------------

yesno() {

	read -p "$@" -n 1 -r
	echo

	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		return 0
	elif [[ $REPLY =~ ^[Nn]$ ]]
	then
		return 1
	else
		echo "Invalid response, please try again."
		# echo "\$@ = $@"
		# making recursive call and returning valid answer back... eventually
		yesno "$@"
		return $?
	fi
}

#---------------------------------------------------------------------------------------------
# Main flow
# currently prompting before we take any action
#---------------------------------------------------------------------------------------------


# install AWS CLI
# yesno "Do you want to download and install the AWS CLI (y|n)? " && installAWSCLI || echo "Skipping AWS CLI install."





# find user's IBMID
# generate namespace and config namespace
getUserNamespace

# verify the users configuration actually exists
echo
yesno "Verify your configuration exists? (y|n)? " && verifyConfig || echo "Skipping configuration verification."

# get key values from mkdocs.yml
# perform string substitutions for all the yaml files based upon mkdocs values
# add versions to config space
echo
yesno "Do you want to delete the subscriptions in your configuration (y|n)? " && deleteSubscriptions || echo "Skipping subscription deletion."
# add subscriptions to config space with specific versions

echo
yesno "Do you want to delete the versions in your configuration (y|n)? " && deleteVersions || echo "Skipping version deletion."
# add subscriptions to config space with specific versions

echo
# cleanup
yesno "Do you want to remove temporary files (y|n)? " && cleanup || echo "Skipping removal of temporary files."

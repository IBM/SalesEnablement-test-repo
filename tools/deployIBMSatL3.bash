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

export KMR_sub=(${SUBSCRIPTIONS[0]} ${VERSIONS[0]} "--group ${PROD_CLUSTER_GROUP} --group ${DEV_CLUSTER_GROUP}")
export FDB_sub=(${SUBSCRIPTIONS[1]} ${VERSIONS[1]} "--group ${PROD_CLUSTER_GROUP} --group ${DEV_CLUSTER_GROUP}")
export FEDEV_sub=(${SUBSCRIPTIONS[2]} ${VERSIONS[2]} "--group ${DEV_CLUSTER_GROUP}")
export FEPROD_sub=(${SUBSCRIPTIONS[3]} ${VERSIONS[2]} "--group ${PROD_CLUSTER_GROUP}")
export RD_sub=(${SUBSCRIPTIONS[4]} ${VERSIONS[4]} "--group ${DEV_CLUSTER_GROUP}")
export RP_sub=(${SUBSCRIPTIONS[5]} ${VERSIONS[5]} "--group ${PROD_CLUSTER_GROUP}")

export SUBSCRIPTION_DEFINITIONS=(KMR_sub FDB_sub FEDEV_sub FEPROD_sub RD_sub RP_sub)






# |**Subscription name**              | **Version**               | **Cluster group(s)**               |
#|-----------------------------------|---------------------------|------------------------------------|
#| kafka-mongo-redis-on-all-clusters | kafka-mongo-redis         | food-delivery-production-clusters<br>food-delivery-development-clusters|
#| backend-on-all-clusters           | food-delivery-backend     | food-delivery-production-clusters<br>food-delivery-development-clusters|
#| frontend-on-dev-clusters          | food-delivery-frontend-v1 | food-delivery-development-clusters |
#| frontend-on-prod-clusters         | food-delivery-frontend-v2 | food-delivery-production-clusters  |
#| route-dev                         | development-route         | food-delivery-development-clusters |
#| route-prod                        | production-route          | food-delivery-production-clusters  |


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
# Syncrhonize role-based access controls
#
#---------------------------------------------------------------------------------------------
syncRBAC() {
	# Synchronize the Role-based access controls (RBAC) for the IBM Cloud Satellite Location's OpenShift cluster.
	# The command forces the RBAC to be syncronized between IBM Cloud and the Red Hat OpenShift cluster running in the IBM Cloud Satellite Location.
	# If this command is not run, issues may be encountered later in this demonstration.

	# need to get {{ aws.cluster_id }} with from mkdocs.yaml


	# yq is old in IBM Cloud shell so just using grep to get the ingress values  from MKDOCS
  if [ ! -f mkddocs.yml ]
	then
		echo getting mkdocs.yml
		wget ${WGET_OPTIONS} ${GITREPO_RAW_URL_BASE}/${MKDOCS}  || {
			echo "Unable to get mkdocs.yml from git repository."
			echo "Exiting"
			exit 1
		}
	fi

	# AWS_CLUSTER_ID=`grep cluster_id mkdocs.yml | cut -f2 -d':'| sed -e "s/^ *//g"`
	AWS_CLUSTER_ID=`yq r mkdocs.yml 'extra.aws.cluster_id'`
	AWS_CLUSTER_ID=${AWS_CLUSTER_ID##*( )}

	ibmcloud ks cluster config --cluster ${AWS_CLUSTER_ID}


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
# create each of the versions
#
#---------------------------------------------------------------------------------------------
createVersions() {
	for yamlBaseName in ${VERSIONS[@]}
	do
		echo Creating version ${yamlBaseName} using ${yamlBaseName}.yaml
		ibmcloud sat config version create -name ${yamlBaseName} --read-config ${yamlBaseName}.yaml --config ${configUUID} --file-format yaml
	done


}

#---------------------------------------------------------------------------------------------
# create each of the SUBSCRIPTIONS
#
#---------------------------------------------------------------------------------------------
createSubscriptions() {
	declare -n elmv1
	for elmv1 in "${SUBSCRIPTION_DEFINITIONS[@]}"
	do
		echo Creating subscription ${elmv1[0]} with version ${elmv1[1]} in ${elmv1[2]}
		ibmcloud sat subscription create --name ${elmv1[0]} ${elmv1[2]} --config ${configUUID} --version ${elmv1[1]}
	done

#	  ibmcloud sat subscription create --name ${subName} $bothGroupString --config ${configUUID} --version kafka-mongo-redis$i

}

#---------------------------------------------------------------------------------------------
# update version files with user config info
#
#---------------------------------------------------------------------------------------------
updateVersionFiles() {

# need to substitute {{ tz_environment.uuid_label }} with USER_NAMESPACE
# need to substitute {{ ibm.ingress }} with ibm.ingress from mkdocs.yaml
# need to substitute {{ aws.ingress }} with aws.ingress from mkdocs.yaml

# yq is old in IBM Cloud shell so just using grep to get the ingress values  from MKDOCS

IBM_INGRESS=`grep ingress.*ibm mkdocs.yml | cut -f2 -d':'| sed -e "s/^ *//g"`
IBM_INGRESS=${IBM_INGRESS##*( )}
AWS_INGRESS=`grep ingress.*aws mkdocs.yml | cut -f2 -d':'| sed -e "s/^ *//g"`
AWS_INGRESS=${AWS_INGRESS##*( )}

	for yamlBaseName in ${VERSIONS[@]}
	do
		echo "Updating ${yamlBaseName}.yaml"
		mv ${yamlBaseName}.yaml ${yamlBaseName}.yaml.orig
	  sed -e "s/{{ tz_environment.uuid_label }}/${USER_NAMESPACE}/g" -e "s/{{ ibm.ingress }}/${IBM_INGRESS}/g" -e "s/{{ aws.ingress }}/${AWS_INGRESS}/g" ${yamlBaseName}.yaml.orig > ${yamlBaseName}.yaml
	done
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

# download all YAML files for versions and mkdocs.yml
echo
yesno "Do you want to retrieve all the YAML files from the git repository (${GITREPO_RAW_URL_BASE}) (y|n)? " && getAllYAMLFiles || echo "Skipping download of YAML files."

echo
yesno "Sync RBAC credentials? (y|n)? " && syncRBAC || echo "Skipping RBAC sync."

# verify the users configuration actually exists
echo
yesno "Verify your configuration exists (y|n)? " && verifyConfig || echo "Skipping configuration verification."

# get key values from mkdocs.yml
# perform string substitutions for all the yaml files based upon mkdocs values
echo
yesno "Subsititute all placeholders in YAML files (y|n)? " && updateVersionFiles || echo "Skipping string substituions in YAML files."


# add versions to config space
echo
yesno "Do you want to create the versions in your configuration (y|n)? " && createVersions || echo "Skipping version creations."

echo
yesno "Do you want to create the subscriptions in your configuration (y|n)? " && createSubscriptions || echo "Skipping subscription creations."


# add subscriptions to config space with specific versions

echo
# cleanup
yesno "Do you want to remove temporary files (y|n)? " && cleanup || echo "Skipping removal of temporary files."

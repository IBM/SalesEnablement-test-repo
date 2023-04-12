#!/bin/bash

####
#
# This script will accept a e-mail address and IBMid unique ID for that user and
# remove all automatically create resources and remove the users account
#
# Currently no error checking is done for any of the commands
#
####


####
#
# functions
#
####

####
#
# errorOut
#
####
function errorOut() {
	echo "Failure: $1"
	exit 1
}

#####
#
# remove_user()
# Remove user from the account
#
####
function remove_user() {

	#####
	#
	# remove user and set access-group
	# assuming TechZone will do the user invite/add so commented out next line
	#
	####

	# ibmcloud account user-remove USER_ID [-c, --account-id ACCOUNT_ID] [-f, --force] [-q, --quiet]

	echo Remove ${USERID}
	ibmcloud account user-remove ${USERID} -f  || errorOut "failed removing user: {$USERID}"

}



####
#
# remove_sat_resources()
# Create all the Satellite resources required
#	remove subscription
#	remove version
#	remove configuration
#
####
function remove_sat_resources() {


	###
	#
	# remove Namespace Subscription
	#
	###

	echo remove all sat subscriptions in this configuration
	# must remove  based upon subscription UUID as their can be multiple subscriptions with same name!
#	ibmcloud sat config get --config ${USER_NAMESPACE} --output json | jq -r '.subscriptions[].uuid' | while read subUUID
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

    echo removing ${USER_NAMESPACE}-sub
    ibmcloud sat subscription rm --subscription ${USER_NAMESPACE}-sub -f


	##
	## Do we need to sleep for some time til the clusters are
	## actually updated (namespaces/projects deleted?
	##

	###
	#
	# remove Namespace version
	#
	###


	echo remove all versions in this configurations
	#ibmcloud sat config version rm --config ${USER_NAMESPACE} --version ${USER_NAMESPACE} -f || errorOut "failed removing satellite config version for: {$USER_NAMESPACE}"
	ibmcloud sat config get --config ${USER_NAMESPACE} --output json | jq -r '.versions[].uuid' | while read verUUID
	do
		echo removing version: ${verUUID}
		ibmcloud sat config version rm --config ${USER_NAMESPACE} --version ${verUUID} -f
  done

	####
	#
	# remove Sat configuration
	#
	####

	echo Remove ${USER_NAMESPACE} satellite configuration

	ibmcloud sat config rm --config ${USER_NAMESPACE} -f # || errorOut "failed removing satellite configuration for: {$USER_NAMESPACE}"



}


####
#
# Main flow
#
####

####
#
# Currently expecting USERID (email address) and user's unique IBMid via command line
# we should do better command line processing here, but need to see what the terraform
# expectation is
#
####
export USERID=$1
export IBMUSERID=$2

# for testing
#export USERID=
#export IBMUSERID=

####
#
# using jq to parse json and get ibmUniqueID
#
# Note, the following doesn't need to be performed as the IBMUSER_ID (ibmUniqueId)
# will be passed in by the TechZone reservation system
#
# doesn't work here unless user has already accepted invitation to the Cloud account
#
####


#IBMUSERID=`ibmcloud account users --output json | jq --arg USERID $USERID -c '[ .[] | select ( .userId | contains($USERID)) |  (.ibmUniqueId) ]' |cut -d '"' -f 2`

####
#
# Set namespace variable
# useing unique IBMid less the "IBMid-" prefix and adding "-ns"
# convert to all lower case as namespaces in OpenShift must be lower case
#
####
USER_NAMESPACE=`echo ${IBMUSERID} | cut -d '-' -f 2`"-ns"
USER_NAMESPACE=${USER_NAMESPACE,,}


# echo $USERID $IBMUSERID $USER_NAMESPACE

remove_sat_resources
# it takes a little bit for the configurations and subscriptions to be deleted
# if we don't wait, the user can't be deleted
echo "Waiting for configurations to be removed"
sleep 30
# remove_user



exit 0

# remove user from access group
#ibmcloud iam access-group-user-remove GROUP_NAME USER_NAME

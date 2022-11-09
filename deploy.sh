#!/bin/bash

[[ -f ~/.bashrc ]] && source ~/.bashrc

#make sure to label the pods as node=app
#kubectl label node minikube-m02 node=app
minikube kubectl -- label node minikube-m02 node=app
minikube kubectl -- label node minikube-m03 node=app

#create /tmp/logs dir in worker nodes
# $(minikube ssh -n minikube-m02)
# $(mkdir -p /tmp/logs && exit)
# $(minikube ssh -n minikube-m03)
# $(mkdir -p /tmp/logs && exit)

function delploy () {
	declare -a files=(
		"./app-deployment.yaml" 
		"./zinc-search-statefulset.yaml" 
		"./filebeat-daemonset.yaml" 
		"./configs/filebeat-config.yaml"
		"./volumes/pvc.yaml"
		"./volumes/pv.yaml" 
		"./volumes/sc.yaml"
	)

	for file in "${files[@]}";
	do
		[[ -e $file ]] && echo "File ${file} found..." && minikube kubectl -- $1 -f ${file}
	done
}

if [[ $# -eq 0 ]]; then
	echo "No argument provided..."
	exit 1
elif [[ $1 == "apply" || $1 == "delete" ]]; then
	delploy $1
else
	echo "Please provide apply or delete as argument"
	exit 1
fi
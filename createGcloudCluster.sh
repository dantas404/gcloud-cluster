#!/bin/bash
echo "Be sure the JSON key is in the same directory as this script and the service account has the permissions needed"

gcloud auth login

read -p "Enter the project ID: " project_id
read -p "Enter the region: " region
read -p "Enter the zone: " zone
read -p "Enter the cluster name: " cluster_name

export TF_VAR_project_id=$project_id
export TF_VAR_region=$region
export TF_VAR_zone=$zone
export TF_VAR_cluster_name=$cluster_name

terraform init

terraform plan

terraform apply -var="project_id=${TF_VAR_project_id}" -var="region=${TF_VAR_region}" -var="zone=${TF_VAR_zone}" -var="cluster_name=${TF_VAR_cluster_name}" -auto-approve

echo "Cluster Up and Running!"
echo "run gcloud container clusters get-credentials [CLUSTER NAME] --zone [ZONE] --project [PROJECT ID]"
echo "run 'kubectl apply -f deployment.yaml' to deploy the app"
echo "run 'kubectl apply -f service.yaml' to deploy the service"
echo "run 'kubectl get service' to get the external IP address"
echo "Bye!"

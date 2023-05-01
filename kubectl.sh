#!/bin/bash

gcloud auth login

gcloud container clusters get-credentials $cluster_name --zone $zone --project $project_id

kubectl apply -f deployment.yaml

kubectl apply -f service.yaml

kubectl get svc
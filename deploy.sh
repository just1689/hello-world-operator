#!/bin/zsh
cd app-operator

kubectl create -f deploy/service_account.yaml
kubectl create -f deploy/role.yaml
kubectl create -f deploy/role_binding.yaml
kubectl create -f deploy/crds/app.example.com_appservices_crd.yaml
kubectl create -f deploy/operator.yaml

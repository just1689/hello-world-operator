#!/bin/zsh
kubectl delete -f deploy/crds/app.example.com_v1alpha1_appservice_cr.yaml
kubectl delete -f deploy/operator.yaml
kubectl delete -f deploy/role.yaml
kubectl delete -f deploy/role_binding.yaml
kubectl delete -f deploy/service_account.yaml
kubectl delete -f deploy/crds/app.example.com_appservices_crd.yaml
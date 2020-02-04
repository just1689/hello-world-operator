#!/bin/zsh
cd app-operator
kubectl create -f deploy/crds/app.example.com_v1alpha1_appservice_cr.yaml

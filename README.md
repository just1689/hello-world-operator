# Hello world operator

## How to use

## Build and push the app-operator image to a public registry such as quay.io
$ operator-sdk build <username>/app-operator

## Push image
$ docker push <username>/app-operator

## Update the operator manifest to use the built image name (if you are performing these steps on OSX, see note below)
$ sed -i 's|REPLACE_IMAGE|<username>/app-operator|g' deploy/operator.yaml
## On OSX use:
$ sed -i "" 's|REPLACE_IMAGE|<username>/app-operator|g' deploy/operator.yaml

## Setup Service Account
$ kubectl create -f deploy/service_account.yaml
## Setup RBAC
$ kubectl create -f deploy/role.yaml
$ kubectl create -f deploy/role_binding.yaml
## Setup the CRD
$ kubectl create -f deploy/crds/app.example.com_appservices_crd.yaml
## Deploy the app-operator
$ kubectl create -f deploy/operator.yaml

## Create an AppService CR
## The default controller will watch for AppService objects and create a pod for each CR
$ kubectl create -f deploy/crds/app.example.com_v1alpha1_appservice_cr.yaml

## Verify that a pod is created
$ kubectl get pod -l app=example-appservice
NAME                     READY     STATUS    RESTARTS   AGE
example-appservice-pod   1/1       Running   0          1m

## Test the new Resource Type
$ kubectl describe appservice example-appservice
Name:         example-appservice
Namespace:    myproject
Labels:       <none>
Annotations:  <none>
API Version:  app.example.com/v1alpha1
Kind:         AppService
Metadata:
  Cluster Name:        
  Creation Timestamp:  2018-12-17T21:18:43Z
  Generation:          1
  Resource Version:    248412
  Self Link:           /apis/app.example.com/v1alpha1/namespaces/myproject/appservices/example-appservice
  UID:                 554f301f-0241-11e9-b551-080027c7d133
Spec:
  Size:  3

## Cleanup
$ kubectl delete -f deploy/crds/app.example.com_v1alpha1_appservice_cr.yaml
$ kubectl delete -f deploy/operator.yaml
$ kubectl delete -f deploy/role.yaml
$ kubectl delete -f deploy/role_binding.yaml
$ kubectl delete -f deploy/service_account.yaml
$ kubectl delete -f deploy/crds/app.example.com_appservices_crd.yaml
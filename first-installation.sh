#!/bin/bash
cd 1.1-argocd-installation-manual-steps

kubectl apply -f 1-argo-ns.yaml

echo Waiting 30 seconds for ArgoCD Operator to come up, if the following step fails with the
echo error of \"no matches for kind ArgoCD\" then reload the \"5-argo-cluster.yaml\" file manually
echo using \"kubectl apply -f 5-argo-cluster.yaml\".

sleep 30

kubectl apply -f 5-argo-cluster.yaml
kubectl apply -f 6-argocd-cluster-admin.yaml
kubectl apply -f 7-security-contraint.yaml

echo Waiting 60 seconds for ArgoCD to come up
sleep 60

cd ..
kubectl apply -f 1.2-argocd-self-gitops/

sleep 1

### for the initial concurrency issue
kubectl apply -f 2-namespaces/
sleep 1
kubectl apply -f 3-permissions/
sleep 1



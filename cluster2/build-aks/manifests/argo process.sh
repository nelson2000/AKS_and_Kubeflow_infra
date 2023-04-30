 
To install non-highly available
------------------------------

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.6.6/manifests/install.yaml


  To install highly available argocd
  ----------------------------------

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.6.6/manifests/ha/install.yaml



  To install Argocli
  ---------------

 wget https://github.com/argoproj/argo-cd/releases/download/v2.6.6/argocd-linux-amd64

 sudo mv argocd-linux-amd64 /usr/bin/argocd

 install for kubeflow
 ---------------------

 be in the download folder
 -----------------------

 kustomize build argocd/base | kubectl apply -f -

  kubectl edit svc/argocd-server -n argocd

  kubectl get svc/argocd-server -n argocd -o yaml

  change the type from ClusterIP to LoadBalance
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
  kubectl get svc/argocd-server -n argocd  --> to get the load balancer ip addrss

  use that to launch on the browser

  username is admin
  password --> kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

  cli login
  -------

  argocd login <ARGOCD_SERVER>


  user admin
  password kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

  to update password

  argocd account update-password

  
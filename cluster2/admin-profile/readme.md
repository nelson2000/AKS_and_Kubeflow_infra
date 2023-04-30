kubectl get configmap dex -n auth -o yaml > dex1.yaml
kubectl get configmap dex -n auth -o jsonpath='{.data.config\.yaml}' > dex2.yaml
https://appdevtools.com/bcrypt-generator
admin123 $2a$12$fW0/QWRh1m7.wS5iFxSohe6QKCWbaHTaPdziaBZPfhbg2/oACrX1i
admin $2a$12$xEjcZSisoFmjUPBYxEsQyeCusznyOkcR1X.AotiIucEwLuPZGPHa2
12341234 $2a$12$LNCDiZXgOMpbc1KB/FvSXeiC1CSy9bF4Pk7qlaRiPBO/s/kaU98kq
kubectl create configmap dex --from-file=config.yaml=dex2.yaml -n auth --dry-run=client -o yaml | kubectl apply -f -
kubectl rollout restart deployment dex -n auth
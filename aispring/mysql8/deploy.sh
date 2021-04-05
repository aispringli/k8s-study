kubectl delete -f mysql8-service.yaml
kubectl delete -f mysql8-master.yaml
kubectl delete -f mysql8-secret.yaml
kubectl delete -f mysql8-config.yaml
rm -rf /home/spring/data/k8s/mysql8/data

kubectl create -f mysql8-config.yaml
kubectl create -f mysql8-secret.yaml
kubectl create -f mysql8-master.yaml
kubectl create -f mysql8-service.yaml

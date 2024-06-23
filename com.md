ansible-playbook -i inventory wordpress.yml

terraform apply -lock=false



aws eks update-kubeconfig --region us-east-1  --name lu_cluster


kubectl get pods --namespace=nginx-ingress


kubectl apply -k ./

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/high-availability-1.21+.yaml

to use ..

 git clone https://github.com/kubernetes-incubator/metrics-server.git



kubectl get crds

kubectl  create secret tls wordpress-tls --key key.pem --cert cert.pem

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/cloud/deploy.yaml

kubectl get all -n ingress-nginx


-----




kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/high-availability-1.21+.yaml





 git clone https://github.com/kubernetes-incubator/metrics-server.git


curl -LO https://github.com/cert-manager/cert-manager/releases/download/v1.14.4/cert-manager.yaml
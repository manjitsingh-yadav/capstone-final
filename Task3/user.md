# 1.
sudo useradd -m manjit -s /bin/bash

# 2.
sudo passwd manjit

# 3.
cd /home/manjit/

# 4.
sudo openssl genrsa -out manjit.key 2048

# 5.
sudo openssl req -new -key manjit.key -out manjit.csr -subj "/CN=manjit"

# 6.
sudo openssl x509 -req -in manjit.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out manjit.crt -days 500

# 7.
sudo mkdir .certs

# 8.
sudo mv manjit.key .certs/

sudo mv manjit.crt .certs/

# 9.
kubectl config set-credentials manjit --client-certificate=/home/manjit/.certs/manjit.crt --client-key=/home/manjit/.certs/manjit.key

kubectl config set-context manjit-context --cluster=kubernetes --user=manjit

# 10.
sudo mkdir .kube

sudo cp ~/.kube/config /home/manjit/.kube/

sudo chown -R manjit: /home/manjit/

# 11. Create corresponding cluster role and cluster role-binding
kubectl auth can-i create pod --as manjit

kubectl auth can-i create secrets --as manjit

# 12.
su manjit

kubectl config use-context manjit-context


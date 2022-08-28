echo ${KUBERNETES_CA} | base64 --decode > udagram-ca.pem
echo ${KUBERNETES_CLIENT_CA} | base64 --decode > udagram-client-ca.pem
echo ${KUBERNETES_CLIENT_KEY} | base64 --decode > udagram-key.pem
kubectl config set-cluster udagram --server=${KUBERNETES_ENDPOINT} --certificate-authority=udagram-ca.pem
kubectl config set-credentials -admin --client-certificate=udagram-client-ca.pem --client-key=udagram-key.pem
kubectl config set-context -admin@udagram --cluster=udagram --namespace=default --user=admin
kubectl config use-context -admin@udagram
kubectl rollout restart deployment frond-end
param (
    $K8S_CONTEXT_NAME =    "cluster1",
    $K8S_CLUSTER_NAME =    "cluster1-cluster",
    [Parameter(Mandatory)] $K8S_CLUSTER_SERVER,
    [Parameter(Mandatory)] $K8S_CLUSTER_CERT,
    $K8S_USER_NAME    =    "cluster1-sa",
    [Parameter(Mandatory)] $K8S_USER_TOKEN,
    $K8S_NAMESPACE    =    "cms1"
)

kubectl config view
kubectl config set-cluster     $K8S_CLUSTER_NAME
kubectl config set    clusters.$K8S_CLUSTER_NAME.server                     $K8S_CLUSTER_SERVER
kubectl config set    clusters.$K8S_CLUSTER_NAME.certificate-authority-data $K8S_CLUSTER_CERT
kubectl config set-credentials $K8S_USER_NAME    --token=$K8S_USER_TOKEN
kubectl config set-context     $K8S_CONTEXT_NAME --user=$K8S_USER_NAME --cluster=$K8S_CLUSTER_NAME --namespace=$K8S_NAMESPACE
kubectl config use-context     $K8S_CONTEXT_NAME
kubectl config view

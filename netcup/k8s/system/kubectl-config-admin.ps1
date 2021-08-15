# setup cluster access in kubectl config
param (
    $contextName = "admin@netcup",
    $namespace   = "default",
    $clusterName = "netcup",
    $userName = "netcup-admin",
    [Parameter(Mandatory)] $clusterIp,    # eg. $(cat secrets/kubeconfig-ip.url)
    [Parameter(Mandatory)] $clusterCert,  # eg. $(cat secrets/kubeconfig-cert.crt)
    [Parameter(Mandatory)] $userToken     # eg. $(cat secrets/kubeconfig-token-admin.jwt)
)

kubectl config set-cluster     $clusterName
kubectl config set    clusters.$clusterName.server                     $clusterIp
kubectl config set    clusters.$clusterName.certificate-authority-data $clusterCert
kubectl config set-credentials $userName    --token=$userToken
kubectl config set-context     $contextName --user=$userName --cluster=$clusterName --namespace=$namespace
kubectl config use-context     $contextName
kubectl config view
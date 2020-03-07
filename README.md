# docker-build-tool for dind
Dcoker / AWS CLI / Kubectl / Helm

# K8S command env requirements
    K8S_API_URL : Kubernetes Cluster API URL
    K8S_CLUSTER_NAME : Kubernetes Cluster Name
    K8S_CA_DATA : Kubernetes Cluster Certificate Authority Data Token
    K8S_SA_TOKEN : Kubernetes Cluster Service Account Token
    K8S_USER : Kubernetes K8S_SA_TOKEN User

# DOCKER_PUSH_TO_ECR command env requirements
    AWS_ACCOUNT_ID : AWS Account ID (number)
    AWS_REGION : Region (ap-northeast-2)
    CONTAINER_REGISTRY : AWS ECR Reristry (111111.dkr.ecr.ap-northeast-2.amazonaws.com)
    CONTAINER_IMAGE : Docker image name (test)
    CONTAINER_IMAGE_TAG : Docker image tag (0.0.1)

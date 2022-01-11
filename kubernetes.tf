provider "kubernetes" {
  host                   = aws_eks_cluster.cluster.endpoint
  token                  = aws_eks_cluster.cluster.token
  cluster_ca_certificate = base64decode(aws_eks_cluster.cluster.certificate_authority.0.data)
}
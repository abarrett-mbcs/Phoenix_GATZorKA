terraform {
  required_providers {
    k3d = {
      source  = "pvotal-tech/k3d"
      version = "0.0.7" # Check for the latest version!
    }
  }
}

provider "k3d" {}

resource "k3d_cluster" "phoenix" {
  name    = "phoenix-cluster"
  servers = 1
  agents  = 2

  # THIS IS THE MAGIC LINE
  kubeconfig {
    update_default_kubeconfig = true
    switch_context            = true
  }

  # This ensures your 2011 MacBook can talk to the cluster locally
  kube_api {
    host_ip   = "127.0.0.1"
    host_port = 6443
  }

  # Extra settings to make it "Ready for Work"
  k3d {
    disable_load_balancer = false
    # disable_image_handler = false
  }
  
  # This makes sure k3d uses a specific version of k3s
  image = "rancher/k3s:v1.27.4-k3s1"
}

# Phoenix_GATZorKA - References/Resources

Here are some resources to help you in this arena*.

☸️ K3d & Kubernetes

Since K3d is just a wrapper that runs K3s (a lightweight Kubernetes) inside Docker, you actually need two sets of docs.

[Official Documentation](https://k3d.io/ K3d): This is where you go to learn how to map ports (like that :8080 to :80 mapping), create multi-node clusters, and manage your local registry.

[Kubernetes Official Documentation](https://kubernetes.io/docs/home/): This is the "Bible."

[Focus here](https://kubernetes.io/docs/concepts/): The Concepts Section. If you want to understand why a Service isn't finding Pods, read the "Service" and "Labels and Selectors" pages.

[The Interactive Tutorial (Killercoda)](https://killercoda.com/playgrounds/kubernetes/k3s): If you want to break things in a sandbox that isn't your own machine.



⛵ Helm (The Package Manager)

Helm can be confusing because it’s both a command-line tool and a templating engine.

[Helm Introduction & Quickstart](https://helm.sh/docs/intro/quickstart/): Start here to understand the lifecycle of a "Release."

[The Chart Template Guide](https://helm.sh/docs/chart_template_guide/getting_started/): This is the most important link for you. It explains how {{ .Values.replicaCount }} actually works and how to use functions like upper, lower, and default.

[Artifact Hub](https://artifacthub.io/): This is the "App Store" for Kubernetes. If you want to see how the pros write charts (like the official Nginx or Bitnami charts), look them up here.



🤖 Ansible (The Orchestrator)

Since you are using Ansible to drive Kubernetes, you need the documentation for the specific "Collections" that talk to the cluster.

[Ansible User Guide](https://docs.ansible.com/ansible/latest/user_guide/index.html): For general syntax, loops, and variables.

[kubernetes.core.k8s module](https://www.google.com/search?q=https://docs.ansible.com/ansible/latest/collections/kubernetes/core/k8s_module.html): Documentation for the task you used to create the Service and Ingress.

[kubernetes.core.helm module](https://docs.ansible.com/ansible/latest/collections/kubernetes/core/helm_module.html): Documentation for the task that triggered your phoenix-release.

Note: Check the "Parameters" section here to see how to pass values and kubeconfig correctly.



* provided by Google Gemini

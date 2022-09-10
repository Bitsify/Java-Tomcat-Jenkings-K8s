Install following two plugin
Maven Integration plugin
Docker Pipeline

And Install docker and Ansible on Jenkins server (You can also create a seperate server for docker and Ansible)
But Here we'll use same server for all (Jenkins, docker and ansible)

stablish ssh connection from jenkins server to k8s master. Use jenkins user to create ssh connection
configure ansible in order to execute playbook on k8s master node from jenkins server

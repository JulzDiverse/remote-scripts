#!/bin/bash

main(){
   printf "\\n:::::Installing OS dependencies"
   install_os_deps

   printf "\\n:::::Installing vbox"
   install_vbox

   printf "\\n:::::Installing docker"
   install_docker

   printf "\\n:::::Installing bosh"
   install_bosh

   printf "\\n:::::Installing cf cli"
   install_cf_cli

   printf "\\n:::::Installing kubectl"
   install_kubectl

   printf "\\n:::::Installing minikube"
   install_minikube

   printf "\\n:::::Installing ruby"
   install_ruby
}

install_os_deps(){
    apt-get update && apt-get upgrade && apt-get dist-upgrade
    apt-get install build-essential dkms unzip wget curl git software-properties-common
}

install_vbox(){
   add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
   wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
   apt-get update
   apt-get install virtualbox-5.2
   VBoxManage -v
}

install_docker(){
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
   add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

   apt-get update
   apt-cache policy docker-ce
   apt-get install -y docker-ce
   systemctl status docker
}

install_bosh(){
   wget https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-3.0.1-linux-amd64 -O /usr/local/bin/bosh && chmod +x /usr/local/bin/bosh
   bosh -v
}

install_cf_cli(){
   wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
   echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
   apt-get update
   apt-get install cf-cli
   cf -v
}

install_kubectl(){
  apt-get update && apt-get install -y apt-transport-https
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
  touch /etc/apt/sources.list.d/kubernetes.list
  echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
  apt-get update
  apt-get install -y kubectl
}

install_minikube(){
   curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.28.0/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
}

install_ruby(){
  apt install ruby
}

main

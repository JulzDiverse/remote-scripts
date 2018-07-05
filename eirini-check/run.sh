#!/bin/bash

main(){
  check_minikube
	check_kubectl
	check_ruby
	check_go
	check_bosh
	check_cf
	check_vbox
}

check_minikube(){
  which minikube
	verify_exit_code $? "minikube is not installed or not in path!"

	minikube ip
	message_on_success $? "minikube is already running. It should be fine but you should delete the existing one or shut it down"
}

check_kubectl(){
  which kubectl
	message_on_error $? "kubectl not installed or not in path"
}

check_ruby(){
  ruby --version
	error_code=$?
	message_on_error $error_code "ruby not installed or not in path"
	message_on_success $error_code "you should have installed ruby version 2.4"
}

check_go(){
  go --version
	message_on_error $? "go not installed or not in path"
}

check_bosh(){
  which bosh
	message_on_error $? "bosh not installed or not in path. If you use bosh as bosh2 you should alias it to bosh"
}

check_cf(){
  which cf
	message_on_error $? "cf not installed or not in path."
}

check_vbox(){
  which vboxmanage
	message_on_error $? "virtual box not installed or not in path"
}


message_on_error() {
  local exit_code=$1
  local error_msg=$2
  if [ "$exit_code" -ne 0 ]; then
    echo "$error_msg"
  fi
}

message_on_success() {
  local exit_code=$1
  local error_msg=$2
  if [ "$exit_code" -eq 0 ]; then
    echo "$error_msg"
  fi
}

main

#!/bin/bash

main(){
	echo "*****CHECKING MINIKUBE*****"
  check_minikube
	echo

	echo "*****CHECKING KUBECTL*****"
	check_kubectl
	echo

	echo "*****CHECKING RUBY*****"
	check_ruby
	echo

	echo "*****CHECKING GO*****"
	check_go
	echo

	echo "*****CHECKING BOSH*****"
	check_bosh
	echo

	echo "*****CHECKING CF*****"
	check_cf
  echo

	echo "*****CHECKING VBOX*****"
	check_vbox
}

check_minikube(){
  which minikube
	local error_code
	message_on_error $error_code "minikube is not installed or not in path!"
	message_on_success $error_code ":::: OK"
}

check_kubectl(){
  which kubectl
	local error_code=$?
	message_on_error $error_code "kubectl not installed or not in path"
	message_on_success $error_code ":::: OK"
}

check_ruby(){
  ruby --version
	local error_code=$?
	message_on_error $error_code "ruby not installed or not in path"
	message_on_success $error_code ":::: OK -> just make sure you have ruby 2.4 installed"
}

check_go(){
  go version
	local error_code=$?
	message_on_error $error_code "go not installed or not in path"
	message_on_success $error_code ":::: OK"
}

check_bosh(){
  which bosh
	local error_code=$?
	message_on_error $error_code "bosh not installed or not in path. If you use bosh as bosh2 you should alias it to bosh"
	message_on_success $error_code ":::: OK"
}

check_cf(){
  which cf
	local error_code=$?
	message_on_error $error_code "cf not installed or not in path."
	message_on_success $error_code ":::: OK"
}

check_vbox(){
  which vboxmanage
	local error_code=$?
	message_on_error $error_code "virtual box not installed or not in path"
	message_on_success $error_code ":::: OK"
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

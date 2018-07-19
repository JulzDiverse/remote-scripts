#!/bin/bash

cf create-org "$1"
cf target -o "$1"
cf create-space dev
cf target -s dev

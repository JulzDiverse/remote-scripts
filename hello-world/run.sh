#!/bin/bash

if [ -z "$1" ]; then
	greet="World"
else
	greet="$1"
fi

echo "Hello, $greet!"

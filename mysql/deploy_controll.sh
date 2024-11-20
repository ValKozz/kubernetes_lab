#!/bin/bash

command=$1
dir=$(pwd)

format="*.yaml"

if [ -z "$command" ]; then
    echo "USAGE:"
    echo "  delete -> Delete resources from file"
    echo "  apply  -> Apply resources from YAML files"
    exit 1
fi

for file in $dir/$format; do
    if [ -f "$file" ]; then
        microk8s kubectl $command -f "$file"
    else
        echo "No YAML files found in current directory."
        exit 1
    fi
done


#!/bin/bash

ansible-playbook build.yml
grep failed=0 build.out | grep unreachable=0 >/dev/null

if [ "$?" == "0" ]; then
    # if all looks good, give it a go
    echo "Build completed successfully. Starting the project..."
    ansible-container run -d --production
 else
    cat build.out
 fi 

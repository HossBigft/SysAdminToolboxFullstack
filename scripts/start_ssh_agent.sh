#!/bin/bash
eval $(ssh-agent -s) && grep -slR "PRIVATE" ~/.ssh/ | xargs ssh-add &> /dev/null
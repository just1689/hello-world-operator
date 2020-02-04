#!/bin/zsh
cd app-operator
operator-sdk build just1689/app-operator
docker push just1689/app-operator

#!/usr/bin/env bash

log_dir=log

log=$1

working_dir=`pwd`


#Get namesapce variable
tenant=`awk '{print $NF}' $working_dir/tenant_export`


# Master pod
pod=$(kubectl get po -n $tenant | grep jmeter-master | awk '{print $1}')
kubectl cp $tenant/$pod:/$log-log.jtl $working_dir/$log_dir/$log/log.jtl
kubectl cp $tenant/$pod:/$log-report $working_dir/$log_dir/$log/report


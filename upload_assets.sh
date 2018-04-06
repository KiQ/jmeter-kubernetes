#!/usr/bin/env bash

working_dir=`pwd`

#Get namesapce variable
tenant=`awk '{print $NF}' $working_dir/tenant_export`

read -p 'Enter the path to the file or directory that upload to the $JMETER_HOME/bin ' tgt

if [ ! -e "$tgt" ];
then
    echo "File (or directory) was not found in PATH"
    echo "Kindly check and input the correct path"
    exit
fi

# Master
# ===============================
pod=$(kubectl get po -n $tenant | grep jmeter-master | awk '{print $1}')

echo "========== $pod =========="
jmeter_home=$(kubectl exec -n $tenant $pod -- sh -c 'echo $JMETER_HOME')

kubectl cp $tgt -n $tenant $pod:$jmeter_home/bin/
# kubectl exec -n $tenant $pod -- ls -la $jmeter_home/bin/


# Slave
# ================================
pods=$(kubectl get po -n $tenant | grep jmeter-slave | awk '{print $1}')

arr=( `echo $pods | tr -s '\n' ' '`)

for i in `seq 1 ${#arr[@]}`; do
	pod=${arr[$i-1]}

	echo "========== $pod =========="
	jmeter_home=$(kubectl exec -n $tenant $pod -- sh -c 'echo $JMETER_HOME')

	kubectl cp $tgt -n $tenant $pod:$jmeter_home/bin/
done



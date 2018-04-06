# jmeter-kubernetes

## Deployment

### Make the scripts executable and launch jmeter_cluster.sh to start the deployment

	$ chmod +x jmeter_cluster.sh dashboard.sh start_test.sh
	$ ./jmeter_cluster.sh 

### N.B — Wait until all the pods are up and running before continuing

	$ kubectl get -n kubernauts po
	NAME                               READY     STATUS    RESTARTS   AGE
	influxdb-jmeter-5cbd7b8469-mbvtg   1/1       Running   0          4m
	jmeter-grafana-65dd5f6b79-lzjqm    1/1       Running   0          4m
	jmeter-master-75f66dbb5f-264bs     1/1       Running   0          4m
	jmeter-slaves-57cc6b9cfc-b877l     1/1       Running   0          4m
	jmeter-slaves-57cc6b9cfc-plssn     1/1       Running   0          4m

### Launch the dashboard script

	$ ./dashboard.sh 
	Creating Influxdb jmeter Database
	Creating the Influxdb data source
	{"datasource":{"id":1,"orgId":1,"name":"jmeterdb","type":"influxdb","typeLogoUrl":"","access":"proxy","url":"http://jmeter-influxdb:8086","password":"admin","user":"admin","database":"jmeter","basicAuth":false,"basicAuthUser":"","basicAuthPassword":"","withCredentials":false,"isDefault":true,"secureJsonFields":{},"version":1,"readOnly":false},"id":1,"message":"Datasource added","name":"jmeterdb"}

### Start the load testing by executing start_test.sh script
N.B — You need to provide a jmeter test script

	$ ./start_test.sh 


## From
Please follow the guide "Load Testing As A Service With Jmeter On Kubernetes" via medium:

https://goo.gl/mkoX9E

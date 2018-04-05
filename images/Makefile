
build:
	docker build -t kiqgs/jmeter-base  -f Dockerfile-base .
	docker build -t kiqgs/jmeter-slave -f Dockerfile-slave .
	docker build -t kiqgs/jmeter-master -f Dockerfile-master .

push:
	docker push kiqgs/jmeter-slave
	docker push kiqgs/jmeter-master

SHELL=/bin/bash

all: deploy

deploy: export OP=create
deploy:
	@kubectl ${OP} -f ./pv_nfs.yaml
	@kubectl ${OP} -f ./pvc_nfs.yaml
	@kubectl ${OP} -f ./pvjob.yaml


clean: export OP=delete
clean:
	@kubectl ${OP} -f ./pvjob.yaml
	@kubectl ${OP} -f ./pvc_nfs.yaml
	@kubect; ${OP} -f ./pv_nfs.yaml

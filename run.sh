#!/bin/sh
docker run --rm -p 8081:8080 \
	-v $PWD/helium:/zeppelin/helium \
	-v $PWD/conf:/zeppelin/conf \
	-v $PWD/data:/zeppelin/data \
	-v $PWD/logs:/zeppelin/logs \
	-v $PWD/notebook:/zeppelin/notebook \
	-e ZEPPELIN_LOG_DIR='/zeppelin/logs' \
	-e ZEPPELIN_NOTEBOOK_DIR='/zeppelin/notebook' \
	-e ZEPPELIN_HELIUM_LOCALREGISTRY_DEFAULT='/zeppelin/helium' \
	--name zeppelin apache/zeppelin:0.7.3

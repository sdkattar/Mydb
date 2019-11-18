#!/bin/bash

if [$( docker container ls -q --filter name=mydb)!='']; then
# sudo docker container stop mydb_c
docker container rm mydb --force
fi

if [$(docker image ls -q --filter reference=mydb)!='']; then
 docker image rm mydb
fi

 docker image build . -t mydb

 docker container run -itd -p 3307:3306 --name mydb mydb

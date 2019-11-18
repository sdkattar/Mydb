#!/bin/bash

if [$(sudo docker container ls -q --filter name=mydb)!='']; then
# sudo docker container stop mydb_c
sudo docker container rm mydb --force
fi

if [$(sudo docker image ls -q --filter reference=mydb)!='']; then
sudo docker image rm mydb
fi

sudo docker image build . -t mydb

sudo docker container run -itd -p 3307:3306 --name mydb mydb

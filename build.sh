#!/bin/bash


src_dir=$(pwd)
workspace=$src_dir/..

cd $workspace || true
docker build -t web_vnc:latest -f $src_dir/Dockerfile .


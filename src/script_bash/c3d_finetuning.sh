#!/bin/bash


SOLVER_FILE=$1
NUM_GPUS=$2
WEIGHTS=$3

mkdir -p LOG_TRAIN

source /etc/profile.d/modules.sh
module load cuda/8.0
module load cudnn/5.1-cuda-8.0

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/data/sparks/share/nccl-master/lib

CAFFE_HOME=$4

ONE=1
NUM_GPUS=$((NUM_GPUS-ONE))

for i in `seq 0 $NUM_GPUS`;
do
    GPUS=$GPUS,$i
done
GPUS=${GPUS:1}



GLOG_log_dir="./LOG_TRAIN" $CAFFE_HOME/build/tools/caffe.bin train --solver=${SOLVER_FILE} --weights=$WEIGHTS --gpu=$GPUS

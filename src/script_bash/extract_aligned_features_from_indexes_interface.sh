#!/bin/bash

INPUT_FOLDER=$1
ALIGNMENT_FOLDER=$2
OUTPUT_FOLDER=$3

class_nb=$(ls $INPUT_FOLDER | wc -l)

for class in $(seq -w $class_nb);
do
    echo $class
    mkdir -p $OUTPUT_FOLDER/$class ;
    python src/python/extract_aligned_features_from_indexes_parallel.py ${INPUT_FOLDER}/$class/ "$ALIGNMENT_FOLDER/${class}.csv" $OUTPUT_FOLDER/$class/
done

#!/bin/sh
python3 strip_directives.py $1
python3. kernel_info_generator.py $1 $2
python3 source_info_generator.py $1 $2
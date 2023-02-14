#!/bin/sh
python3 StripDirectives.py $1
python3 LLVM_Analysis.py $1 $2
python3 SourceInfoGenerator.py $1 $2
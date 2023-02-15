#!/bin/sh
PATH_TO_LLVM_PASSES=/llvm-project/llvm/lib/Passes/
PATH_TO_LLVM_TRANSFORMS=/llvm-project/llvm/lib/Transforms/Utils/
PATH_TO_LLVM_HEADERS=/llvm-project/llvm/include/llvm/Transforms/Utils/

echo "\n\n=========== SETUP =========== "
echo "Path to LLVM = $path_to_llvm"
echo "PATH_TO_LLVM_PASSES = $PATH_TO_LLVM_PASSES"
echo "PATH_TO_LLVM_TRANSFORMS = $PATH_TO_LLVM_TRANSFORMS"
echo "PATH_TO_LLVM_HEADERS = $PATH_TO_LLVM_HEADERS"

echo "\n... copying files"

cp custom_opt_passes/inlined_explorer.h $PATH_TO_LLVM_HEADERS
cp custom_opt_passes/loop_analysis.h $PATH_TO_LLVM_HEADERS
cp custom_opt_passes/inlined_explorer.cpp $PATH_TO_LLVM_TRANSFORMS
cp custom_opt_passes/loop_analysis.cpp $PATH_TO_LLVM_TRANSFORMS

cp llvm_cmake_files/CMakeLists.txt $PATH_TO_LLVM_TRANSFORMS
cp llvm_cmake_files/PassBuilder.cpp $PATH_TO_LLVM_PASSES
cp llvm_cmake_files/PassRegistry.def $PATH_TO_LLVM_PASSES

echo "DONE!"


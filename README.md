# HLS Analysis Tools

This project aims to analyse synthesisable HLS code by extracting relevant information from loops (e.g nesting level, tripcount), array declarations (e.g dimensions, size of each dimension) and total operations (LLVM operations during execution of a given top-level function). Analysis is performed by using various components from the LLVM toolchain, such as **clang/clang\++** to compile to LLVM IR, **opt** to extract information from LLVM IR and **libclang** to locate points of interest in a given source code.

## Installation

Setting up the environment is easy through docker

```bash
docker build -t hls_analysis_tools .
```

This will setup the necessary build tools, libraries and compile LLVM from source inside an Ubuntu docker image.

Navigate to the ```HLSAnalysisTools``` directory and start the docker image by running

```bash
docker run -it -v $(pwd):/tool hls_analysis_tools
```


Compile the **libclang** parser by typing

```bash
cd tool
make -f makefiles/makefile_libclang_parser parser
```

Give the scripts execution privileges by typing

```bash
chmod +x analysis_tool.sh
chmod +x llvm_setup.sh
```

The setup is now complete.

**Note:** The makefiles in this project make heavy use of the Xilinx header files and libraries. These may need to be modified to point to new directories if their location differs from the one specified in the makefiles.

## Execution

Start the docker image and mount the required Xilinx libraries by typing

```bash
docker run -it -v $(pwd):/tool hls_analysis_tools -v /opt/xilinx:/opt/xilinx -v /opt/Xilinx:/opt/Xilinx -v /tools/Xilinx:/tools/Xilinx
```

You can also mount any necessary external volumes at this point. Then copy the required files and recompile LLVM by typing

```bash
./llvm_setup.sh
cd /llvm-project/build
make -j 4
```

## Example

A given code can by analysed by typing
```
./analysis_tool.sh <filename> <top_level_function>
```

For example, analyse the given example in ```examples/example0.c``` by typing

```bash
./analysis_tool.sh examples/example0.c top_level_function
```

Once analysis is complete the files ```examples/kernel_info.txt``` and ```examples/src_info.json``` will be created.
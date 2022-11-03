PROTOS = common
PROTOS += store

TOP_DIR = $(shell /bin/pwd)
PB_OUT_DIR = $(TOP_DIR)/example_grpc

PB_DIR = $(TOP_DIR)/../proto
ifeq ("$(wildcard $(PB_DIR))", "")
	PB_DIR = $(TOP_DIR)/..
endif

PY_OUT = $(foreach proto,$(PROTOS),$(PB_OUT_DIR)/$(proto).pb.py)

$(PB_OUT_DIR)/%.pb.py: $(PB_DIR)/%.proto
	if [ ! -d $(PB_OUT_DIR) ]; then mkdir $(PB_OUT_DIR); fi
	python3 -m grpc_tools.protoc \
		--proto_path=$(PB_DIR) \
		--python_out=$(PB_OUT_DIR) \
		--grpc_python_out=$(PB_OUT_DIR) \
		$^

all: build test

py_proto: $(PY_OUT)

build: py_proto

test: build
	/bin/sh test_import.sh

clean:
	rm -f $(PB_OUT_DIR)/*.py $(PB_OUT_DIR)/*.pyc

DOCKER?=docker
HOST_HW_NAME = $(shell uname -m)
ifeq ($(HOST_HW_NAME), arm64)
BUILD_CONTAINER_TARGET = --platform linux/x86_64
else
BUILD_CONTAINER_TARGET =
endif

build:
	$(DOCKER) build \
		$(BUILD_CONTAINER_TARGET) \
		-t $(USER)/protocolbuffers-issue-1015:protobuf-python \
		--no-cache \
		-f build/Dockerfile \
		.

clean:
	make -C examples clean

all: build

.PHONY: build clean

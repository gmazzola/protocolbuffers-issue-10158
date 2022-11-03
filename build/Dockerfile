FROM debian:bullseye-slim as example-protobuf

ARG SRC_DIR=/protobufs
ARG EXAMPLES_DIR=/protobufs/examples

RUN apt-get -y update
RUN apt-get -y install \
    protobuf-compiler \
    make

RUN mkdir -p $SRC_DIR
COPY ./ $SRC_DIR
RUN make -C $SRC_DIR clean

# ----------------------------------------------------------------------------
FROM example-protobuf AS python-build

ARG EXAMPLES_DIR=/protobufs/examples

RUN apt-get -y install \
    python3 \
    pip

RUN python3 -m pip install --user \
    grpcio==1.50.0 \
    grpcio-tools==1.50.0 \
    protobuf==4.21.9

RUN make -C $EXAMPLES_DIR all

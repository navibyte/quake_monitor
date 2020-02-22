# Copyright 2020 Navibyte (https://navibyte.com). All rights reserved.
# Use of this source code is governed by a MIT-style license, see the LICENSE.

# Makefile to init project and generate gRPC stub for QuakeService.

# Dependencies (tools must be available on the path):
# - protoc (Protocol Buffer v3)
# - protoc-gen-dart (protoc compiler extension for Dart)
#
# That is install Dart 2.0 or higher, gRPC, Protocol Buffers v3 and protoc plugin 
# for Dart according to: https://grpc.io/docs/quickstart/dart/
# Dart package protoc_plugin must be installed using pub.
# See also: https://github.com/protocolbuffers/protobuf/releases

# Please note also that this Makefiles assumes that you
# have following repositories locally under the same root:
# * quake (=> https://github.com/navibyte/quake)
#   * api/v1 (proto files here)
# * quake_monitor (=> https://github.com/navibyte/quake_monitor)
#   * api (this project)
#     * Makefile (use this to *make* code generation)
#     * lib/src/quake/api/v1 (dart code is generated here)

# This is parent folder for quake and quake_monitor repositories locally
PROTOS=../..

# Input protos from the quake repository
INPUT=$(PROTOS)/quake/api/v1
PROTO_FILES=$(INPUT)/quake.proto $(INPUT)/quake_api.proto

# Dart output on the quake_monitor repository
DART_OUT=$(PROTOS)/quake_monitor/api/lib/src
DART_OUTFILE=$(DART_OUT)/quake/api/v1/quake.pb.dart

# default target
all: stub

# Generate Dart stubs 
# (more about Dart plugin => https://pub.dev/packages/protoc_plugin)
stub: $(DART_OUTFILE)
$(DART_OUTFILE): $(PROTO_FILES)
	mkdir -p $(DART_OUT)
	protoc -I$(PROTOS) $(INPUT)/*.proto --dart_out=grpc:$(DART_OUT)


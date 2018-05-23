#!/usr/bin/env bash

# Author: Malisa Smith

# Replace with "python3" if you use python3 to access python v3.
PYTHON=python

# Download all the proto schema files into the schemas_proto folder
# First clean-up old files from previous runs
rm -rf schemas_proto/*

# Obtain the raw github url's if not raw already:
raw_schema_urls=$($PYTHON url_converter.py --getrawfromfile schema_urls)
for raw_url in ${raw_schema_urls};
do
    wget --timestamping --directory-prefix ./schemas_proto ${raw_url};
done

# Replace user-defined package imports with no path. This allows proto files to find each other.
# For example,     import "ga4gh/common.proto";       becomes       import "common.proto";
for proto_file in schemas_proto/*; do
    $($PYTHON clean_imports.py $proto_file)
done

# Generate descriptor_pb2.py with protoc:
protoc descriptor.proto --python_out=.

# convert .proto files into a serialized FileDescriptorSet for input into descriptor2uml.py
cd schemas_proto
protoc --include_source_info -o MyFileDescriptorSet.pb *
cd ../

# Make the dot file which describes the UML diagram. The type_header_comments file can be empty (or you can remove the option altogether)
$PYTHON descriptor2uml.py --descriptor ./schemas_proto/MyFileDescriptorSet.pb --dot uml.dot --urls schema_urls #--type_comments type_header_comments 

# Finally, draw the UMl diagram
dot uml.dot -T svg -o uml.svg

#! /usr/bin/python
import fileinput, sys

"""
Author: Orkun Duman

Replaces user-defined package imports with no path.

For example,
  import "ga4gh/common.proto";
  import "google/protobuf/type.proto";
    becomes
  import "common.proto";
  import "type.proto";
"""

def main(args):
    file_name = args[1]
    for line in fileinput.input(file_name, inplace=True):
        if line.startswith("import \""):
            last_index = line.rfind('/')
            if last_index >= 0 and "google/protobuf/" not in line:
                line = "import \"" + line[last_index+1:]
        sys.stdout.write(line)

if __name__ == "__main__" :
    sys.exit(main(sys.argv))

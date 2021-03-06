### schema-uml motivation

Avro and Protocol Buffers are schema-description languages. Schema files (e.g. [here](https://en.wikipedia.org/wiki/Protocol_Buffers#Example)) can be difficult to understand when there are lots of data structures and multiple files, so it is helpful to visualize the relationships between the data structures in a [UML diagram](https://en.wikipedia.org/wiki/Unified_Modeling_Language). Example: [here](https://cdn.rawgit.com/malisas/schema-uml/master/avro2uml/example_svgs/everything_edited_2016-03-13.svg)

### Contents of this directory

Adam Novak originally wrote code to visualize Avro schema files: [1](https://github.com/ga4gh/schemas/pull/297) and [2](https://github.com/adamnovak/schemas/tree/autouml2/scripts).

**avro2uml** builds on his original code to add in additional features like data clusters, clickable clusters, and some amount of automation.

**protobuf2uml** is the same idea, but using Protocol Buffers-described schemas instead of Avro.

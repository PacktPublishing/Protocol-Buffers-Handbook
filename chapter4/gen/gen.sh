# To use this script you need protoc-gen-go and protoc-gen-swift
# if you do not have them, comment the line for go and swift gen.
# Here is where to download the plugins:
#		swift: https://github.com/apple/swift-protobuf
#		go: https://protobuf.dev/reference/go/go-generated/

# TODO remove the experimental-codegen flag when rust generation is stable
#  if I forget about this, contribution is welcomed.

protoc --cpp_out=. 		\
			 --csharp_out=. \
			 --java_out=.		\
			 --kotlin_out=.	\
			 --objc_out=.		\
			 --php_out=.		\
			 --pyi_out=.		\
			 --python_out=.	\
			 --ruby_out=.		\
			 --rust_out=experimental-codegen=enabled,kernel=cpp:. \
			 --rust_out=experimental-codegen=enabled,kernel=upb:. \
			 --swift_out=.	\
			 --go_out=.			\
			 code_generation.proto
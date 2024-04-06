package main

import (
	"fmt"

	"google.golang.org/protobuf/encoding/prototext"

	pb "github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter10/bazel/proto"
	pbV1 "github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter10/bazel/proto/v1"
)

func main() {
	fmt.Println(prototext.Format(&pb.Test{Name: "my name"}))
	fmt.Println(prototext.Format(&pbV1.Test{Name: "my name v1"}))
}

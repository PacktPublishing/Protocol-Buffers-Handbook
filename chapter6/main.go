package main

import "github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter6/proto"

func main() {
	id := proto.Id{Value: 1}

	println(id.String())
}

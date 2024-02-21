package main

import "example.com/proto"

func main() {
	id := proto.Id{Value: 1}

	println(id.String())
}

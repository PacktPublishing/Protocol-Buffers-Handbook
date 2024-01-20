package main

import "google.golang.org/protobuf/compiler/protogen"

func main() {
	protogen.Options{}.Run(func(gen *protogen.Plugin) error {
		println("You are awesome! It's only chapter 4 and you already have all these skills!")
		return nil
	})
}

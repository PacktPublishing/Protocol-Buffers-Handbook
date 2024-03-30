package protoc_gen_check

import "google.golang.org/protobuf/compiler/protogen"

func getAllNestedMessages(msg *protogen.Message) (res []*protogen.Message) {
	for _, nested := range msg.Messages {
		if !nested.Desc.IsMapEntry() {
			// Don't include the synthetic message type that represents an entry in a map field.
			res = append(res, nested)
		}
		res = append(res, getAllNestedMessages(nested)...)
	}
	return res
}

func GetAllMessages(file *protogen.File) (res []*protogen.Message) {
	for _, msg := range file.Messages {
		res = append(res, msg)
		res = append(res, getAllNestedMessages(msg)...)
	}
	return res
}

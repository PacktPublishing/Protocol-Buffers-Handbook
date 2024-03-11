package addressbook

import (
	"io"
	"strings"

	"google.golang.org/protobuf/proto"
	"google.golang.org/protobuf/reflect/protoreflect"
	"google.golang.org/protobuf/types/descriptorpb"

	pb "github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter7/proto"
)

func readFromDb(db io.Reader) (*pb.AddressBook, error) {
	in, err := io.ReadAll(db)
	if err != nil {
		return nil, err
	}

	var book pb.AddressBook
	if err = proto.Unmarshal(in, &book); err != nil {
		return nil, err
	}
	return &book, err
}

func writeToDb(db io.Writer, book *pb.AddressBook) error {
	out, err := proto.Marshal(book)
	if err != nil {
		return err
	}

	if _, err = db.Write(out); err != nil {
		return err
	}
	return nil
}

func strToPhoneType(str string) pb.Person_PhoneNumber_Type {
	var t pb.Person_PhoneNumber_Type

	switch str {
	case "home":
		t = pb.Person_PhoneNumber_TYPE_HOME
	case "mobile":
		t = pb.Person_PhoneNumber_TYPE_MOBILE
	case "work":
		t = pb.Person_PhoneNumber_TYPE_WORK
	}

	return t
}

func strToDepartment(str string) pb.Company_Department {
	var d pb.Company_Department

	switch str {
	case "hr":
		d = pb.Company_DEPARTMENT_HR
	case "cs":
		d = pb.Company_DEPARTMENT_CUSTOMER_SERVICE
	}

	return d
}

func redactPrivateInfo(msg proto.Message) {
	m := msg.ProtoReflect()
	m.Range(func(fd protoreflect.FieldDescriptor, v protoreflect.Value) bool {
		opts := fd.Options().(*descriptorpb.FieldOptions)
		if opts != nil && *opts.DebugRedact {
			switch fd.Kind() {
			case protoreflect.StringKind:
				m.Set(fd, protoreflect.ValueOfString(strings.Repeat("*", len(v.String()))))
			default:
				// TODO
			}
		}
		return true
	})
}

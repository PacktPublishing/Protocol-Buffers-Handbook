package addressbook

import (
	"fmt"
	"io"
	"sort"

	pb "github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter9/proto"

	"google.golang.org/protobuf/encoding/prototext"
)

func ListContacts(db io.Reader, w io.Writer, redact bool) error {
	book, err := readFromDb(db)
	if err != nil {
		return err
	}

	// alphabetically sort map by names
	names := make([]string, 0, len(book.Contacts))
	for name := range book.Contacts {
		names = append(names, name)
	}
	sort.Strings(names)

	for _, name := range names {
		contact := book.Contacts[name]

		if redact {
			switch c := contact.Kind.(type) {
			case *pb.Contact_Company:
				for _, email := range c.Company.Emails {
					redactPrivateInfo(email)
				}
				for _, phone := range c.Company.Phones {
					redactPrivateInfo(phone)
				}
			case *pb.Contact_Person:
				for _, phone := range c.Person.Phones {
					redactPrivateInfo(phone)
				}
				redactPrivateInfo(c.Person)
			}
		}

		time := contact.LastUpdated.AsTime()
		contact.LastUpdated = nil // just so that prototext doesn't display it
		fmt.Fprintf(w, "name: %s\n", name)
		fmt.Fprintf(w, "last_updated: %s\n", time.Format("01/02/2006 15:04:05"))
		fmt.Fprintf(w, "%s", prototext.Format(contact))
		fmt.Fprintln(w, "-----------------------")
	}

	return nil
}

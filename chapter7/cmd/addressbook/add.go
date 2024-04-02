package addressbook

import (
	"fmt"
	"io"
	"os"

	"github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter7/pkg/addressbook"
)

func addContact(db io.ReadWriter, name, kind, email, emailDep, phoneNb, phoneType string) {
	if len(name) == 0 {
		fmt.Println("contact name cannot be empty.")
		os.Exit(1)
	}

	if len(kind) == 0 {
		fmt.Println("contact kind cannot be empty.")
		os.Exit(1)
	}

	switch kind {
	case "cie", "company":
		if err := addressbook.AddCompany(db, name, email, emailDep, phoneNb, phoneType); err != nil {
			fmt.Printf("error: %s\n", err)
			os.Exit(1)
		}
	case "per", "person":
		if err := addressbook.AddPerson(db, name, email, phoneNb, phoneType); err != nil {
			fmt.Printf("error: %s\n", err)
			os.Exit(1)
		}
	default:
		fmt.Println("unknown kind", kind)
		os.Exit(1)
	}
}

package addressbook

import (
	"fmt"
	"io"
	"os"
	"slices"

	"github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter7/pkg/addressbook"
)

var (
	cieKeywords = []string{"cie", "company"}
	perKeywords = []string{"per", "person"}
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

	if slices.Contains(cieKeywords, kind) {
		if err := addressbook.AddCompany(db, name, email, emailDep, phoneNb, phoneType); err != nil {
			fmt.Printf("error: %s\n", err)
			os.Exit(1)
		}
	} else if slices.Contains(perKeywords, kind) {
		if err := addressbook.AddPerson(db, name, email, phoneNb, phoneType); err != nil {
			fmt.Printf("error: %s\n", err)
			os.Exit(1)
		}
	} else {
		fmt.Println("unknown kind", kind)
		os.Exit(1)
	}
}

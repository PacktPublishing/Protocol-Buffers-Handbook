package addressbook

import (
	"fmt"
	"io"
	"os"

	"github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter9/pkg/addressbook"
)

func listContacts(db io.Reader, redact bool) {
	if err := addressbook.ListContacts(db, os.Stdout, redact); err != nil {
		fmt.Printf("error: %s\n", err)
		os.Exit(1)
	}
}

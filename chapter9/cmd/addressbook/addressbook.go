package addressbook

import (
	"flag"
	"fmt"
	"os"
)

const (
	dbFilePath = "addressbook.db"
)

func Execute() {
	addCmd := flag.NewFlagSet("add", flag.ExitOnError)
	name := addCmd.String("name", "", "the contact's name.")
	kind := addCmd.String("kind", "", "the kind of contact (company or person).")
	email := addCmd.String("email", "", "the contact's email.")
	emailDep := addCmd.String("dep", "", "the contact's department.")
	phoneNb := addCmd.String("phone", "", "the contact's phone number.")
	phoneType := addCmd.String("type", "", "the type of phone number.")

	listCmd := flag.NewFlagSet("list", flag.ExitOnError)
	redact := listCmd.Bool("redact", false, "redacts private info")

	if len(os.Args) < 2 {
		fmt.Println("expected 'add' or 'list' subcommands")
		os.Exit(1)
	}

	db, err := os.OpenFile(dbFilePath, os.O_RDWR|os.O_CREATE, 0600)
	if err != nil {
		fmt.Printf("error: %s", err)
		os.Exit(1)
	}
	defer db.Close()

	switch os.Args[1] {
	case "add":
		addCmd.Parse(os.Args[2:])
		addContact(db, *name, *kind, *email, *emailDep, *phoneNb, *phoneType)
	case "list":
		listCmd.Parse(os.Args[2:])
		listContacts(db, *redact)
	default:
		fmt.Println("expected 'add' or 'list' subcommands")
		os.Exit(1)
	}
}

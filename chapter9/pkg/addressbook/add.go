package addressbook

import (
	"io"

	"google.golang.org/protobuf/types/known/timestamppb"

	pb "github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter9/proto"
)

func AddPerson(db io.ReadWriter, name, email, phoneNb, phoneType string) error {
	book, err := readFromDb(db)
	if err != nil {
		return err
	}

	if book.Contacts == nil {
		book.Contacts = make(map[string]*pb.Contact)
	}
	contact, ok := book.Contacts[name]

	var person *pb.Person

	if ok { // contact already exists
		person = contact.Kind.(*pb.Contact_Person).Person
	} else { // contact doesn't exist
		person = &pb.Person{}
	}

	if len(email) != 0 {
		person.Email = email

    if err := person.CheckEmail(); err != nil {
      return err
    }
	}

	if len(phoneNb) != 0 {
    nb := &pb.Person_PhoneNumber{
			Number: phoneNb,
			Type:   strToPhoneType(phoneType),
		}

    if err := nb.CheckPhone(); err != nil {
      return err
    }

		person.Phones = append(person.Phones, nb)
	}

	book.Contacts[name] = &pb.Contact{
		LastUpdated: timestamppb.Now(),
		Kind: &pb.Contact_Person{
			Person: person,
		},
	}

	if err = writeToDb(db, book); err != nil {
		return err
	}
	return nil
}

func AddCompany(db io.ReadWriter, name, email, emailDep, phoneNb, phoneDep string) error {
	book, err := readFromDb(db)
	if err != nil {
		return err
	}

	if book.Contacts == nil {
		book.Contacts = make(map[string]*pb.Contact)
	}
	contact, ok := book.Contacts[name]

	var cie *pb.Company

	if ok { // contact already exists
		cie = contact.Kind.(*pb.Contact_Company).Company
	} else { // contact doesn't exist
		cie = &pb.Company{}
	}

	if len(email) != 0 {
    email := &pb.Company_EmailAddress{
			Email:      email,
			Department: strToDepartment(emailDep),
		}

    if err := email.CheckEmail(); err != nil {
      return err
    }

		cie.Emails = append(cie.Emails, email)
	}

	if len(phoneNb) != 0 {
    nb := &pb.Company_PhoneNumber{
			Number:     phoneNb,
			Department: strToDepartment(phoneDep),
		}

    if err := nb.CheckPhone(); err != nil {
      return err
    }

		cie.Phones = append(cie.Phones, nb)
	}

	book.Contacts[name] = &pb.Contact{
		LastUpdated: timestamppb.Now(),
		Kind: &pb.Contact_Company{
			Company: cie,
		},
	}

	if err = writeToDb(db, book); err != nil {
		return err
	}
	return nil
}

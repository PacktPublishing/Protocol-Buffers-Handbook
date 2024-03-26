package addressbook_test

import (
	"bytes"
	"fmt"
	"sort"
	"strings"
	"testing"

	"github.com/google/go-cmp/cmp"
	"google.golang.org/protobuf/encoding/prototext"
	"google.golang.org/protobuf/proto"
	"google.golang.org/protobuf/testing/protocmp"
	"google.golang.org/protobuf/types/known/timestamppb"

	"github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter7/pkg/addressbook"
	pb "github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter7/proto"
)

var (
	fakeDbReadError  = fmt.Errorf("fakedb read error")
	fakeDbWriteError = fmt.Errorf("fakedb write error")
)

type FakeDb struct {
	errOnRead, errOnWrite bool
	buffer                *bytes.Buffer
}

func (db *FakeDb) Read(p []byte) (n int, err error) {
	if db.errOnRead {
		return 0, fakeDbReadError
	}
	return db.buffer.Read(p)
}

func (db *FakeDb) Write(p []byte) (n int, err error) {
	if db.errOnWrite {
		return 0, fakeDbWriteError
	}
	return db.buffer.Write(p)
}

func newFakeDb(buffer string, errOnRead, errOnWrite bool) FakeDb {
	return FakeDb{
		buffer:     bytes.NewBufferString(buffer),
		errOnRead:  errOnRead,
		errOnWrite: errOnWrite,
	}
}

func TestAddPerson(t *testing.T) {
	prePopulated := &pb.AddressBook{
		Contacts: map[string]*pb.Contact{
			"Clément": {
				Kind: &pb.Contact_Person{
					Person: &pb.Person{
						Email: "my.email@packt.com",
						Phones: []*pb.Person_PhoneNumber{
							{Number: "11111111", Type: pb.Person_PhoneNumber_TYPE_WORK},
						},
					},
				},
			},
		},
	}
	prePopulatedBuffer, err := proto.Marshal(prePopulated)
	if err != nil {
		t.Fatalf("unexpected error: %s", err)
	}

	tests := []struct {
		db                              FakeDb
		name, email, phoneNb, phoneType string

		expectedPerson *pb.Person
		expectedErr    error
	}{
		// trivial
		{
			db:    newFakeDb("", false, false),
			name:  "Clément",
			email: "my.email@packt.com",
			expectedPerson: &pb.Person{
				Email: "my.email@packt.com",
			},
		},
		{
			db:        newFakeDb("", false, false),
			name:      "Clément",
			phoneNb:   "11111111",
			phoneType: "home",
			expectedPerson: &pb.Person{
				Phones: []*pb.Person_PhoneNumber{
					{Number: "11111111", Type: pb.Person_PhoneNumber_TYPE_HOME},
				},
			},
		},
		{
			db:        newFakeDb("", false, false),
			name:      "Clément",
			phoneNb:   "11111111",
			phoneType: "mobile",
			expectedPerson: &pb.Person{
				Phones: []*pb.Person_PhoneNumber{
					{Number: "11111111", Type: pb.Person_PhoneNumber_TYPE_MOBILE},
				},
			},
		},
		{
			db:        newFakeDb("", false, false),
			name:      "Clément",
			phoneNb:   "11111111",
			phoneType: "work",
			expectedPerson: &pb.Person{
				Phones: []*pb.Person_PhoneNumber{
					{Number: "11111111", Type: pb.Person_PhoneNumber_TYPE_WORK},
				},
			},
		},
		{
			db:      newFakeDb("", false, false),
			name:    "Clément",
			phoneNb: "11111111",
			expectedPerson: &pb.Person{
				Phones: []*pb.Person_PhoneNumber{
					{Number: "11111111"},
				},
			},
		},
		{
			db:        newFakeDb("", false, false),
			name:      "Clément",
			email:     "my.email@packt.com",
			phoneNb:   "11111111",
			phoneType: "work",
			expectedPerson: &pb.Person{
				Email: "my.email@packt.com",
				Phones: []*pb.Person_PhoneNumber{
					{Number: "11111111", Type: pb.Person_PhoneNumber_TYPE_WORK},
				},
			},
		},
		// errors
		{
			db:          newFakeDb("", true, false),
			expectedErr: fakeDbReadError,
		},
		{
			db:          newFakeDb("", false, true),
			expectedErr: fakeDbWriteError,
		},
		// append phone number to existing contact
		{
			db:        newFakeDb(string(prePopulatedBuffer), false, false),
			name:      "Clément",
			phoneNb:   "22222222",
			phoneType: "home",
			expectedPerson: &pb.Person{
				Email: "my.email@packt.com",
				Phones: []*pb.Person_PhoneNumber{
					{Number: "11111111", Type: pb.Person_PhoneNumber_TYPE_WORK},
					{Number: "22222222", Type: pb.Person_PhoneNumber_TYPE_HOME},
				},
			},
		},
	}

	for _, test := range tests {
		err := addressbook.AddPerson(&test.db, test.name, test.email, test.phoneNb, test.phoneType)

		if test.expectedErr != nil {
			if err != test.expectedErr {
				t.Fatalf("expected error '%s', got '%s'", test.expectedErr, err)
			}
		} else if test.expectedPerson != nil {
			var book pb.AddressBook

			if err = proto.Unmarshal(test.db.buffer.Bytes(), &book); err != nil {
				t.Fatalf("unexpected error: %s", err)
			}

			contact, ok := book.Contacts[test.name]
			if !ok {
				t.Fatalf("contact with name '%s' was not found", test.name)
			}

			opts := []cmp.Option{protocmp.Transform()}
			got := contact.GetPerson()
			if diff := cmp.Diff(test.expectedPerson, got, opts...); diff != "" {
				t.Errorf("person mismatch (-want +got):\n%s", diff)
			}
		}
	}
}

func TestAddCompany(t *testing.T) {
	prePopulated := &pb.AddressBook{
		Contacts: map[string]*pb.Contact{
			"Google": {
				Kind: &pb.Contact_Company{
					Company: &pb.Company{
						Phones: []*pb.Company_PhoneNumber{
							{Number: "11111111", Department: pb.Company_DEPARTMENT_HR},
						},
						Emails: []*pb.Company_EmailAddress{
							{Email: "hr.google@gmail.com", Department: pb.Company_DEPARTMENT_HR},
						},
					},
				},
			},
		},
	}
	prePopulatedBuffer, err := proto.Marshal(prePopulated)
	if err != nil {
		t.Fatalf("unexpected error: %s", err)
	}

	tests := []struct {
		db                                       FakeDb
		name, email, emailDep, phoneNb, phoneDep string

		expectedCompany *pb.Company
		expectedErr     error
	}{
		// trivial
		{
			db:       newFakeDb("", false, false),
			name:     "Google",
			email:    "hr.google@gmail.com",
			emailDep: "hr",
			expectedCompany: &pb.Company{
				Emails: []*pb.Company_EmailAddress{
					{Email: "hr.google@gmail.com", Department: pb.Company_DEPARTMENT_HR},
				},
			},
		},
		{
			db:       newFakeDb("", false, false),
			name:     "Google",
			email:    "cs.google@gmail.com",
			emailDep: "cs",
			expectedCompany: &pb.Company{
				Emails: []*pb.Company_EmailAddress{
					{Email: "cs.google@gmail.com", Department: pb.Company_DEPARTMENT_CUSTOMER_SERVICE},
				},
			},
		},
		{
			db:    newFakeDb("", false, false),
			name:  "Google",
			email: "google@gmail.com",
			expectedCompany: &pb.Company{
				Emails: []*pb.Company_EmailAddress{
					{Email: "google@gmail.com"},
				},
			},
		},
		{
			db:       newFakeDb("", false, false),
			name:     "Google",
			phoneNb:  "11111111",
			phoneDep: "hr",
			expectedCompany: &pb.Company{
				Phones: []*pb.Company_PhoneNumber{
					{Number: "11111111", Department: pb.Company_DEPARTMENT_HR},
				},
			},
		},
		{
			db:       newFakeDb("", false, false),
			name:     "Google",
			phoneNb:  "11111111",
			phoneDep: "cs",
			expectedCompany: &pb.Company{
				Phones: []*pb.Company_PhoneNumber{
					{Number: "11111111", Department: pb.Company_DEPARTMENT_CUSTOMER_SERVICE},
				},
			},
		},
		{
			db:      newFakeDb("", false, false),
			name:    "Google",
			phoneNb: "11111111",
			expectedCompany: &pb.Company{
				Phones: []*pb.Company_PhoneNumber{
					{Number: "11111111"},
				},
			},
		},
		{
			db:       newFakeDb("", false, false),
			name:     "Clément",
			email:    "hr.google@gmail.com",
			emailDep: "hr",
			phoneNb:  "11111111",
			phoneDep: "cs",
			expectedCompany: &pb.Company{
				Emails: []*pb.Company_EmailAddress{
					{Email: "hr.google@gmail.com", Department: pb.Company_DEPARTMENT_HR},
				},
				Phones: []*pb.Company_PhoneNumber{
					{Number: "11111111", Department: pb.Company_DEPARTMENT_CUSTOMER_SERVICE},
				},
			},
		},
		// errors
		{
			db:          newFakeDb("", true, false),
			expectedErr: fakeDbReadError,
		},
		{
			db:          newFakeDb("", false, true),
			expectedErr: fakeDbWriteError,
		},
		// append phone number/email to existing contact
		{
			db:       newFakeDb(string(prePopulatedBuffer), false, false),
			name:     "Google",
			phoneNb:  "22222222",
			phoneDep: "cs",
			expectedCompany: &pb.Company{
				Phones: []*pb.Company_PhoneNumber{
					{Number: "11111111", Department: pb.Company_DEPARTMENT_HR},
					{Number: "22222222", Department: pb.Company_DEPARTMENT_CUSTOMER_SERVICE},
				},
				Emails: []*pb.Company_EmailAddress{
					{Email: "hr.google@gmail.com", Department: pb.Company_DEPARTMENT_HR},
				},
			},
		},
		{
			db:       newFakeDb(string(prePopulatedBuffer), false, false),
			name:     "Google",
			email:    "cs.google@gmail.com",
			emailDep: "cs",
			expectedCompany: &pb.Company{
				Phones: []*pb.Company_PhoneNumber{
					{Number: "11111111", Department: pb.Company_DEPARTMENT_HR},
				},
				Emails: []*pb.Company_EmailAddress{
					{Email: "hr.google@gmail.com", Department: pb.Company_DEPARTMENT_HR},
					{Email: "cs.google@gmail.com", Department: pb.Company_DEPARTMENT_CUSTOMER_SERVICE},
				},
			},
		},
	}

	for _, test := range tests {
		err := addressbook.AddCompany(&test.db, test.name, test.email, test.emailDep, test.phoneNb, test.phoneDep)

		if test.expectedErr != nil {
			if err != test.expectedErr {
				t.Fatalf("expected error '%s', got '%s'", test.expectedErr, err)
			}
		} else if test.expectedCompany != nil {
			var book pb.AddressBook

			if err = proto.Unmarshal(test.db.buffer.Bytes(), &book); err != nil {
				t.Fatalf("unexpected error: %s", err)
			}

			contact, ok := book.Contacts[test.name]
			if !ok {
				t.Fatalf("contact with name '%s' was not found", test.name)
			}

			opts := []cmp.Option{protocmp.Transform()}
			got := contact.GetCompany()
			if diff := cmp.Diff(test.expectedCompany, got, opts...); diff != "" {
				t.Errorf("person mismatch (-want +got):\n%s", diff)
			}
		}
	}
}

func TestListContacts(t *testing.T) {
	now := timestamppb.Now()
	prePopulated := &pb.AddressBook{
		Contacts: map[string]*pb.Contact{
			"Clément": {
				LastUpdated: now,
				Kind: &pb.Contact_Person{
					Person: &pb.Person{
						Email: "my.email@packt.com",
						Phones: []*pb.Person_PhoneNumber{
							{Number: "11111111", Type: pb.Person_PhoneNumber_TYPE_HOME},
						},
					},
				},
			},
			"Google": {
				LastUpdated: now,
				Kind: &pb.Contact_Company{
					Company: &pb.Company{
						Phones: []*pb.Company_PhoneNumber{
							{Number: "11111111", Department: pb.Company_DEPARTMENT_HR},
						},
						Emails: []*pb.Company_EmailAddress{
							{Email: "hr.google@gmail.com", Department: pb.Company_DEPARTMENT_HR},
						},
					},
				},
			},
		},
	}
	prePopulatedBuffer, err := proto.Marshal(prePopulated)
	if err != nil {
		t.Fatalf("unexpected error: %s", err)
	}

	tests := []struct {
		db          FakeDb
		expectedErr error
	}{
		// trivial
		{db: newFakeDb(string(prePopulatedBuffer), false, false)},

		// errors
		{
			db:          newFakeDb(string(prePopulatedBuffer), true, false),
			expectedErr: fakeDbReadError,
		},
	}

	for _, test := range tests {
		var out bytes.Buffer
		err := addressbook.ListContacts(&test.db, &out, false)

		if test.expectedErr != nil {
			if err != test.expectedErr {
				t.Fatalf("expected error '%s', got '%s'", test.expectedErr, err)
			}
		} else {
			sb := strings.Builder{}

			names := make([]string, 0, len(prePopulated.Contacts))
			for name := range prePopulated.Contacts {
				names = append(names, name)
			}
			sort.Strings(names)

			for _, name := range names {
				contact := prePopulated.Contacts[name]
				time := contact.LastUpdated.AsTime()
				contact.LastUpdated = nil // just so that prototext doesn't display it
				sb.WriteString("name: ")
				sb.WriteString(name)
				sb.WriteString("\n")
				sb.WriteString("last_updated: ")
				sb.WriteString(time.Format("01/02/2006 15:04:05"))
				sb.WriteString("\n")
				sb.WriteString(prototext.Format(contact))
				sb.WriteString("-----------------------\n")
			}

			if out.String() != sb.String() {
				t.Fatalf("expected output '%s', got '%s'", sb.String(), out.String())
			}
		}
	}
}

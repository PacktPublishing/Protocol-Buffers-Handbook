"""AddressBook CLI application."""

import os
import sys
import argparse
from typing import IO

import google.protobuf.timestamp_pb2 as timestamppb
import google.protobuf.descriptor_pb2 as descriptorpb
from google.protobuf.message import Message

import proto.addressbook_pb2 as pb

cie_keywords: list[str] = ["cie", "company"]
per_keywords: list[str] = ["per", "person"]
DB_FILE_PATH: str = "addressbook.db"


def read_from_db(db: IO[bytes]) -> pb.AddressBook:
    book = pb.AddressBook()
    book.ParseFromString(db.read())
    return book


def str_to_phone_type(s: str) -> pb.Person.PhoneNumber.Type:
    match s:
        case "home":
            return pb.Person.PhoneNumber.Type.TYPE_HOME
        case "mobile":
            return pb.Person.PhoneNumber.Type.TYPE_MOBILE
        case "work":
            return pb.Person.PhoneNumber.Type.TYPE_WORK
        case _other:
            return pb.Person.PhoneNumber.Type.TYPE_UNSPECIFIED


def str_to_department(s: str) -> pb.Company.Department:
    match s:
        case "hr":
            return pb.Company.Department.DEPARTMENT_HR
        case "cs":
            return pb.Company.Department.DEPARTMENT_CUSTOMER_SERVICE
        case _other:
            return pb.Company.Department.DEPARTMENT_UNSPECIFIED


def redact_private_info(msg: Message):
    for field in msg.DESCRIPTOR.fields:
        if field.has_options:
            opts = field.GetOptions()

            if opts.debug_redact and field.type == descriptorpb.FieldDescriptorProto.TYPE_STRING:
                old = getattr(msg, field.name)
                setattr(msg, field.name, '*' * len(old))


def add_person(db: IO[bytes], name: str, email: str, phone: str, phone_type: str):
    """Add a person to the database."""
    book = read_from_db(db)

    if name in book.contacts:
        person = book.contacts[name].person
    else:
        person = pb.Person()

    if email is not None:
        person.email = email

    if phone is not None:
        nb = pb.Person.PhoneNumber()
        nb.number = phone
        nb.type = str_to_phone_type(phone_type)
        person.phones.append(nb)

    contact = pb.Contact()
    update_ts = timestamppb.Timestamp()
    update_ts.GetCurrentTime()
    contact.last_updated.CopyFrom(update_ts)
    contact.person.CopyFrom(person)
    book.contacts[name].CopyFrom(contact)
    db.write(book.SerializeToString())


def add_company(db: IO[bytes], name: str, email: str, email_dep: str, phone: str, phone_dep: str):
    """Add a company to the database."""
    book = read_from_db(db)

    if book.contacts is None:
        book.contacts = {}

    if name in book.contacts:
        company = book.contacts[name].company
    else:
        company = pb.Company()

    if email is not None:
        addr = pb.Company.EmailAddress()
        addr.email = email
        addr.department = str_to_department(email_dep)
        company.emails.append(addr)

    if phone is not None:
        nb = pb.Company.PhoneNumber()
        nb.number = phone
        nb.department = str_to_department(phone_dep)
        company.phones.append(nb)

    contact = pb.Contact()
    update_ts = timestamppb.Timestamp()
    update_ts.GetCurrentTime()
    contact.last_updated.CopyFrom(update_ts)
    contact.company.CopyFrom(company)
    book.contacts[name].CopyFrom(contact)
    db.write(book.SerializeToString())


def list_contacts(db: IO[bytes], redact: bool):
    """List all contacts in the database."""
    book = read_from_db(db)
    for name in sorted(book.contacts.keys()):
        contact = book.contacts[name]

        if redact:
            if contact.WhichOneof("kind") == "person":
                redact_private_info(contact.person)
                for phone in contact.person.phones:
                    redact_private_info(phone)
            elif contact.WhichOneof("kind") == "company":
                for phone in contact.company.phones:
                    redact_private_info(phone)
                for email in contact.company.emails:
                    redact_private_info(email)

        update_ts = contact.last_updated.ToDatetime()
        contact.ClearField("last_updated")
        print("name:", name)
        print("last_updated:", update_ts.strftime("%m/%d/%Y %H:%M:%S"))
        print(contact, end="")
        print("-----------------------")


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(dest='command')

    add_parser = subparsers.add_parser('add')
    add_parser.add_argument('--name',
                            required=True,
                            type=str,
                            help="the contact's name.")
    add_parser.add_argument('--kind',
                            required=True,
                            type=str,
                            help="the kind of contact (company or person).")
    add_parser.add_argument('--email',
                            type=str,
                            help="the contact's email.")
    add_parser.add_argument('--dep',
                            type=str,
                            help="the contact's department.")
    add_parser.add_argument('--phone',
                            type=str,
                            help="the contact's phone number.")
    add_parser.add_argument('--type',
                            type=str,
                            help="the type of phone number.")

    list_parser = subparsers.add_parser('list')
    list_parser.add_argument(
        '--redact',
        dest='redact', nargs='?',
        const=True, default=False,
        type=bool,
        help='redacts private info'
    )

    args = parser.parse_args(sys.argv[1:])

    if args.command == "add":
        with os.fdopen(os.open(DB_FILE_PATH, os.O_RDWR | os.O_CREAT), 'rb+') as f:
            if args.kind in cie_keywords:
                add_company(f, args.name, args.email, args.dep, args.phone, args.type)
            elif args.kind in per_keywords:
                add_person(f, args.name, args.email, args.phone, args.type)
            else:
                print("error: unknown kind", args.kind)
    else:
        with open(DB_FILE_PATH, 'rb') as f:
            list_contacts(f, args.redact)

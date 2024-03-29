package main

import (
  "flag"
  "fmt"
  "strings"

  "google.golang.org/protobuf/proto"
	"google.golang.org/protobuf/compiler/protogen"
  "github.com/iancoleman/strcase"

  "github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter9/proto/validate"
  pkg "github.com/PacktPublishing/Protocol-Buffers-Handbook/chapter9/pkg/protoc-gen-check"
)

const (
  extension = "check.pb.go"
  pluginName = "protoc-gen-go-check"
)

func main() {
  var flags flag.FlagSet

  phoneRegexp := flags.String("phone_regexp", "", "custom regex for phone checking.")
  opts := protogen.Options{
    ParamFunc: flags.Set,
  }

  opts.Run(func(plugin *protogen.Plugin) error {
  	for _, f := range plugin.Files {
			if !f.Generate {
				continue
			}
			generateFile(plugin, f, phoneRegexp)
		}
		return nil
	})
}

func generateFile(plugin *protogen.Plugin, file *protogen.File, phoneRegexp *string) {
	filename := file.GeneratedFilenamePrefix + "_" + extension
	gen := plugin.NewGeneratedFile(filename, file.GoImportPath)
	gen.P("// Code generated by ", pluginName, ". DO NOT EDIT.")
	gen.P()
	gen.P("package ", file.GoPackageName)
	gen.P()
  gen.P("import \"fmt\"")
  gen.P("import \"net/mail\"")
  gen.P("import \"regexp\"")
  gen.P("import \"strings\"")
  gen.P()

  if len(*phoneRegexp) == 0 {
    gen.P("var phoneRegexp = regexp.MustCompile(`^\\+[1-9]\\d{1,14}$`)")
  } else {
    gen.P("var phoneRegexp = regexp.MustCompile(`", *phoneRegexp, "`)")
  }
  generateFunctions(gen, file)
}

func generateFunctions(gen *protogen.GeneratedFile, file *protogen.File) {
  gen.P(`func isEmail(s string) bool {
    _, err := mail.ParseAddress(s)
    return err == nil
}`)
  gen.P()
  gen.P(`func isPhoneNumber(s string) bool {
    s = strings.ReplaceAll(s, " ", "")
    return phoneRegexp.Find([]byte(s)) != nil
}`)
  gen.P()

  for _, msg := range pkg.GetAllMessages(file) {
    opts := msg.Desc.Options()
    value, _ := proto.GetExtension(opts, validate.E_Field).(*validate.FieldConstraints)

    if value == nil || value.Type == nil {
      continue
    }

    firstLetter := string(strings.ToLower(msg.GoIdent.GoName)[0])

    switch *value.Type {
    case validate.FieldConstraints_TYPE_PHONE:
      gen.P("func (", firstLetter, " ", msg.GoIdent, ") CheckPhone() error {")
      fieldName := strcase.ToCamel(*value.Name)
      field := fmt.Sprintf("%s.%s", firstLetter, fieldName)
      gen.P("if !isPhoneNumber(", field, ") { return fmt.Errorf(\"%s is not a valid phone number\", ", field, ") }")
      gen.P("return nil")
      gen.P("}")
      gen.P()
    case validate.FieldConstraints_TYPE_EMAIL:
      gen.P("func (", firstLetter, " ", msg.GoIdent, ") CheckEmail() error {")
      fieldName := strcase.ToCamel(*value.Name)
      field := fmt.Sprintf("%s.%s", firstLetter, fieldName)
      gen.P("if !isEmail(", field, ") { return fmt.Errorf(\"%s is not a valid email\", ", field, ") }")
      gen.P("return nil")
      gen.P("}")
      gen.P()
    }
	}
}
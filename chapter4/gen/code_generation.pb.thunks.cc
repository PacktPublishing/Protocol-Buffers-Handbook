#include "code_generation.proto.h"
#include "google/protobuf/rust/cpp_kernel/cpp_api.h"
// example.TestCodeGenMessage
        // clang-format off
extern "C" {
void* __rust_proto_thunk__example_TestCodeGenMessage_new() { return new ::example::TestCodeGenMessage(); }
void __rust_proto_thunk__example_TestCodeGenMessage_delete(void* ptr) { delete static_cast<::example::TestCodeGenMessage*>(ptr); }
google::protobuf::rust_internal::SerializedData __rust_proto_thunk__example_TestCodeGenMessage_serialize(::example::TestCodeGenMessage* msg) {
  return google::protobuf::rust_internal::SerializeMsg(msg);
}
bool __rust_proto_thunk__example_TestCodeGenMessage_deserialize(::example::TestCodeGenMessage* msg,
                         google::protobuf::rust_internal::SerializedData data) {
  return msg->ParseFromArray(data.data, data.len);
}

double __rust_proto_thunk__example_TestCodeGenMessage_get_double(::example::TestCodeGenMessage* msg) { return msg->double_(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_double(::example::TestCodeGenMessage* msg, double val) {
  msg->set_double_(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_double(::example::TestCodeGenMessage* msg) { msg->clear_double_(); }
float __rust_proto_thunk__example_TestCodeGenMessage_get_float(::example::TestCodeGenMessage* msg) { return msg->float_(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_float(::example::TestCodeGenMessage* msg, float val) {
  msg->set_float_(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_float(::example::TestCodeGenMessage* msg) { msg->clear_float_(); }
::int32_t __rust_proto_thunk__example_TestCodeGenMessage_get_int32(::example::TestCodeGenMessage* msg) { return msg->int32(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_int32(::example::TestCodeGenMessage* msg, ::int32_t val) {
  msg->set_int32(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_int32(::example::TestCodeGenMessage* msg) { msg->clear_int32(); }
::int64_t __rust_proto_thunk__example_TestCodeGenMessage_get_int64(::example::TestCodeGenMessage* msg) { return msg->int64(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_int64(::example::TestCodeGenMessage* msg, ::int64_t val) {
  msg->set_int64(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_int64(::example::TestCodeGenMessage* msg) { msg->clear_int64(); }
::uint32_t __rust_proto_thunk__example_TestCodeGenMessage_get_uint32(::example::TestCodeGenMessage* msg) { return msg->uint32(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_uint32(::example::TestCodeGenMessage* msg, ::uint32_t val) {
  msg->set_uint32(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_uint32(::example::TestCodeGenMessage* msg) { msg->clear_uint32(); }
::uint64_t __rust_proto_thunk__example_TestCodeGenMessage_get_uint64(::example::TestCodeGenMessage* msg) { return msg->uint64(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_uint64(::example::TestCodeGenMessage* msg, ::uint64_t val) {
  msg->set_uint64(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_uint64(::example::TestCodeGenMessage* msg) { msg->clear_uint64(); }
::int32_t __rust_proto_thunk__example_TestCodeGenMessage_get_sint32(::example::TestCodeGenMessage* msg) { return msg->sint32(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_sint32(::example::TestCodeGenMessage* msg, ::int32_t val) {
  msg->set_sint32(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_sint32(::example::TestCodeGenMessage* msg) { msg->clear_sint32(); }
::int64_t __rust_proto_thunk__example_TestCodeGenMessage_get_sint64(::example::TestCodeGenMessage* msg) { return msg->sint64(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_sint64(::example::TestCodeGenMessage* msg, ::int64_t val) {
  msg->set_sint64(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_sint64(::example::TestCodeGenMessage* msg) { msg->clear_sint64(); }
::uint32_t __rust_proto_thunk__example_TestCodeGenMessage_get_fixed32(::example::TestCodeGenMessage* msg) { return msg->fixed32(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_fixed32(::example::TestCodeGenMessage* msg, ::uint32_t val) {
  msg->set_fixed32(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_fixed32(::example::TestCodeGenMessage* msg) { msg->clear_fixed32(); }
::uint64_t __rust_proto_thunk__example_TestCodeGenMessage_get_fixed64(::example::TestCodeGenMessage* msg) { return msg->fixed64(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_fixed64(::example::TestCodeGenMessage* msg, ::uint64_t val) {
  msg->set_fixed64(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_fixed64(::example::TestCodeGenMessage* msg) { msg->clear_fixed64(); }
::int32_t __rust_proto_thunk__example_TestCodeGenMessage_get_sfixed32(::example::TestCodeGenMessage* msg) { return msg->sfixed32(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_sfixed32(::example::TestCodeGenMessage* msg, ::int32_t val) {
  msg->set_sfixed32(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_sfixed32(::example::TestCodeGenMessage* msg) { msg->clear_sfixed32(); }
::int64_t __rust_proto_thunk__example_TestCodeGenMessage_get_sfixed64(::example::TestCodeGenMessage* msg) { return msg->sfixed64(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_sfixed64(::example::TestCodeGenMessage* msg, ::int64_t val) {
  msg->set_sfixed64(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_sfixed64(::example::TestCodeGenMessage* msg) { msg->clear_sfixed64(); }
bool __rust_proto_thunk__example_TestCodeGenMessage_get_bool(::example::TestCodeGenMessage* msg) { return msg->bool_(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_bool(::example::TestCodeGenMessage* msg, bool val) {
  msg->set_bool_(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_bool(::example::TestCodeGenMessage* msg) { msg->clear_bool_(); }
::google::protobuf::rust_internal::PtrAndLen __rust_proto_thunk__example_TestCodeGenMessage_get_string(::example::TestCodeGenMessage* msg) {
  absl::string_view val = msg->string();
  return ::google::protobuf::rust_internal::PtrAndLen(val.data(), val.size());
}
void __rust_proto_thunk__example_TestCodeGenMessage_set_string(::example::TestCodeGenMessage* msg, ::google::protobuf::rust_internal::PtrAndLen s) {
  msg->set_string(absl::string_view(s.ptr, s.len));
}
::google::protobuf::rust_internal::PtrAndLen __rust_proto_thunk__example_TestCodeGenMessage_get_bytes(::example::TestCodeGenMessage* msg) {
  absl::string_view val = msg->bytes();
  return ::google::protobuf::rust_internal::PtrAndLen(val.data(), val.size());
}
void __rust_proto_thunk__example_TestCodeGenMessage_set_bytes(::example::TestCodeGenMessage* msg, ::google::protobuf::rust_internal::PtrAndLen s) {
  msg->set_bytes(absl::string_view(s.ptr, s.len));
}
bool __rust_proto_thunk__example_TestCodeGenMessage_has_or_a_boolean(::example::TestCodeGenMessage* msg) {
  return msg->has_or_a_boolean();
}
bool __rust_proto_thunk__example_TestCodeGenMessage_get_or_a_boolean(::example::TestCodeGenMessage* msg) { return msg->or_a_boolean(); }
void __rust_proto_thunk__example_TestCodeGenMessage_set_or_a_boolean(::example::TestCodeGenMessage* msg, bool val) {
  msg->set_or_a_boolean(val);
}
void __rust_proto_thunk__example_TestCodeGenMessage_clear_or_a_boolean(::example::TestCodeGenMessage* msg) { msg->clear_or_a_boolean(); }
const void* __rust_proto_thunk__example_TestCodeGenMessage_get_duration(::example::TestCodeGenMessage* msg) {
  return static_cast<const void*>(&msg->duration());
}

::example::TestCodeGenMessage::TestCodeGenOneofCase __rust_proto_thunk__example_TestCodeGenMessage_case_TestCodeGenOneof(::example::TestCodeGenMessage* msg) {
  return msg->TestCodeGenOneof_case();
}
}  // extern "C"
// clang-format on



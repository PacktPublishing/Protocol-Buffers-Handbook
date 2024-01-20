extern crate protobuf_upb as __pb;
extern crate std as __std;
pub mod example {
#[allow(non_camel_case_types)]
// TODO: Implement support for debug redaction
#[derive(Debug)]
pub struct TestCodeGenMessage {
  inner: ::__pb::__runtime::MessageInner
}

// SAFETY:
// - `TestCodeGenMessage` does not provide shared mutation with its arena.
// - `TestCodeGenMessageMut` is not `Send`, and so even in the presence of mutator
//   splitting, synchronous access of an arena that would conflict with
//   field access is impossible.
unsafe impl Sync for TestCodeGenMessage {}

impl ::__pb::Proxied for TestCodeGenMessage {
  type View<'a> = TestCodeGenMessageView<'a>;
  type Mut<'a> = TestCodeGenMessageMut<'a>;
}

#[derive(Debug, Copy, Clone)]
#[allow(dead_code)]
pub struct TestCodeGenMessageView<'a> {
  msg: ::__pb::__internal::RawMessage,
  _phantom: ::__std::marker::PhantomData<&'a ()>,
}

impl<'a> TestCodeGenMessageView<'a> {
  #[doc(hidden)]
  pub fn new(_private: ::__pb::__internal::Private, msg: ::__pb::__internal::RawMessage) -> Self {
    Self { msg, _phantom: std::marker::PhantomData }
  }
  pub fn r#double(&self) -> f64 { unsafe {
    example_TestCodeGenMessage_double(self.msg)
  } }

  pub fn r#float(&self) -> f32 { unsafe {
    example_TestCodeGenMessage_float(self.msg)
  } }

  pub fn r#int32(&self) -> i32 { unsafe {
    example_TestCodeGenMessage_int32(self.msg)
  } }

  pub fn r#int64(&self) -> i64 { unsafe {
    example_TestCodeGenMessage_int64(self.msg)
  } }

  pub fn r#uint32(&self) -> u32 { unsafe {
    example_TestCodeGenMessage_uint32(self.msg)
  } }

  pub fn r#uint64(&self) -> u64 { unsafe {
    example_TestCodeGenMessage_uint64(self.msg)
  } }

  pub fn r#sint32(&self) -> i32 { unsafe {
    example_TestCodeGenMessage_sint32(self.msg)
  } }

  pub fn r#sint64(&self) -> i64 { unsafe {
    example_TestCodeGenMessage_sint64(self.msg)
  } }

  pub fn r#fixed32(&self) -> u32 { unsafe {
    example_TestCodeGenMessage_fixed32(self.msg)
  } }

  pub fn r#fixed64(&self) -> u64 { unsafe {
    example_TestCodeGenMessage_fixed64(self.msg)
  } }

  pub fn r#sfixed32(&self) -> i32 { unsafe {
    example_TestCodeGenMessage_sfixed32(self.msg)
  } }

  pub fn r#sfixed64(&self) -> i64 { unsafe {
    example_TestCodeGenMessage_sfixed64(self.msg)
  } }

  pub fn r#bool(&self) -> bool { unsafe {
    example_TestCodeGenMessage_bool(self.msg)
  } }

  pub fn r#or_a_boolean(&self) -> bool { unsafe {
    example_TestCodeGenMessage_or_a_boolean(self.msg)
  } }

}

// SAFETY:
// - `TestCodeGenMessageView` does not perform any mutation.
// - While a `TestCodeGenMessageView` exists, a `TestCodeGenMessageMut` can't exist to mutate
//   the arena that would conflict with field access.
// - `TestCodeGenMessageMut` is not `Send`, and so even in the presence of mutator
//   splitting, synchronous access of an arena is impossible.
unsafe impl Sync for TestCodeGenMessageView<'_> {}
unsafe impl Send for TestCodeGenMessageView<'_> {}

impl<'a> ::__pb::ViewProxy<'a> for TestCodeGenMessageView<'a> {
  type Proxied = TestCodeGenMessage;

  fn as_view(&self) -> ::__pb::View<'a, TestCodeGenMessage> {
    *self
  }
  fn into_view<'shorter>(self) -> ::__pb::View<'shorter, TestCodeGenMessage> where 'a: 'shorter {
    self
  }
}

impl<'a> ::__pb::SettableValue<TestCodeGenMessage> for TestCodeGenMessageView<'a> {
  fn set_on(self, _private: ::__pb::__internal::Private, _mutator: ::__pb::Mut<TestCodeGenMessage>) {
    todo!()
  }
}

#[derive(Debug)]
#[allow(dead_code)]
pub struct TestCodeGenMessageMut<'a> {
  inner: ::__pb::__runtime::MutatorMessageRef<'a>,
}

// SAFETY:
// - `TestCodeGenMessageMut` does not perform any shared mutation.
// - `TestCodeGenMessageMut` is not `Send`, and so even in the presence of mutator
//   splitting, synchronous access of an arena is impossible.
unsafe impl Sync for TestCodeGenMessageMut<'_> {}

impl<'a> ::__pb::MutProxy<'a> for TestCodeGenMessageMut<'a> {
  fn as_mut(&mut self) -> ::__pb::Mut<'_, TestCodeGenMessage> {
    TestCodeGenMessageMut { inner: self.inner }
  }
  fn into_mut<'shorter>(self) -> ::__pb::Mut<'shorter, TestCodeGenMessage> where 'a : 'shorter { self }
}

impl<'a> ::__pb::ViewProxy<'a> for TestCodeGenMessageMut<'a> {
  type Proxied = TestCodeGenMessage;
  fn as_view(&self) -> ::__pb::View<'_, TestCodeGenMessage> {
    TestCodeGenMessageView { msg: self.inner.msg(), _phantom: std::marker::PhantomData }
  }
  fn into_view<'shorter>(self) -> ::__pb::View<'shorter, TestCodeGenMessage> where 'a: 'shorter {
    TestCodeGenMessageView { msg: self.inner.msg(), _phantom: std::marker::PhantomData }
  }
}

impl TestCodeGenMessage {
  pub fn new() -> Self {
    let arena = ::__pb::__runtime::Arena::new();
    Self {
      inner: ::__pb::__runtime::MessageInner {
        msg: unsafe { example_TestCodeGenMessage_new(arena.raw()) },
        arena,
      }
    }
  }

  pub fn serialize(&self) -> ::__pb::__runtime::SerializedData {
    let arena = ::__pb::__runtime::Arena::new();
    let mut len = 0;
    unsafe {
      let data = example_TestCodeGenMessage_serialize(self.inner.msg, arena.raw(), &mut len);
      ::__pb::__runtime::SerializedData::from_raw_parts(arena, data, len)
    }
  }
  pub fn deserialize(&mut self, data: &[u8]) -> Result<(), ::__pb::ParseError> {
    let arena = ::__pb::__runtime::Arena::new();
    let msg = unsafe {
      example_TestCodeGenMessage_parse(data.as_ptr(), data.len(), arena.raw())
    };

    match msg {
      None => Err(::__pb::ParseError),
      Some(msg) => {
        // This assignment causes self.arena to be dropped and to deallocate
        // any previous message pointed/owned to by self.inner.msg.
        self.inner.arena = arena;
        self.inner.msg = msg;
        Ok(())
      }
    }
  }

  // double: optional double
  pub fn r#double(&self) -> f64 {
    unsafe { example_TestCodeGenMessage_double(self.inner.msg) }
  }
  pub fn r#double_mut(&mut self) -> ::__pb::PrimitiveMut<'_, f64> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<f64> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_double,
        example_TestCodeGenMessage_set_double,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // float: optional float
  pub fn r#float(&self) -> f32 {
    unsafe { example_TestCodeGenMessage_float(self.inner.msg) }
  }
  pub fn r#float_mut(&mut self) -> ::__pb::PrimitiveMut<'_, f32> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<f32> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_float,
        example_TestCodeGenMessage_set_float,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // int32: optional int32
  pub fn r#int32(&self) -> i32 {
    unsafe { example_TestCodeGenMessage_int32(self.inner.msg) }
  }
  pub fn r#int32_mut(&mut self) -> ::__pb::PrimitiveMut<'_, i32> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<i32> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_int32,
        example_TestCodeGenMessage_set_int32,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // int64: optional int64
  pub fn r#int64(&self) -> i64 {
    unsafe { example_TestCodeGenMessage_int64(self.inner.msg) }
  }
  pub fn r#int64_mut(&mut self) -> ::__pb::PrimitiveMut<'_, i64> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<i64> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_int64,
        example_TestCodeGenMessage_set_int64,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // uint32: optional uint32
  pub fn r#uint32(&self) -> u32 {
    unsafe { example_TestCodeGenMessage_uint32(self.inner.msg) }
  }
  pub fn r#uint32_mut(&mut self) -> ::__pb::PrimitiveMut<'_, u32> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<u32> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_uint32,
        example_TestCodeGenMessage_set_uint32,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // uint64: optional uint64
  pub fn r#uint64(&self) -> u64 {
    unsafe { example_TestCodeGenMessage_uint64(self.inner.msg) }
  }
  pub fn r#uint64_mut(&mut self) -> ::__pb::PrimitiveMut<'_, u64> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<u64> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_uint64,
        example_TestCodeGenMessage_set_uint64,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // sint32: optional sint32
  pub fn r#sint32(&self) -> i32 {
    unsafe { example_TestCodeGenMessage_sint32(self.inner.msg) }
  }
  pub fn r#sint32_mut(&mut self) -> ::__pb::PrimitiveMut<'_, i32> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<i32> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_sint32,
        example_TestCodeGenMessage_set_sint32,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // sint64: optional sint64
  pub fn r#sint64(&self) -> i64 {
    unsafe { example_TestCodeGenMessage_sint64(self.inner.msg) }
  }
  pub fn r#sint64_mut(&mut self) -> ::__pb::PrimitiveMut<'_, i64> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<i64> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_sint64,
        example_TestCodeGenMessage_set_sint64,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // fixed32: optional fixed32
  pub fn r#fixed32(&self) -> u32 {
    unsafe { example_TestCodeGenMessage_fixed32(self.inner.msg) }
  }
  pub fn r#fixed32_mut(&mut self) -> ::__pb::PrimitiveMut<'_, u32> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<u32> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_fixed32,
        example_TestCodeGenMessage_set_fixed32,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // fixed64: optional fixed64
  pub fn r#fixed64(&self) -> u64 {
    unsafe { example_TestCodeGenMessage_fixed64(self.inner.msg) }
  }
  pub fn r#fixed64_mut(&mut self) -> ::__pb::PrimitiveMut<'_, u64> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<u64> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_fixed64,
        example_TestCodeGenMessage_set_fixed64,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // sfixed32: optional sfixed32
  pub fn r#sfixed32(&self) -> i32 {
    unsafe { example_TestCodeGenMessage_sfixed32(self.inner.msg) }
  }
  pub fn r#sfixed32_mut(&mut self) -> ::__pb::PrimitiveMut<'_, i32> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<i32> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_sfixed32,
        example_TestCodeGenMessage_set_sfixed32,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // sfixed64: optional sfixed64
  pub fn r#sfixed64(&self) -> i64 {
    unsafe { example_TestCodeGenMessage_sfixed64(self.inner.msg) }
  }
  pub fn r#sfixed64_mut(&mut self) -> ::__pb::PrimitiveMut<'_, i64> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<i64> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_sfixed64,
        example_TestCodeGenMessage_set_sfixed64,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // bool: optional bool
  pub fn r#bool(&self) -> bool {
    unsafe { example_TestCodeGenMessage_bool(self.inner.msg) }
  }
  pub fn r#bool_mut(&mut self) -> ::__pb::PrimitiveMut<'_, bool> {
    static VTABLE: ::__pb::__internal::PrimitiveVTable<bool> =
      ::__pb::__internal::PrimitiveVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_bool,
        example_TestCodeGenMessage_set_bool,
      );

      ::__pb::PrimitiveMut::from_inner(
        ::__pb::__internal::Private,
        unsafe {
          ::__pb::__internal::RawVTableMutator::new(
            ::__pb::__internal::Private,
            ::__pb::__runtime::MutatorMessageRef::new(
              ::__pb::__internal::Private, &mut self.inner
            ),
            &VTABLE,
          )
        },
      )
  }

  // string: optional string
  pub fn r#string(&self) -> &::__pb::ProtoStr {
    let view = unsafe { example_TestCodeGenMessage_string(self.inner.msg).as_ref() };
    // SAFETY: The runtime doesn't require ProtoStr to be UTF-8.
    unsafe { ::__pb::ProtoStr::from_utf8_unchecked(view) }
  }

  pub fn string_mut(&mut self) -> ::__pb::Mut<'_, ::__pb::ProtoStr> {
    static VTABLE: ::__pb::__internal::BytesMutVTable = unsafe {
      ::__pb::__internal::BytesMutVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_string,
        example_TestCodeGenMessage_set_string,
      )
    };
    unsafe {
      <::__pb::Mut<::__pb::ProtoStr>>::from_inner(
        ::__pb::__internal::Private,
        ::__pb::__internal::RawVTableMutator::new(
          ::__pb::__internal::Private,
          ::__pb::__runtime::MutatorMessageRef::new(
            ::__pb::__internal::Private, &mut self.inner),
          &VTABLE,
        )
      )
    }
  }

  // bytes: optional bytes
  pub fn r#bytes(&self) -> &[u8] {
    let view = unsafe { example_TestCodeGenMessage_bytes(self.inner.msg).as_ref() };
    view
  }

  pub fn bytes_mut(&mut self) -> ::__pb::Mut<'_, [u8]> {
    static VTABLE: ::__pb::__internal::BytesMutVTable = unsafe {
      ::__pb::__internal::BytesMutVTable::new(
        ::__pb::__internal::Private,
        example_TestCodeGenMessage_bytes,
        example_TestCodeGenMessage_set_bytes,
      )
    };
    unsafe {
      <::__pb::Mut<[u8]>>::from_inner(
        ::__pb::__internal::Private,
        ::__pb::__internal::RawVTableMutator::new(
          ::__pb::__internal::Private,
          ::__pb::__runtime::MutatorMessageRef::new(
            ::__pb::__internal::Private, &mut self.inner),
          &VTABLE,
        )
      )
    }
  }

  // map: repeated message example.TestCodeGenMessage.MapEntry
  // Unsupported! :(


  // repeated: repeated string
  // Unsupported! :(


  // an_enum: optional enum example.TestCodeGenEnum
  // Unsupported! :(


  // or_a_boolean: optional bool
  pub fn r#or_a_boolean(&self) -> bool {
    unsafe { example_TestCodeGenMessage_or_a_boolean(self.inner.msg) }
  }
  pub fn r#or_a_boolean_opt(&self) -> ::__pb::Optional<bool> {
    if !unsafe { example_TestCodeGenMessage_has_or_a_boolean(self.inner.msg) } {
      return ::__pb::Optional::Unset(<bool>::default());
    }
    let value = unsafe { example_TestCodeGenMessage_or_a_boolean(self.inner.msg) };
    ::__pb::Optional::Set(value)
  }
  pub fn r#or_a_boolean_set(&mut self, val: Option<bool>) {
    match val {
      Some(val) => unsafe { example_TestCodeGenMessage_set_or_a_boolean(self.inner.msg, val) },
      None => unsafe { example_TestCodeGenMessage_clear_or_a_boolean(self.inner.msg) },
    }
  }

  // duration: optional message google.protobuf.Duration
  pub fn r#duration(&self) -> crate::google::protobuf::DurationView {
    let submsg = unsafe { example_TestCodeGenMessage_duration(self.inner.msg) };
    // For upb, getters return null if the field is unset, so we need to
    // check for null and return the default instance manually. Note that
    // a null ptr received from upb manifests as Option::None
    match submsg {
        // TODO:(b/304357029)
        None => crate::google::protobuf::DurationView::new(::__pb::__internal::Private, ::__pb::__runtime::ScratchSpace::zeroed_block()),
        Some(field) => crate::google::protobuf::DurationView::new(::__pb::__internal::Private, field),
      }
  }


  pub fn r#TestCodeGenOneof(&self) -> TestCodeGenMessage_::TestCodeGenOneof {
    match unsafe { example_TestCodeGenMessage_TestCodeGenOneof_case(self.inner.msg) } {
      TestCodeGenMessage_::TestCodeGenOneofCase::OrABoolean => TestCodeGenMessage_::TestCodeGenOneof::OrABoolean(self.or_a_boolean()),
      _ => TestCodeGenMessage_::TestCodeGenOneof::not_set(std::marker::PhantomData)
    }
  }

  pub fn r#TestCodeGenOneof_mut(&mut self) -> TestCodeGenMessage_::TestCodeGenOneofMut {
    match unsafe { example_TestCodeGenMessage_TestCodeGenOneof_case(self.inner.msg) } {
      _ => TestCodeGenMessage_::TestCodeGenOneofMut::not_set(std::marker::PhantomData)
    }
  }

}  // impl TestCodeGenMessage

impl ::__std::ops::Drop for TestCodeGenMessage {
  fn drop(&mut self) {
  }
}

extern "C" {
  fn example_TestCodeGenMessage_new(arena: ::__pb::__internal::RawArena) -> ::__pb::__internal::RawMessage;
  fn example_TestCodeGenMessage_serialize(msg: ::__pb::__internal::RawMessage, arena: ::__pb::__internal::RawArena, len: &mut usize) -> ::__std::ptr::NonNull<u8>;
  fn example_TestCodeGenMessage_parse(data: *const u8, size: usize, arena: ::__pb::__internal::RawArena) -> Option<::__pb::__internal::RawMessage>;

  fn example_TestCodeGenMessage_double(raw_msg: ::__pb::__internal::RawMessage) -> f64;
  fn example_TestCodeGenMessage_set_double(raw_msg: ::__pb::__internal::RawMessage, val: f64);
  fn example_TestCodeGenMessage_clear_double(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_float(raw_msg: ::__pb::__internal::RawMessage) -> f32;
  fn example_TestCodeGenMessage_set_float(raw_msg: ::__pb::__internal::RawMessage, val: f32);
  fn example_TestCodeGenMessage_clear_float(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_int32(raw_msg: ::__pb::__internal::RawMessage) -> i32;
  fn example_TestCodeGenMessage_set_int32(raw_msg: ::__pb::__internal::RawMessage, val: i32);
  fn example_TestCodeGenMessage_clear_int32(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_int64(raw_msg: ::__pb::__internal::RawMessage) -> i64;
  fn example_TestCodeGenMessage_set_int64(raw_msg: ::__pb::__internal::RawMessage, val: i64);
  fn example_TestCodeGenMessage_clear_int64(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_uint32(raw_msg: ::__pb::__internal::RawMessage) -> u32;
  fn example_TestCodeGenMessage_set_uint32(raw_msg: ::__pb::__internal::RawMessage, val: u32);
  fn example_TestCodeGenMessage_clear_uint32(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_uint64(raw_msg: ::__pb::__internal::RawMessage) -> u64;
  fn example_TestCodeGenMessage_set_uint64(raw_msg: ::__pb::__internal::RawMessage, val: u64);
  fn example_TestCodeGenMessage_clear_uint64(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_sint32(raw_msg: ::__pb::__internal::RawMessage) -> i32;
  fn example_TestCodeGenMessage_set_sint32(raw_msg: ::__pb::__internal::RawMessage, val: i32);
  fn example_TestCodeGenMessage_clear_sint32(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_sint64(raw_msg: ::__pb::__internal::RawMessage) -> i64;
  fn example_TestCodeGenMessage_set_sint64(raw_msg: ::__pb::__internal::RawMessage, val: i64);
  fn example_TestCodeGenMessage_clear_sint64(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_fixed32(raw_msg: ::__pb::__internal::RawMessage) -> u32;
  fn example_TestCodeGenMessage_set_fixed32(raw_msg: ::__pb::__internal::RawMessage, val: u32);
  fn example_TestCodeGenMessage_clear_fixed32(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_fixed64(raw_msg: ::__pb::__internal::RawMessage) -> u64;
  fn example_TestCodeGenMessage_set_fixed64(raw_msg: ::__pb::__internal::RawMessage, val: u64);
  fn example_TestCodeGenMessage_clear_fixed64(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_sfixed32(raw_msg: ::__pb::__internal::RawMessage) -> i32;
  fn example_TestCodeGenMessage_set_sfixed32(raw_msg: ::__pb::__internal::RawMessage, val: i32);
  fn example_TestCodeGenMessage_clear_sfixed32(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_sfixed64(raw_msg: ::__pb::__internal::RawMessage) -> i64;
  fn example_TestCodeGenMessage_set_sfixed64(raw_msg: ::__pb::__internal::RawMessage, val: i64);
  fn example_TestCodeGenMessage_clear_sfixed64(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_bool(raw_msg: ::__pb::__internal::RawMessage) -> bool;
  fn example_TestCodeGenMessage_set_bool(raw_msg: ::__pb::__internal::RawMessage, val: bool);
  fn example_TestCodeGenMessage_clear_bool(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_string(raw_msg: ::__pb::__internal::RawMessage) -> ::__pb::__internal::PtrAndLen;
  fn example_TestCodeGenMessage_set_string(raw_msg: ::__pb::__internal::RawMessage, val: ::__pb::__internal::PtrAndLen);
  fn example_TestCodeGenMessage_clear_string(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_bytes(raw_msg: ::__pb::__internal::RawMessage) -> ::__pb::__internal::PtrAndLen;
  fn example_TestCodeGenMessage_set_bytes(raw_msg: ::__pb::__internal::RawMessage, val: ::__pb::__internal::PtrAndLen);
  fn example_TestCodeGenMessage_clear_bytes(raw_msg: ::__pb::__internal::RawMessage);




  fn example_TestCodeGenMessage_has_or_a_boolean(raw_msg: ::__pb::__internal::RawMessage) -> bool;
  fn example_TestCodeGenMessage_or_a_boolean(raw_msg: ::__pb::__internal::RawMessage) -> bool;
  fn example_TestCodeGenMessage_set_or_a_boolean(raw_msg: ::__pb::__internal::RawMessage, val: bool);
  fn example_TestCodeGenMessage_clear_or_a_boolean(raw_msg: ::__pb::__internal::RawMessage);

  fn example_TestCodeGenMessage_duration(raw_msg: ::__pb::__internal::RawMessage) -> Option<::__pb::__internal::RawMessage>;


  fn example_TestCodeGenMessage_TestCodeGenOneof_case(raw_msg: ::__pb::__internal::RawMessage) -> TestCodeGenMessage_::TestCodeGenOneofCase;

}  // extern "C" for TestCodeGenMessage

#[allow(non_snake_case)]
pub mod TestCodeGenMessage_ {

  #[non_exhaustive]
  #[derive(Debug)]
  #[allow(dead_code)]
  #[repr(isize)]
  pub enum TestCodeGenOneof<'msg> {
    OrABoolean(::__pb::View<'msg, bool>) = 19,

    #[allow(non_camel_case_types)]
    not_set(std::marker::PhantomData<&'msg ()>) = 0
  }

  #[non_exhaustive]
  #[derive(Debug)]
  #[allow(dead_code)]
  #[repr(isize)]
  pub enum TestCodeGenOneofMut<'msg> {
    OrABoolean(::__pb::Mut<'msg, bool>) = 19,

    #[allow(non_camel_case_types)]
    not_set(std::marker::PhantomData<&'msg ()>) = 0
  }
  #[repr(C)]
  #[derive(Debug, Copy, Clone, PartialEq, Eq)]
  pub(super) enum TestCodeGenOneofCase {
    AnEnum = 18,
    OrABoolean = 19,

    #[allow(non_camel_case_types)]
    not_set = 0
  }
}  // mod TestCodeGenMessage_

} // mod example

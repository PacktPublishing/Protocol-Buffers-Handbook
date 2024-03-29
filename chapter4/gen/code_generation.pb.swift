// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: code_generation.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

enum Example_TestCodeGenEnum: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case unspecified // = 0
  case another // = 1
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .another
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .another: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Example_TestCodeGenEnum: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static let allCases: [Example_TestCodeGenEnum] = [
    .unspecified,
    .another,
  ]
}

#endif  // swift(>=4.2)

struct Example_TestCodeGenMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var double: Double {
    get {return _storage._double}
    set {_uniqueStorage()._double = newValue}
  }

  var float: Float {
    get {return _storage._float}
    set {_uniqueStorage()._float = newValue}
  }

  var int32: Int32 {
    get {return _storage._int32}
    set {_uniqueStorage()._int32 = newValue}
  }

  var int64: Int64 {
    get {return _storage._int64}
    set {_uniqueStorage()._int64 = newValue}
  }

  var uint32: UInt32 {
    get {return _storage._uint32}
    set {_uniqueStorage()._uint32 = newValue}
  }

  var uint64: UInt64 {
    get {return _storage._uint64}
    set {_uniqueStorage()._uint64 = newValue}
  }

  var sint32: Int32 {
    get {return _storage._sint32}
    set {_uniqueStorage()._sint32 = newValue}
  }

  var sint64: Int64 {
    get {return _storage._sint64}
    set {_uniqueStorage()._sint64 = newValue}
  }

  var fixed32: UInt32 {
    get {return _storage._fixed32}
    set {_uniqueStorage()._fixed32 = newValue}
  }

  var fixed64: UInt64 {
    get {return _storage._fixed64}
    set {_uniqueStorage()._fixed64 = newValue}
  }

  var sfixed32: Int32 {
    get {return _storage._sfixed32}
    set {_uniqueStorage()._sfixed32 = newValue}
  }

  var sfixed64: Int64 {
    get {return _storage._sfixed64}
    set {_uniqueStorage()._sfixed64 = newValue}
  }

  var bool: Bool {
    get {return _storage._bool}
    set {_uniqueStorage()._bool = newValue}
  }

  var string: String {
    get {return _storage._string}
    set {_uniqueStorage()._string = newValue}
  }

  var bytes: Data {
    get {return _storage._bytes}
    set {_uniqueStorage()._bytes = newValue}
  }

  var map: Dictionary<String,Int32> {
    get {return _storage._map}
    set {_uniqueStorage()._map = newValue}
  }

  var repeated: [String] {
    get {return _storage._repeated}
    set {_uniqueStorage()._repeated = newValue}
  }

  var testCodeGenOneof: OneOf_TestCodeGenOneof? {
    get {return _storage._testCodeGenOneof}
    set {_uniqueStorage()._testCodeGenOneof = newValue}
  }

  var anEnum: Example_TestCodeGenEnum {
    get {
      if case .anEnum(let v)? = _storage._testCodeGenOneof {return v}
      return .unspecified
    }
    set {_uniqueStorage()._testCodeGenOneof = .anEnum(newValue)}
  }

  var orABoolean: Bool {
    get {
      if case .orABoolean(let v)? = _storage._testCodeGenOneof {return v}
      return false
    }
    set {_uniqueStorage()._testCodeGenOneof = .orABoolean(newValue)}
  }

  var duration: SwiftProtobuf.Google_Protobuf_Duration {
    get {return _storage._duration ?? SwiftProtobuf.Google_Protobuf_Duration()}
    set {_uniqueStorage()._duration = newValue}
  }
  /// Returns true if `duration` has been explicitly set.
  var hasDuration: Bool {return _storage._duration != nil}
  /// Clears the value of `duration`. Subsequent reads from it will return its default value.
  mutating func clearDuration() {_uniqueStorage()._duration = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_TestCodeGenOneof: Equatable {
    case anEnum(Example_TestCodeGenEnum)
    case orABoolean(Bool)

  #if !swift(>=4.1)
    static func ==(lhs: Example_TestCodeGenMessage.OneOf_TestCodeGenOneof, rhs: Example_TestCodeGenMessage.OneOf_TestCodeGenOneof) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.anEnum, .anEnum): return {
        guard case .anEnum(let l) = lhs, case .anEnum(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.orABoolean, .orABoolean): return {
        guard case .orABoolean(let l) = lhs, case .orABoolean(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Example_TestCodeGenEnum: @unchecked Sendable {}
extension Example_TestCodeGenMessage: @unchecked Sendable {}
extension Example_TestCodeGenMessage.OneOf_TestCodeGenOneof: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "example"

extension Example_TestCodeGenEnum: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "TEST_CODE_GEN_ENUM_UNSPECIFIED"),
    1: .same(proto: "TEST_CODE_GEN_ENUM_ANOTHER"),
  ]
}

extension Example_TestCodeGenMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TestCodeGenMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "double"),
    2: .same(proto: "float"),
    3: .same(proto: "int32"),
    4: .same(proto: "int64"),
    5: .same(proto: "uint32"),
    6: .same(proto: "uint64"),
    7: .same(proto: "sint32"),
    8: .same(proto: "sint64"),
    9: .same(proto: "fixed32"),
    10: .same(proto: "fixed64"),
    11: .same(proto: "sfixed32"),
    12: .same(proto: "sfixed64"),
    13: .same(proto: "bool"),
    14: .same(proto: "string"),
    15: .same(proto: "bytes"),
    16: .same(proto: "map"),
    17: .same(proto: "repeated"),
    18: .standard(proto: "an_enum"),
    19: .standard(proto: "or_a_boolean"),
    20: .same(proto: "duration"),
  ]

  fileprivate class _StorageClass {
    var _double: Double = 0
    var _float: Float = 0
    var _int32: Int32 = 0
    var _int64: Int64 = 0
    var _uint32: UInt32 = 0
    var _uint64: UInt64 = 0
    var _sint32: Int32 = 0
    var _sint64: Int64 = 0
    var _fixed32: UInt32 = 0
    var _fixed64: UInt64 = 0
    var _sfixed32: Int32 = 0
    var _sfixed64: Int64 = 0
    var _bool: Bool = false
    var _string: String = String()
    var _bytes: Data = Data()
    var _map: Dictionary<String,Int32> = [:]
    var _repeated: [String] = []
    var _testCodeGenOneof: Example_TestCodeGenMessage.OneOf_TestCodeGenOneof?
    var _duration: SwiftProtobuf.Google_Protobuf_Duration? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _double = source._double
      _float = source._float
      _int32 = source._int32
      _int64 = source._int64
      _uint32 = source._uint32
      _uint64 = source._uint64
      _sint32 = source._sint32
      _sint64 = source._sint64
      _fixed32 = source._fixed32
      _fixed64 = source._fixed64
      _sfixed32 = source._sfixed32
      _sfixed64 = source._sfixed64
      _bool = source._bool
      _string = source._string
      _bytes = source._bytes
      _map = source._map
      _repeated = source._repeated
      _testCodeGenOneof = source._testCodeGenOneof
      _duration = source._duration
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every case branch when no optimizations are
        // enabled. https://github.com/apple/swift-protobuf/issues/1034
        switch fieldNumber {
        case 1: try { try decoder.decodeSingularDoubleField(value: &_storage._double) }()
        case 2: try { try decoder.decodeSingularFloatField(value: &_storage._float) }()
        case 3: try { try decoder.decodeSingularInt32Field(value: &_storage._int32) }()
        case 4: try { try decoder.decodeSingularInt64Field(value: &_storage._int64) }()
        case 5: try { try decoder.decodeSingularUInt32Field(value: &_storage._uint32) }()
        case 6: try { try decoder.decodeSingularUInt64Field(value: &_storage._uint64) }()
        case 7: try { try decoder.decodeSingularSInt32Field(value: &_storage._sint32) }()
        case 8: try { try decoder.decodeSingularSInt64Field(value: &_storage._sint64) }()
        case 9: try { try decoder.decodeSingularFixed32Field(value: &_storage._fixed32) }()
        case 10: try { try decoder.decodeSingularFixed64Field(value: &_storage._fixed64) }()
        case 11: try { try decoder.decodeSingularSFixed32Field(value: &_storage._sfixed32) }()
        case 12: try { try decoder.decodeSingularSFixed64Field(value: &_storage._sfixed64) }()
        case 13: try { try decoder.decodeSingularBoolField(value: &_storage._bool) }()
        case 14: try { try decoder.decodeSingularStringField(value: &_storage._string) }()
        case 15: try { try decoder.decodeSingularBytesField(value: &_storage._bytes) }()
        case 16: try { try decoder.decodeMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufInt32>.self, value: &_storage._map) }()
        case 17: try { try decoder.decodeRepeatedStringField(value: &_storage._repeated) }()
        case 18: try {
          var v: Example_TestCodeGenEnum?
          try decoder.decodeSingularEnumField(value: &v)
          if let v = v {
            if _storage._testCodeGenOneof != nil {try decoder.handleConflictingOneOf()}
            _storage._testCodeGenOneof = .anEnum(v)
          }
        }()
        case 19: try {
          var v: Bool?
          try decoder.decodeSingularBoolField(value: &v)
          if let v = v {
            if _storage._testCodeGenOneof != nil {try decoder.handleConflictingOneOf()}
            _storage._testCodeGenOneof = .orABoolean(v)
          }
        }()
        case 20: try { try decoder.decodeSingularMessageField(value: &_storage._duration) }()
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every if/case branch local when no optimizations
      // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
      // https://github.com/apple/swift-protobuf/issues/1182
      if _storage._double != 0 {
        try visitor.visitSingularDoubleField(value: _storage._double, fieldNumber: 1)
      }
      if _storage._float != 0 {
        try visitor.visitSingularFloatField(value: _storage._float, fieldNumber: 2)
      }
      if _storage._int32 != 0 {
        try visitor.visitSingularInt32Field(value: _storage._int32, fieldNumber: 3)
      }
      if _storage._int64 != 0 {
        try visitor.visitSingularInt64Field(value: _storage._int64, fieldNumber: 4)
      }
      if _storage._uint32 != 0 {
        try visitor.visitSingularUInt32Field(value: _storage._uint32, fieldNumber: 5)
      }
      if _storage._uint64 != 0 {
        try visitor.visitSingularUInt64Field(value: _storage._uint64, fieldNumber: 6)
      }
      if _storage._sint32 != 0 {
        try visitor.visitSingularSInt32Field(value: _storage._sint32, fieldNumber: 7)
      }
      if _storage._sint64 != 0 {
        try visitor.visitSingularSInt64Field(value: _storage._sint64, fieldNumber: 8)
      }
      if _storage._fixed32 != 0 {
        try visitor.visitSingularFixed32Field(value: _storage._fixed32, fieldNumber: 9)
      }
      if _storage._fixed64 != 0 {
        try visitor.visitSingularFixed64Field(value: _storage._fixed64, fieldNumber: 10)
      }
      if _storage._sfixed32 != 0 {
        try visitor.visitSingularSFixed32Field(value: _storage._sfixed32, fieldNumber: 11)
      }
      if _storage._sfixed64 != 0 {
        try visitor.visitSingularSFixed64Field(value: _storage._sfixed64, fieldNumber: 12)
      }
      if _storage._bool != false {
        try visitor.visitSingularBoolField(value: _storage._bool, fieldNumber: 13)
      }
      if !_storage._string.isEmpty {
        try visitor.visitSingularStringField(value: _storage._string, fieldNumber: 14)
      }
      if !_storage._bytes.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._bytes, fieldNumber: 15)
      }
      if !_storage._map.isEmpty {
        try visitor.visitMapField(fieldType: SwiftProtobuf._ProtobufMap<SwiftProtobuf.ProtobufString,SwiftProtobuf.ProtobufInt32>.self, value: _storage._map, fieldNumber: 16)
      }
      if !_storage._repeated.isEmpty {
        try visitor.visitRepeatedStringField(value: _storage._repeated, fieldNumber: 17)
      }
      switch _storage._testCodeGenOneof {
      case .anEnum?: try {
        guard case .anEnum(let v)? = _storage._testCodeGenOneof else { preconditionFailure() }
        try visitor.visitSingularEnumField(value: v, fieldNumber: 18)
      }()
      case .orABoolean?: try {
        guard case .orABoolean(let v)? = _storage._testCodeGenOneof else { preconditionFailure() }
        try visitor.visitSingularBoolField(value: v, fieldNumber: 19)
      }()
      case nil: break
      }
      try { if let v = _storage._duration {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 20)
      } }()
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Example_TestCodeGenMessage, rhs: Example_TestCodeGenMessage) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._double != rhs_storage._double {return false}
        if _storage._float != rhs_storage._float {return false}
        if _storage._int32 != rhs_storage._int32 {return false}
        if _storage._int64 != rhs_storage._int64 {return false}
        if _storage._uint32 != rhs_storage._uint32 {return false}
        if _storage._uint64 != rhs_storage._uint64 {return false}
        if _storage._sint32 != rhs_storage._sint32 {return false}
        if _storage._sint64 != rhs_storage._sint64 {return false}
        if _storage._fixed32 != rhs_storage._fixed32 {return false}
        if _storage._fixed64 != rhs_storage._fixed64 {return false}
        if _storage._sfixed32 != rhs_storage._sfixed32 {return false}
        if _storage._sfixed64 != rhs_storage._sfixed64 {return false}
        if _storage._bool != rhs_storage._bool {return false}
        if _storage._string != rhs_storage._string {return false}
        if _storage._bytes != rhs_storage._bytes {return false}
        if _storage._map != rhs_storage._map {return false}
        if _storage._repeated != rhs_storage._repeated {return false}
        if _storage._testCodeGenOneof != rhs_storage._testCodeGenOneof {return false}
        if _storage._duration != rhs_storage._duration {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

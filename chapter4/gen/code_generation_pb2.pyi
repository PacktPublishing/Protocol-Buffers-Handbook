from google.protobuf import duration_pb2 as _duration_pb2
from google.protobuf.internal import containers as _containers
from google.protobuf.internal import enum_type_wrapper as _enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from typing import ClassVar as _ClassVar, Iterable as _Iterable, Mapping as _Mapping, Optional as _Optional, Union as _Union

DESCRIPTOR: _descriptor.FileDescriptor

class TestCodeGenEnum(int, metaclass=_enum_type_wrapper.EnumTypeWrapper):
    __slots__ = ()
    TEST_CODE_GEN_ENUM_UNSPECIFIED: _ClassVar[TestCodeGenEnum]
    TEST_CODE_GEN_ENUM_ANOTHER: _ClassVar[TestCodeGenEnum]
TEST_CODE_GEN_ENUM_UNSPECIFIED: TestCodeGenEnum
TEST_CODE_GEN_ENUM_ANOTHER: TestCodeGenEnum

class TestCodeGenMessage(_message.Message):
    __slots__ = ("double", "float", "int32", "int64", "uint32", "uint64", "sint32", "sint64", "fixed32", "fixed64", "sfixed32", "sfixed64", "bool", "string", "bytes", "map", "repeated", "an_enum", "or_a_boolean", "duration")
    class MapEntry(_message.Message):
        __slots__ = ("key", "value")
        KEY_FIELD_NUMBER: _ClassVar[int]
        VALUE_FIELD_NUMBER: _ClassVar[int]
        key: str
        value: int
        def __init__(self, key: _Optional[str] = ..., value: _Optional[int] = ...) -> None: ...
    DOUBLE_FIELD_NUMBER: _ClassVar[int]
    FLOAT_FIELD_NUMBER: _ClassVar[int]
    INT32_FIELD_NUMBER: _ClassVar[int]
    INT64_FIELD_NUMBER: _ClassVar[int]
    UINT32_FIELD_NUMBER: _ClassVar[int]
    UINT64_FIELD_NUMBER: _ClassVar[int]
    SINT32_FIELD_NUMBER: _ClassVar[int]
    SINT64_FIELD_NUMBER: _ClassVar[int]
    FIXED32_FIELD_NUMBER: _ClassVar[int]
    FIXED64_FIELD_NUMBER: _ClassVar[int]
    SFIXED32_FIELD_NUMBER: _ClassVar[int]
    SFIXED64_FIELD_NUMBER: _ClassVar[int]
    BOOL_FIELD_NUMBER: _ClassVar[int]
    STRING_FIELD_NUMBER: _ClassVar[int]
    BYTES_FIELD_NUMBER: _ClassVar[int]
    MAP_FIELD_NUMBER: _ClassVar[int]
    REPEATED_FIELD_NUMBER: _ClassVar[int]
    AN_ENUM_FIELD_NUMBER: _ClassVar[int]
    OR_A_BOOLEAN_FIELD_NUMBER: _ClassVar[int]
    DURATION_FIELD_NUMBER: _ClassVar[int]
    double: float
    float: float
    int32: int
    int64: int
    uint32: int
    uint64: int
    sint32: int
    sint64: int
    fixed32: int
    fixed64: int
    sfixed32: int
    sfixed64: int
    bool: bool
    string: str
    bytes: bytes
    map: _containers.ScalarMap[str, int]
    repeated: _containers.RepeatedScalarFieldContainer[str]
    an_enum: TestCodeGenEnum
    or_a_boolean: bool
    duration: _duration_pb2.Duration
    def __init__(self, double: _Optional[float] = ..., float: _Optional[float] = ..., int32: _Optional[int] = ..., int64: _Optional[int] = ..., uint32: _Optional[int] = ..., uint64: _Optional[int] = ..., sint32: _Optional[int] = ..., sint64: _Optional[int] = ..., fixed32: _Optional[int] = ..., fixed64: _Optional[int] = ..., sfixed32: _Optional[int] = ..., sfixed64: _Optional[int] = ..., bool: bool = ..., string: _Optional[str] = ..., bytes: _Optional[bytes] = ..., map: _Optional[_Mapping[str, int]] = ..., repeated: _Optional[_Iterable[str]] = ..., an_enum: _Optional[_Union[TestCodeGenEnum, str]] = ..., or_a_boolean: bool = ..., duration: _Optional[_Union[_duration_pb2.Duration, _Mapping]] = ...) -> None: ...

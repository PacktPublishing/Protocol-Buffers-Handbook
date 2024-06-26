// Generated by the protocol buffer compiler.  DO NOT EDIT!
// clang-format off
// source: code_generation.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers_RuntimeSupport.h>
#else
 #import "GPBProtocolBuffers_RuntimeSupport.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30007
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30007 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

#import <stdatomic.h>

#import "CodeGeneration.pbobjc.h"
// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wdirect-ivar-access"
#pragma clang diagnostic ignored "-Wdollar-in-identifier-extension"

#pragma mark - Objective-C Class declarations
// Forward declarations of Objective-C classes that we can use as
// static values in struct initializers.
// We don't use [Foo class] because it is not a static value.
GPBObjCClassDeclaration(GPBDuration);
GPBObjCClassDeclaration(TestCodeGenMessage);

#pragma mark - CodeGenerationRoot

@implementation CodeGenerationRoot

// No extensions in the file and no imports or none of the imports (direct or
// indirect) defined extensions, so no need to generate +extensionRegistry.

@end

static GPBFileDescription CodeGenerationRoot_FileDescription = {
  .package = "example",
  .prefix = NULL,
  .syntax = GPBFileSyntaxProto3
};

#pragma mark - Enum TestCodeGenEnum

GPBEnumDescriptor *TestCodeGenEnum_EnumDescriptor(void) {
  static _Atomic(GPBEnumDescriptor*) descriptor = nil;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    static const char *valueNames =
        "TestCodeGenEnumUnspecified\000TestCodeGenEn"
        "umAnother\000";
    static const int32_t values[] = {
        TestCodeGenEnum_TestCodeGenEnumUnspecified,
        TestCodeGenEnum_TestCodeGenEnumAnother,
    };
    GPBEnumDescriptor *worker =
        [GPBEnumDescriptor allocDescriptorForName:GPBNSStringifySymbol(TestCodeGenEnum)
                                       valueNames:valueNames
                                           values:values
                                            count:(uint32_t)(sizeof(values) / sizeof(int32_t))
                                     enumVerifier:TestCodeGenEnum_IsValidValue
                                            flags:GPBEnumDescriptorInitializationFlag_None];
    GPBEnumDescriptor *expected = nil;
    if (!atomic_compare_exchange_strong(&descriptor, &expected, worker)) {
      [worker release];
    }
  }
  return descriptor;
}

BOOL TestCodeGenEnum_IsValidValue(int32_t value__) {
  switch (value__) {
    case TestCodeGenEnum_TestCodeGenEnumUnspecified:
    case TestCodeGenEnum_TestCodeGenEnumAnother:
      return YES;
    default:
      return NO;
  }
}

#pragma mark - TestCodeGenMessage

@implementation TestCodeGenMessage

@dynamic testCodeGenOneofOneOfCase;
@dynamic double_p;
@dynamic float_p;
@dynamic int32;
@dynamic int64;
@dynamic uint32;
@dynamic uint64;
@dynamic sint32;
@dynamic sint64;
@dynamic fixed32;
@dynamic fixed64;
@dynamic sfixed32;
@dynamic sfixed64;
@dynamic bool_p;
@dynamic string;
@dynamic bytes;
@dynamic map, map_Count;
@dynamic repeatedArray, repeatedArray_Count;
@dynamic anEnum;
@dynamic orABoolean;
@dynamic hasDuration, duration;

typedef struct TestCodeGenMessage__storage_ {
  uint32_t _has_storage_[2];
  float float_p;
  int32_t int32;
  uint32_t uint32;
  int32_t sint32;
  uint32_t fixed32;
  int32_t sfixed32;
  TestCodeGenEnum anEnum;
  NSString *string;
  NSData *bytes;
  GPBStringInt32Dictionary *map;
  NSMutableArray *repeatedArray;
  GPBDuration *duration;
  double double_p;
  int64_t int64;
  uint64_t uint64;
  int64_t sint64;
  uint64_t fixed64;
  int64_t sfixed64;
} TestCodeGenMessage__storage_;

// This method is threadsafe because it is initially called
// in +initialize for each subclass.
+ (GPBDescriptor *)descriptor {
  static GPBDescriptor *descriptor = nil;
  if (!descriptor) {
    GPB_DEBUG_CHECK_RUNTIME_VERSIONS();
    static GPBMessageFieldDescription fields[] = {
      {
        .name = "double_p",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Double_p,
        .hasIndex = 0,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, double_p),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeDouble,
      },
      {
        .name = "float_p",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Float_p,
        .hasIndex = 1,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, float_p),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeFloat,
      },
      {
        .name = "int32",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Int32,
        .hasIndex = 2,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, int32),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "int64",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Int64,
        .hasIndex = 3,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, int64),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeInt64,
      },
      {
        .name = "uint32",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Uint32,
        .hasIndex = 4,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, uint32),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeUInt32,
      },
      {
        .name = "uint64",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Uint64,
        .hasIndex = 5,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, uint64),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeUInt64,
      },
      {
        .name = "sint32",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Sint32,
        .hasIndex = 6,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, sint32),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeSInt32,
      },
      {
        .name = "sint64",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Sint64,
        .hasIndex = 7,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, sint64),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeSInt64,
      },
      {
        .name = "fixed32",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Fixed32,
        .hasIndex = 8,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, fixed32),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeFixed32,
      },
      {
        .name = "fixed64",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Fixed64,
        .hasIndex = 9,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, fixed64),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeFixed64,
      },
      {
        .name = "sfixed32",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Sfixed32,
        .hasIndex = 10,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, sfixed32),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeSFixed32,
      },
      {
        .name = "sfixed64",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Sfixed64,
        .hasIndex = 11,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, sfixed64),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeSFixed64,
      },
      {
        .name = "bool_p",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Bool_p,
        .hasIndex = 12,
        .offset = 13,  // Stored in _has_storage_ to save space.
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "string",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_String,
        .hasIndex = 14,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, string),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeString,
      },
      {
        .name = "bytes",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Bytes,
        .hasIndex = 15,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, bytes),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldClearHasIvarOnZero),
        .dataType = GPBDataTypeBytes,
      },
      {
        .name = "map",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_Map,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, map),
        .flags = GPBFieldMapKeyString,
        .dataType = GPBDataTypeInt32,
      },
      {
        .name = "repeatedArray",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_RepeatedArray,
        .hasIndex = GPBNoHasBit,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, repeatedArray),
        .flags = GPBFieldRepeated,
        .dataType = GPBDataTypeString,
      },
      {
        .name = "anEnum",
        .dataTypeSpecific.enumDescFunc = TestCodeGenEnum_EnumDescriptor,
        .number = TestCodeGenMessage_FieldNumber_AnEnum,
        .hasIndex = -1,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, anEnum),
        .flags = (GPBFieldFlags)(GPBFieldOptional | GPBFieldHasEnumDescriptor),
        .dataType = GPBDataTypeEnum,
      },
      {
        .name = "orABoolean",
        .dataTypeSpecific.clazz = Nil,
        .number = TestCodeGenMessage_FieldNumber_OrABoolean,
        .hasIndex = -1,
        .offset = 16,  // Stored in _has_storage_ to save space.
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeBool,
      },
      {
        .name = "duration",
        .dataTypeSpecific.clazz = GPBObjCClass(GPBDuration),
        .number = TestCodeGenMessage_FieldNumber_Duration,
        .hasIndex = 17,
        .offset = (uint32_t)offsetof(TestCodeGenMessage__storage_, duration),
        .flags = GPBFieldOptional,
        .dataType = GPBDataTypeMessage,
      },
    };
    GPBDescriptor *localDescriptor =
        [GPBDescriptor allocDescriptorForClass:GPBObjCClass(TestCodeGenMessage)
                                   messageName:@"TestCodeGenMessage"
                               fileDescription:&CodeGenerationRoot_FileDescription
                                        fields:fields
                                    fieldCount:(uint32_t)(sizeof(fields) / sizeof(GPBMessageFieldDescription))
                                   storageSize:sizeof(TestCodeGenMessage__storage_)
                                         flags:(GPBDescriptorInitializationFlags)(GPBDescriptorInitializationFlag_UsesClassRefs | GPBDescriptorInitializationFlag_Proto3OptionalKnown | GPBDescriptorInitializationFlag_ClosedEnumSupportKnown)];
    static const char *oneofs[] = {
      "testCodeGenOneof",
    };
    [localDescriptor setupOneofs:oneofs
                           count:(uint32_t)(sizeof(oneofs) / sizeof(char*))
                   firstHasIndex:-1];
    #if defined(DEBUG) && DEBUG
      NSAssert(descriptor == nil, @"Startup recursed!");
    #endif  // DEBUG
    descriptor = localDescriptor;
  }
  return descriptor;
}

@end

int32_t TestCodeGenMessage_AnEnum_RawValue(TestCodeGenMessage *message) {
  GPBDescriptor *descriptor = [TestCodeGenMessage descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:TestCodeGenMessage_FieldNumber_AnEnum];
  return GPBGetMessageRawEnumField(message, field);
}

void SetTestCodeGenMessage_AnEnum_RawValue(TestCodeGenMessage *message, int32_t value) {
  GPBDescriptor *descriptor = [TestCodeGenMessage descriptor];
  GPBFieldDescriptor *field = [descriptor fieldWithNumber:TestCodeGenMessage_FieldNumber_AnEnum];
  GPBSetMessageRawEnumField(message, field, value);
}

void TestCodeGenMessage_ClearTestCodeGenOneofOneOfCase(TestCodeGenMessage *message) {
  GPBDescriptor *descriptor = [TestCodeGenMessage descriptor];
  GPBOneofDescriptor *oneof = [descriptor.oneofs objectAtIndex:0];
  GPBClearOneof(message, oneof);
}

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)

// clang-format on

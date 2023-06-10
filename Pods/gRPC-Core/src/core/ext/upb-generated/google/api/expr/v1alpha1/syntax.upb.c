/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     google/api/expr/v1alpha1/syntax.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/msg_internal.h"
#include "google/api/expr/v1alpha1/syntax.upb.h"
#include "google/protobuf/duration.upb.h"
#include "google/protobuf/struct.upb.h"
#include "google/protobuf/timestamp.upb.h"

#include "upb/port_def.inc"

static const upb_MiniTable_Sub google_api_expr_v1alpha1_ParsedExpr_submsgs[2] = {
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
  {.submsg = &google_api_expr_v1alpha1_SourceInfo_msginit},
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_ParsedExpr__fields[2] = {
  {2, UPB_SIZE(4, 8), UPB_SIZE(1, 1), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(8, 16), UPB_SIZE(2, 2), 1, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_ParsedExpr_msginit = {
  &google_api_expr_v1alpha1_ParsedExpr_submsgs[0],
  &google_api_expr_v1alpha1_ParsedExpr__fields[0],
  UPB_SIZE(16, 24), 2, kUpb_ExtMode_NonExtendable, 0, 255, 0,
};

static const upb_MiniTable_Sub google_api_expr_v1alpha1_Expr_submsgs[7] = {
  {.submsg = &google_api_expr_v1alpha1_Constant_msginit},
  {.submsg = &google_api_expr_v1alpha1_Expr_Ident_msginit},
  {.submsg = &google_api_expr_v1alpha1_Expr_Select_msginit},
  {.submsg = &google_api_expr_v1alpha1_Expr_Call_msginit},
  {.submsg = &google_api_expr_v1alpha1_Expr_CreateList_msginit},
  {.submsg = &google_api_expr_v1alpha1_Expr_CreateStruct_msginit},
  {.submsg = &google_api_expr_v1alpha1_Expr_Comprehension_msginit},
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_Expr__fields[8] = {
  {2, UPB_SIZE(8, 16), UPB_SIZE(0, 0), kUpb_NoSub, 3, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(4, 8), UPB_SIZE(-1, -1), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(4, 8), UPB_SIZE(-1, -1), 1, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {5, UPB_SIZE(4, 8), UPB_SIZE(-1, -1), 2, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {6, UPB_SIZE(4, 8), UPB_SIZE(-1, -1), 3, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {7, UPB_SIZE(4, 8), UPB_SIZE(-1, -1), 4, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {8, UPB_SIZE(4, 8), UPB_SIZE(-1, -1), 5, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {9, UPB_SIZE(4, 8), UPB_SIZE(-1, -1), 6, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_Expr_msginit = {
  &google_api_expr_v1alpha1_Expr_submsgs[0],
  &google_api_expr_v1alpha1_Expr__fields[0],
  UPB_SIZE(16, 24), 8, kUpb_ExtMode_NonExtendable, 0, 255, 0,
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_Expr_Ident__fields[1] = {
  {1, UPB_SIZE(0, 0), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_Expr_Ident_msginit = {
  NULL,
  &google_api_expr_v1alpha1_Expr_Ident__fields[0],
  UPB_SIZE(8, 16), 1, kUpb_ExtMode_NonExtendable, 1, 255, 0,
};

static const upb_MiniTable_Sub google_api_expr_v1alpha1_Expr_Select_submsgs[1] = {
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_Expr_Select__fields[3] = {
  {1, UPB_SIZE(4, 8), UPB_SIZE(1, 1), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(8, 16), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(1, 1), UPB_SIZE(0, 0), kUpb_NoSub, 8, kUpb_FieldMode_Scalar | (kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_Expr_Select_msginit = {
  &google_api_expr_v1alpha1_Expr_Select_submsgs[0],
  &google_api_expr_v1alpha1_Expr_Select__fields[0],
  UPB_SIZE(16, 32), 3, kUpb_ExtMode_NonExtendable, 3, 255, 0,
};

static const upb_MiniTable_Sub google_api_expr_v1alpha1_Expr_Call_submsgs[2] = {
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_Expr_Call__fields[3] = {
  {1, UPB_SIZE(4, 8), UPB_SIZE(1, 1), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(8, 16), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(16, 32), UPB_SIZE(0, 0), 1, 11, kUpb_FieldMode_Array | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_Expr_Call_msginit = {
  &google_api_expr_v1alpha1_Expr_Call_submsgs[0],
  &google_api_expr_v1alpha1_Expr_Call__fields[0],
  UPB_SIZE(24, 40), 3, kUpb_ExtMode_NonExtendable, 3, 255, 0,
};

static const upb_MiniTable_Sub google_api_expr_v1alpha1_Expr_CreateList_submsgs[1] = {
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_Expr_CreateList__fields[1] = {
  {1, UPB_SIZE(0, 0), UPB_SIZE(0, 0), 0, 11, kUpb_FieldMode_Array | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_Expr_CreateList_msginit = {
  &google_api_expr_v1alpha1_Expr_CreateList_submsgs[0],
  &google_api_expr_v1alpha1_Expr_CreateList__fields[0],
  UPB_SIZE(8, 8), 1, kUpb_ExtMode_NonExtendable, 1, 255, 0,
};

static const upb_MiniTable_Sub google_api_expr_v1alpha1_Expr_CreateStruct_submsgs[1] = {
  {.submsg = &google_api_expr_v1alpha1_Expr_CreateStruct_Entry_msginit},
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_Expr_CreateStruct__fields[2] = {
  {1, UPB_SIZE(0, 0), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(8, 16), UPB_SIZE(0, 0), 0, 11, kUpb_FieldMode_Array | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_Expr_CreateStruct_msginit = {
  &google_api_expr_v1alpha1_Expr_CreateStruct_submsgs[0],
  &google_api_expr_v1alpha1_Expr_CreateStruct__fields[0],
  UPB_SIZE(16, 24), 2, kUpb_ExtMode_NonExtendable, 2, 255, 0,
};

static const upb_MiniTable_Sub google_api_expr_v1alpha1_Expr_CreateStruct_Entry_submsgs[2] = {
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_Expr_CreateStruct_Entry__fields[4] = {
  {1, UPB_SIZE(24, 32), UPB_SIZE(0, 0), kUpb_NoSub, 3, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(8, 8), UPB_SIZE(-5, -5), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(8, 8), UPB_SIZE(-5, -5), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(16, 24), UPB_SIZE(1, 1), 1, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_Expr_CreateStruct_Entry_msginit = {
  &google_api_expr_v1alpha1_Expr_CreateStruct_Entry_submsgs[0],
  &google_api_expr_v1alpha1_Expr_CreateStruct_Entry__fields[0],
  UPB_SIZE(32, 40), 4, kUpb_ExtMode_NonExtendable, 4, 255, 0,
};

static const upb_MiniTable_Sub google_api_expr_v1alpha1_Expr_Comprehension_submsgs[5] = {
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_Expr_Comprehension__fields[7] = {
  {1, UPB_SIZE(4, 8), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(12, 24), UPB_SIZE(1, 1), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(16, 32), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(24, 48), UPB_SIZE(2, 2), 1, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {5, UPB_SIZE(28, 56), UPB_SIZE(3, 3), 2, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {6, UPB_SIZE(32, 64), UPB_SIZE(4, 4), 3, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {7, UPB_SIZE(36, 72), UPB_SIZE(5, 5), 4, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_Expr_Comprehension_msginit = {
  &google_api_expr_v1alpha1_Expr_Comprehension_submsgs[0],
  &google_api_expr_v1alpha1_Expr_Comprehension__fields[0],
  UPB_SIZE(40, 80), 7, kUpb_ExtMode_NonExtendable, 7, 255, 0,
};

static const upb_MiniTable_Sub google_api_expr_v1alpha1_Constant_submsgs[2] = {
  {.submsg = &google_protobuf_Duration_msginit},
  {.submsg = &google_protobuf_Timestamp_msginit},
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_Constant__fields[9] = {
  {1, UPB_SIZE(8, 8), UPB_SIZE(-1, -1), kUpb_NoSub, 5, kUpb_FieldMode_Scalar | (kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(8, 8), UPB_SIZE(-1, -1), kUpb_NoSub, 8, kUpb_FieldMode_Scalar | (kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(8, 8), UPB_SIZE(-1, -1), kUpb_NoSub, 3, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(8, 8), UPB_SIZE(-1, -1), kUpb_NoSub, 4, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)},
  {5, UPB_SIZE(8, 8), UPB_SIZE(-1, -1), kUpb_NoSub, 1, kUpb_FieldMode_Scalar | (kUpb_FieldRep_8Byte << kUpb_FieldRep_Shift)},
  {6, UPB_SIZE(8, 8), UPB_SIZE(-1, -1), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {7, UPB_SIZE(8, 8), UPB_SIZE(-1, -1), kUpb_NoSub, 12, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {8, UPB_SIZE(8, 8), UPB_SIZE(-1, -1), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {9, UPB_SIZE(8, 8), UPB_SIZE(-1, -1), 1, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_Constant_msginit = {
  &google_api_expr_v1alpha1_Constant_submsgs[0],
  &google_api_expr_v1alpha1_Constant__fields[0],
  UPB_SIZE(16, 24), 9, kUpb_ExtMode_NonExtendable, 9, 255, 0,
};

static const upb_MiniTable_Sub google_api_expr_v1alpha1_SourceInfo_submsgs[2] = {
  {.submsg = &google_api_expr_v1alpha1_SourceInfo_PositionsEntry_msginit},
  {.submsg = &google_api_expr_v1alpha1_SourceInfo_MacroCallsEntry_msginit},
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_SourceInfo__fields[5] = {
  {1, UPB_SIZE(0, 0), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(8, 16), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(16, 32), UPB_SIZE(0, 0), kUpb_NoSub, 5, kUpb_FieldMode_Array | kUpb_LabelFlags_IsPacked | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(20, 40), UPB_SIZE(0, 0), 0, 11, kUpb_FieldMode_Map | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
  {5, UPB_SIZE(24, 48), UPB_SIZE(0, 0), 1, 11, kUpb_FieldMode_Map | (kUpb_FieldRep_Pointer << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_SourceInfo_msginit = {
  &google_api_expr_v1alpha1_SourceInfo_submsgs[0],
  &google_api_expr_v1alpha1_SourceInfo__fields[0],
  UPB_SIZE(32, 56), 5, kUpb_ExtMode_NonExtendable, 5, 255, 0,
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_SourceInfo_PositionsEntry__fields[2] = {
  {1, UPB_SIZE(0, 0), UPB_SIZE(0, 0), kUpb_NoSub, 3, kUpb_FieldMode_Scalar | (kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(8, 16), UPB_SIZE(0, 0), kUpb_NoSub, 5, kUpb_FieldMode_Scalar | (kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_SourceInfo_PositionsEntry_msginit = {
  NULL,
  &google_api_expr_v1alpha1_SourceInfo_PositionsEntry__fields[0],
  UPB_SIZE(16, 32), 2, kUpb_ExtMode_NonExtendable, 2, 255, 0,
};

static const upb_MiniTable_Sub google_api_expr_v1alpha1_SourceInfo_MacroCallsEntry_submsgs[1] = {
  {.submsg = &google_api_expr_v1alpha1_Expr_msginit},
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_SourceInfo_MacroCallsEntry__fields[2] = {
  {1, UPB_SIZE(0, 0), UPB_SIZE(0, 0), kUpb_NoSub, 3, kUpb_FieldMode_Scalar | (kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(8, 16), UPB_SIZE(0, 0), 0, 11, kUpb_FieldMode_Scalar | (kUpb_FieldRep_1Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_SourceInfo_MacroCallsEntry_msginit = {
  &google_api_expr_v1alpha1_SourceInfo_MacroCallsEntry_submsgs[0],
  &google_api_expr_v1alpha1_SourceInfo_MacroCallsEntry__fields[0],
  UPB_SIZE(16, 32), 2, kUpb_ExtMode_NonExtendable, 2, 255, 0,
};

static const upb_MiniTable_Field google_api_expr_v1alpha1_SourcePosition__fields[4] = {
  {1, UPB_SIZE(12, 16), UPB_SIZE(0, 0), kUpb_NoSub, 9, kUpb_FieldMode_Scalar | (kUpb_FieldRep_StringView << kUpb_FieldRep_Shift)},
  {2, UPB_SIZE(0, 0), UPB_SIZE(0, 0), kUpb_NoSub, 5, kUpb_FieldMode_Scalar | (kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)},
  {3, UPB_SIZE(4, 4), UPB_SIZE(0, 0), kUpb_NoSub, 5, kUpb_FieldMode_Scalar | (kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)},
  {4, UPB_SIZE(8, 8), UPB_SIZE(0, 0), kUpb_NoSub, 5, kUpb_FieldMode_Scalar | (kUpb_FieldRep_4Byte << kUpb_FieldRep_Shift)},
};

const upb_MiniTable google_api_expr_v1alpha1_SourcePosition_msginit = {
  NULL,
  &google_api_expr_v1alpha1_SourcePosition__fields[0],
  UPB_SIZE(24, 32), 4, kUpb_ExtMode_NonExtendable, 4, 255, 0,
};

static const upb_MiniTable *messages_layout[14] = {
  &google_api_expr_v1alpha1_ParsedExpr_msginit,
  &google_api_expr_v1alpha1_Expr_msginit,
  &google_api_expr_v1alpha1_Expr_Ident_msginit,
  &google_api_expr_v1alpha1_Expr_Select_msginit,
  &google_api_expr_v1alpha1_Expr_Call_msginit,
  &google_api_expr_v1alpha1_Expr_CreateList_msginit,
  &google_api_expr_v1alpha1_Expr_CreateStruct_msginit,
  &google_api_expr_v1alpha1_Expr_CreateStruct_Entry_msginit,
  &google_api_expr_v1alpha1_Expr_Comprehension_msginit,
  &google_api_expr_v1alpha1_Constant_msginit,
  &google_api_expr_v1alpha1_SourceInfo_msginit,
  &google_api_expr_v1alpha1_SourceInfo_PositionsEntry_msginit,
  &google_api_expr_v1alpha1_SourceInfo_MacroCallsEntry_msginit,
  &google_api_expr_v1alpha1_SourcePosition_msginit,
};

const upb_MiniTable_File google_api_expr_v1alpha1_syntax_proto_upb_file_layout = {
  messages_layout,
  NULL,
  NULL,
  14,
  0,
  0,
};

#include "upb/port_undef.inc"


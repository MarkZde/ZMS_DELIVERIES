class ZMS_CL_SERVICE_CONVERSIONS definition
  public
  final
  create private .

public section.

  class-methods CONV_RANGE_VBELN_EXT_TO_INT
    importing
      !IT_RANGE_VBELN_EXT type ZMS_TT_RANGE_VBELN
    returning
      value(RT_RANGE_VBELN_INT) type ZMS_TT_RANGE_VBELN .
  class-methods CONV_RANGE_VBELN_INT_TO_EXT
    importing
      !IT_RANGE_VBELN_INT type ZMS_TT_RANGE_VBELN
    returning
      value(RT_RANGE_VBELN_EXT) type ZMS_TT_RANGE_VBELN .
  class-methods CONV_VBELN_EXT_TO_INT
    importing
      !IV_VBELN_EXT type VBELN
    returning
      value(RV_VBELN_INT) type VBELN .
  class-methods CONV_VBELN_INT_TO_EXT
    importing
      !IV_VBELN_INT type VBELN
    returning
      value(RV_VBELN_EXT) type VBELN .
protected section.
private section.
ENDCLASS.



CLASS ZMS_CL_SERVICE_CONVERSIONS IMPLEMENTATION.


METHOD conv_range_vbeln_ext_to_int.

  DATA lv_vbeln_dummy TYPE vbeln.

  CHECK it_range_vbeln_ext IS NOT INITIAL.

  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_RANGE_I'
    EXPORTING
      input     = lv_vbeln_dummy
    IMPORTING
      output    = lv_vbeln_dummy
    TABLES
      range_ext = it_range_vbeln_ext
      range_int = rt_range_vbeln_int.

ENDMETHOD.


METHOD conv_range_vbeln_int_to_ext.

  DATA lv_vbeln_dummy TYPE vbeln.

  CHECK it_range_vbeln_int IS NOT INITIAL.

  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_RANGE_O'
    EXPORTING
      input     = lv_vbeln_dummy
    IMPORTING
      output    = lv_vbeln_dummy
    TABLES
      range_int = it_range_vbeln_int
      range_ext = rt_range_vbeln_ext.

ENDMETHOD.


METHOD conv_vbeln_ext_to_int.

  CHECK iv_vbeln_ext IS NOT INITIAL.

  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
    EXPORTING
      input  = iv_vbeln_ext
    IMPORTING
      output = rv_vbeln_int.

ENDMETHOD.


METHOD conv_vbeln_int_to_ext.

  CHECK iv_vbeln_int IS NOT INITIAL.

  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
    EXPORTING
      input  = iv_vbeln_int
    IMPORTING
      output = rv_vbeln_ext.

ENDMETHOD.
ENDCLASS.

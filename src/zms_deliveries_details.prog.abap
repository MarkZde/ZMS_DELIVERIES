REPORT zms_deliveries_details.

INITIALIZATION.

  " delivery range
  DATA gv_delivery TYPE zms_delivery.
  SELECT-OPTIONS so_deliv FOR gv_delivery OBLIGATORY.

  INCLUDE zms_deliveries_details_d01. " main class definition
  INCLUDE zms_deliveries_details_p01. " main class implementation

START-OF-SELECTION.

  TRY.
      lcl_report=>get_instance( )->run( ).
    CATCH zcx_ms_deliveries INTO DATA(gx_ms_deliveries) ##NEEDED.
      lcl_report=>display_exception( gx_ms_deliveries ).
  ENDTRY.

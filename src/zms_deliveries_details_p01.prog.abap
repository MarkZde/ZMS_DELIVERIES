*&---------------------------------------------------------------------*
*&  Include           ZMS_DELIVERIES_DETAILS_P01
*&---------------------------------------------------------------------*

CLASS lcl_report IMPLEMENTATION.

  METHOD get_instance.

    " singleton pattern

    IF mo_instance IS NOT BOUND.
      mo_instance = NEW #( ).
    ENDIF.

    ro_result = mo_instance.

  ENDMETHOD.

  METHOD run.

    me->obtain( ).

    me->display( ).

  ENDMETHOD.

  METHOD obtain.

    mt_likp_deliveries_details = zms_cl_service_deliveries=>get_deliveries_details_01( so_deliv[] ).

  ENDMETHOD.

  METHOD display.

    DATA lt_likp_deliveries_details TYPE STANDARD TABLE OF likp WITH NON-UNIQUE KEY mandt vbeln.

    lt_likp_deliveries_details = mt_likp_deliveries_details.

    TRY.
        cl_salv_table=>factory( IMPORTING r_salv_table = DATA(lo_salv_table)
                                CHANGING  t_table      = lt_likp_deliveries_details ).

      CATCH cx_salv_msg INTO DATA(lx_salv_msg).
        RAISE EXCEPTION TYPE zcx_ms_deliveries EXPORTING previous = lx_salv_msg.
    ENDTRY.

    lo_salv_table->get_functions( )->set_all( if_salv_c_bool_sap=>true ).

    lo_salv_table->get_display_settings( )->set_striped_pattern( if_salv_c_bool_sap=>true ).

    lo_salv_table->display( ).

  ENDMETHOD.

  METHOD display_exception.

    MESSAGE ix_ms_deliveries->get_text( ) TYPE 'I' DISPLAY LIKE 'E'.

    DATA(lx_previous) = ix_ms_deliveries->previous.
    DO.
      IF lx_previous IS NOT BOUND.
        EXIT.
      ELSE.
        MESSAGE lx_previous->get_text( ) TYPE 'I' DISPLAY LIKE 'E'.
        lx_previous = lx_previous->previous.
      ENDIF.
    ENDDO.

  ENDMETHOD.

ENDCLASS.

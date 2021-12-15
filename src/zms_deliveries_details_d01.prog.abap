*&---------------------------------------------------------------------*
*&  Include           ZMS_DELIVERIES_DETAILS_D01
*&---------------------------------------------------------------------*

CLASS lcl_report DEFINITION FINAL CREATE PRIVATE.

  PUBLIC SECTION.

    CLASS-METHODS get_instance RETURNING VALUE(ro_result) TYPE REF TO lcl_report.

    METHODS run RAISING zcx_ms_deliveries.

    CLASS-METHODS display_exception IMPORTING ix_ms_deliveries TYPE REF TO zcx_ms_deliveries.

  PROTECTED SECTION.

    DATA mt_likp_deliveries_details TYPE zms_tt_likp_deliveries_details.

    METHODS obtain.

    METHODS display RAISING zcx_ms_deliveries.

  PRIVATE SECTION.

    CLASS-DATA mo_instance TYPE REF TO lcl_report.

ENDCLASS.

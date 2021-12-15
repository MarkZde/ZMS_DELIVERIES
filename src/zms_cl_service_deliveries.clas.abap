class ZMS_CL_SERVICE_DELIVERIES definition
  public
  final
  create private .

public section.

  class-methods GET_DELIVERIES_DETAILS_01
    importing
      !IT_RANGE_DELIVERY type ZMS_TT_RANGE_DELIVERY
    returning
      value(RT_RESULT) type ZMS_TT_LIKP_DELIVERIES_DETAILS .
protected section.
private section.
ENDCLASS.



CLASS ZMS_CL_SERVICE_DELIVERIES IMPLEMENTATION.


METHOD get_deliveries_details_01.
*** no exceptions in case nothing is found ***

  CHECK it_range_delivery IS NOT INITIAL.

  DATA(lt_range_delivery_int) = zms_cl_service_conversions=>conv_range_vbeln_ext_to_int( it_range_delivery ).

  SELECT FROM likp FIELDS * WHERE vbeln IN @lt_range_delivery_int INTO CORRESPONDING FIELDS OF TABLE @rt_result.

ENDMETHOD.
ENDCLASS.

CLASS zbd_cl_owm_data_clouds DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS get_all RETURNING VALUE(ret) TYPE i.
    METHODS set_all IMPORTING !all       TYPE i.

  PRIVATE SECTION.
    DATA all TYPE i.

ENDCLASS.


CLASS zbd_cl_owm_data_clouds IMPLEMENTATION.
  METHOD get_all.
    ret = all.
  ENDMETHOD.

  METHOD set_all.
    me->all = all.
  ENDMETHOD.
ENDCLASS.

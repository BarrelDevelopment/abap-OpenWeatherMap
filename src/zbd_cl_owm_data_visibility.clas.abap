CLASS zbd_cl_owm_data_visibility DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS get_visibility RETURNING VALUE(ret) TYPE i.
    METHODS set_visibility IMPORTING visibility TYPE i.

  PRIVATE SECTION.
    DATA visibility TYPE i.

ENDCLASS.


CLASS zbd_cl_owm_data_visibility IMPLEMENTATION.
  METHOD get_visibility.
    ret = visibility.
  ENDMETHOD.

  METHOD set_visibility.
    me->visibility = visibility.
  ENDMETHOD.
ENDCLASS.

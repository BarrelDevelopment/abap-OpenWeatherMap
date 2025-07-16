CLASS zbd_cl_owm_data_wind DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_speed TYPE p LENGTH 2 DECIMALS 2.
    TYPES ty_gust  TYPE p LENGTH 2 DECIMALS 2.

    METHODS get_speed RETURNING VALUE(ret) TYPE ty_speed.
    METHODS set_speed IMPORTING speed      TYPE ty_speed.
    METHODS get_deg   RETURNING VALUE(ret) TYPE i.
    METHODS set_deg   IMPORTING deg        TYPE i.
    METHODS get_gust  RETURNING VALUE(ret) TYPE ty_gust.
    METHODS set_gust  IMPORTING gust       TYPE ty_gust.

  PRIVATE SECTION.
    DATA speed TYPE p LENGTH 2 DECIMALS 2.
    DATA deg   TYPE i.
    DATA gust  TYPE p LENGTH 2 DECIMALS 2.

ENDCLASS.


CLASS zbd_cl_owm_data_wind IMPLEMENTATION.
  METHOD get_speed.
    ret = speed.
  ENDMETHOD.

  METHOD set_speed.
    me->speed = speed.
  ENDMETHOD.

  METHOD get_deg.
    ret = deg.
  ENDMETHOD.

  METHOD set_deg.
    me->deg = deg.
  ENDMETHOD.

  METHOD get_gust.
    ret = gust.
  ENDMETHOD.

  METHOD set_gust.
    me->gust = gust.
  ENDMETHOD.
ENDCLASS.

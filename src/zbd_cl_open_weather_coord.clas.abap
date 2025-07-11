CLASS zbd_cl_open_weather_coord DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_lon   TYPE p          DECIMALS 2 LENGTH 2.
    TYPES ty_lat   TYPE p          DECIMALS 2 LENGTH 2.

    METHODS get_lon RETURNING VALUE(ret) TYPE ty_lon.
    METHODS get_lat RETURNING VALUE(ret) TYPE ty_lat.
    METHODS set_lat IMPORTING lat           TYPE ty_lat.
    METHODS set_lon IMPORTING lon           TYPE ty_lon.

  PRIVATE SECTION.
    DATA lon TYPE ty_lon.
    DATA lat TYPE ty_lat.

ENDCLASS.


CLASS zbd_cl_open_weather_coord IMPLEMENTATION.
  METHOD get_lon.
    ret = lon.
  ENDMETHOD.

  METHOD get_lat.
    ret = lat.
  ENDMETHOD.

  METHOD set_lat.
    me->lat = lat.
  ENDMETHOD.

  METHOD set_lon.
    me->lon = lon.
  ENDMETHOD.
ENDCLASS.

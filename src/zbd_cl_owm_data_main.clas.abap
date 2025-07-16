CLASS zbd_cl_owm_data_main DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES ty_temp       TYPE p LENGTH 2 DECIMALS 2.
    TYPES ty_feels_like TYPE p LENGTH 2 DECIMALS 2.
    TYPES ty_temp_min   TYPE p LENGTH 2 DECIMALS 2.
    TYPES ty_temp_max   TYPE p LENGTH 2 DECIMALS 2.

    METHODS get_temp       RETURNING VALUE(ret) TYPE ty_temp.
    METHODS set_temp       IMPORTING temp          TYPE ty_temp.
    METHODS get_feels_like RETURNING VALUE(ret) TYPE ty_feels_like.
    METHODS set_feels_like IMPORTING feels_like    TYPE ty_feels_like.
    METHODS get_pressure   RETURNING VALUE(ret) TYPE i.
    METHODS set_pressure   IMPORTING pressure      TYPE i.
    METHODS get_humidity   RETURNING VALUE(ret) TYPE i.
    METHODS set_humidity   IMPORTING humidity      TYPE i.
    METHODS get_temp_min   RETURNING VALUE(ret) TYPE ty_temp_min.
    METHODS set_temp_min   IMPORTING temp_min      TYPE ty_temp_min.
    METHODS get_temp_max   RETURNING VALUE(ret) TYPE ty_temp_max.
    METHODS set_temp_max   IMPORTING temp_max      TYPE ty_temp_max.
    METHODS get_sea_level  RETURNING VALUE(ret) TYPE i.
    METHODS set_sea_level  IMPORTING sea_level     TYPE i.
    METHODS get_grd_level  RETURNING VALUE(ret) TYPE i.
    METHODS set_grd_level  IMPORTING grd_level     TYPE i.

  PRIVATE SECTION.
    DATA temp       TYPE p LENGTH 2 DECIMALS 2.
    DATA feels_like TYPE p LENGTH 2 DECIMALS 2.
    DATA pressure   TYPE i.
    DATA humidity   TYPE i.
    DATA temp_min   TYPE p LENGTH 2 DECIMALS 2.
    DATA temp_max   TYPE p LENGTH 2 DECIMALS 2.
    DATA sea_level  TYPE i.
    DATA grd_level  TYPE i.

ENDCLASS.


CLASS zbd_cl_owm_data_main IMPLEMENTATION.
  METHOD get_temp.
    ret = temp.
  ENDMETHOD.

  METHOD set_temp.
    me->temp = temp.
  ENDMETHOD.

  METHOD get_feels_like.
    ret = feels_like.
  ENDMETHOD.

  METHOD set_feels_like.
    me->feels_like = feels_like.
  ENDMETHOD.

  METHOD get_pressure.
    ret = pressure.
  ENDMETHOD.

  METHOD set_pressure.
    me->pressure = pressure.
  ENDMETHOD.

  METHOD get_humidity.
    ret = humidity.
  ENDMETHOD.

  METHOD set_humidity.
    me->humidity = humidity.
  ENDMETHOD.

  METHOD get_temp_min.
    ret = temp_min.
  ENDMETHOD.

  METHOD set_temp_min.
    me->temp_min = temp_min.
  ENDMETHOD.

  METHOD get_temp_max.
    ret = temp_max.
  ENDMETHOD.

  METHOD set_temp_max.
    me->temp_max = temp_max.
  ENDMETHOD.

  METHOD get_sea_level.
    ret = sea_level.
  ENDMETHOD.

  METHOD set_sea_level.
    me->sea_level = sea_level.
  ENDMETHOD.

  METHOD get_grd_level.
    ret = grd_level.
  ENDMETHOD.

  METHOD set_grd_level.
    me->grd_level = grd_level.
  ENDMETHOD.
ENDCLASS.

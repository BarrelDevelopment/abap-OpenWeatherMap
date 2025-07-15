CLASS zbd_cl_owm_data_weather DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS get_id          RETURNING VALUE(ret)   TYPE i.
    METHODS set_id          IMPORTING !id          TYPE i.
    METHODS get_main        RETURNING VALUE(ret)   TYPE string.
    METHODS set_main        IMPORTING !main        TYPE string.
    METHODS get_description RETURNING VALUE(ret)   TYPE string.
    METHODS set_description IMPORTING !description TYPE string.
    METHODS get_icon_id     RETURNING VALUE(ret)   TYPE i.
    METHODS set_icon_id     IMPORTING !icon        TYPE i.

  PRIVATE SECTION.
    DATA id          TYPE i.
    DATA main        TYPE string.
    DATA description TYPE string.
    DATA icon_id     TYPE i.

ENDCLASS.


CLASS zbd_cl_owm_data_weather IMPLEMENTATION.
  METHOD get_id.
    ret = id.
  ENDMETHOD.

  METHOD set_id.
    me->id = id.
  ENDMETHOD.

  METHOD get_main.
    ret = main.
  ENDMETHOD.

  METHOD set_main.
    me->main = main.
  ENDMETHOD.

  METHOD get_description.
    ret = description.
  ENDMETHOD.

  METHOD set_description.
    me->description = description.
  ENDMETHOD.

  METHOD get_icon_id.
    ret = icon_id.
  ENDMETHOD.

  METHOD set_icon_id.
    icon_id = icon.
  ENDMETHOD.
ENDCLASS.

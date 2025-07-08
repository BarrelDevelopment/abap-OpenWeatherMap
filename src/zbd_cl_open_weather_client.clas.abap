CLASS zbd_cl_open_weather_client DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING api_key TYPE string.

  PRIVATE SECTION.
    DATA http_client TYPE REF TO if_http_client.
    DATA api_key     TYPE string.
    DATA base_url    TYPE string VALUE 'https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid={API key}'.

    METHODS create_http_client.

ENDCLASS.


CLASS zbd_cl_open_weather_client IMPLEMENTATION.
  METHOD constructor.
    me->api_key = api_key.
  ENDMETHOD.

  METHOD create_http_client.
    IF http_client IS BOUND.
      RETURN.
    ENDIF.

    cl_http_client=>create_by_url( EXPORTING  url                = base_url
                                   IMPORTING  client             = http_client
                                   EXCEPTIONS argument_not_found = 1
                                              plugin_not_active  = 2
                                              internal_error     = 3
                                              OTHERS             = 4 ).

    IF sy-subrc = 0.
      RETURN.
    ENDIF.

    http_client->close( ).
  ENDMETHOD.
ENDCLASS.

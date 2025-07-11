CLASS zbd_cl_open_weather_client DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS get_weather_by_cords IMPORTING api_key         TYPE string OPTIONAL
                                           lat             TYPE string OPTIONAL
                                           !log            TYPE string OPTIONAL
                                           !unit           TYPE string OPTIONAL
                                 RETURNING VALUE(response) TYPE string.

  PRIVATE SECTION.
    DATA http_client TYPE REF TO if_http_client.
    DATA api_key     TYPE string.
    DATA base_url    TYPE string
                     VALUE 'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={long}&appid={app_key}&units={unit}'.

    METHODS get_formatted_json_string
      IMPORTING json_string_in         TYPE string
      RETURNING VALUE(json_string_out) TYPE string
      RAISING   cx_sxml_parse_error.

    METHODS replace_base_url
      IMPORTING !unit          TYPE string
                !long          TYPE string
                lat            TYPE string
                api_key        TYPE string
      RETURNING VALUE(new_url) TYPE string.

ENDCLASS.


CLASS zbd_cl_open_weather_client IMPLEMENTATION.
  METHOD get_weather_by_cords.
    DATA(url) = base_url.

    url = replace_base_url( unit    = unit
                      long    = log
                      lat     = lat
                      api_key = api_key ).

    cl_http_client=>create_by_url( EXPORTING  url                = url
                                   IMPORTING  client             = http_client
                                   EXCEPTIONS argument_not_found = 1
                                              plugin_not_active  = 2
                                              internal_error     = 3
                                              OTHERS             = 4 ).

    IF sy-subrc <> 0.
      http_client->close( ).
      RETURN.
    ENDIF.

    http_client->request->set_method( if_http_request=>co_request_method_get ).
    http_client->send( timeout = if_http_client=>co_timeout_default ).
    http_client->receive( ).

    DATA http_status TYPE i.
    " TODO: variable is assigned but never used (ABAP cleaner)
    DATA status_text TYPE string.

    http_client->response->get_status( IMPORTING code   = http_status
                                                 reason = status_text ).
    IF http_status <> 200.
      " Do something
    ENDIF.

    response = http_client->response->get_cdata( ).
    RETURN.
  ENDMETHOD.

  METHOD replace_base_url.
    new_url = base_url.
    REPLACE ALL OCCURRENCES OF '{lat}' IN new_url WITH lat.
    REPLACE ALL OCCURRENCES OF '{long}' IN new_url WITH long.
    REPLACE ALL OCCURRENCES OF '{app_key}' IN new_url WITH api_key.
    REPLACE ALL OCCURRENCES OF '{unit}' IN new_url WITH unit.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    " Berlin, Germany
    " Latitude and longitude coordinates are: 52.520008, 13.404954.
    DATA(result) = get_weather_by_cords( api_key = '391419ea384228301f815931cbe36241'
                                         lat     = '52.52'
                                         log     = '13.40'
                                         unit    = 'metric' ).
    TRY.
        DATA(formatted_json_string) = get_formatted_json_string( result ).
      CATCH cx_sxml_parse_error.
        out->write( 'parse error' ).
        EXIT.
    ENDTRY.

    out->write( 'Result as json:' ).
    out->write( formatted_json_string ).

    http_client->close( ).
  ENDMETHOD.

  METHOD get_formatted_json_string.
    " cloud
    " DATA(json_xstring) = cl_abap_conv_codepage=>create_out( )->convert( json_string_in ).
    " on_premise
    DATA(json_xstring) = cl_abap_codepage=>convert_to( json_string_in ).

    " Check and pretty print JSON

    DATA(reader) = cl_sxml_string_reader=>create( json_xstring ).
    DATA(writer) = CAST if_sxml_writer(
                          cl_sxml_string_writer=>create( type = if_sxml=>co_xt_json ) ).
    writer->set_option( option = if_sxml_writer=>co_opt_linebreaks ).
    writer->set_option( option = if_sxml_writer=>co_opt_indent ).
    reader->next_node( ).
    reader->skip_node( writer ).

    " cloud
    " DATA(json_formatted_string) = cl_abap_conv_codepage=>create_in( )->convert( CAST cl_sxml_string_writer( writer )->get_output( ) ).
    " on premise
    DATA(json_formatted_string) = cl_abap_codepage=>convert_from( CAST cl_sxml_string_writer( writer )->get_output( ) ).

    json_string_out = escape( val    = json_formatted_string
                              format = cl_abap_format=>e_xml_text  ).
  ENDMETHOD.
ENDCLASS.

"! <h1>API for Getting a Travel</h1>
"!
"! <p>
"! Function module to get a single Travel instance with all related Bookings and
"! Booking Supplements related to the importing Travel ID.
"! </p>
"!
"!
"! @parameter iv_travel_id          | Travel ID
"! @parameter iv_include_buffer     | Include any changes that have not yet been committed
"! @parameter es_travel             | Travel Data like /DMO/TRAVEL28 related to the importing Travel ID
"! @parameter et_booking            | Table of Bookings like /DMO/BOOKING28 related to the importing Travel ID
"! @parameter et_booking_supplement | Table of Booking Supplements like /DMO/BOOK_SUP_28 related to the importing Travel ID
"! @parameter et_messages           | Table of occurred messages
"!
FUNCTION /DMO/FLIGHT_TRAVEL_READ28.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_TRAVEL_ID) TYPE  /DMO/TRAVEL_ID28
*"     REFERENCE(IV_INCLUDE_BUFFER) TYPE  ABAP_BOOLEAN DEFAULT
*"       ABAP_TRUE
*"  EXPORTING
*"     REFERENCE(ES_TRAVEL) TYPE  /DMO/TRAVEL28
*"     REFERENCE(ET_BOOKING) TYPE  /DMO/IF_FLIGHT_LEGACY28=>TT_BOOKING
*"     REFERENCE(ET_BOOKING_SUPPLEMENT) TYPE
*"        /DMO/IF_FLIGHT_LEGACY28=>TT_BOOKING_SUPPLEMENT
*"     REFERENCE(ET_MESSAGES) TYPE  /DMO/IF_FLIGHT_LEGACY28=>TT_MESSAGE
*"----------------------------------------------------------------------
  CLEAR es_travel.
  CLEAR et_booking.
  CLEAR et_booking_supplement.
  CLEAR et_messages.

  /dmo/cl_flight_legacy28=>get_instance( )->get_travel( EXPORTING iv_travel_id          = iv_travel_id
                                                                iv_include_buffer     = iv_include_buffer
                                                      IMPORTING es_travel             = es_travel
                                                                et_booking            = et_booking
                                                                et_booking_supplement = et_booking_supplement
                                                                et_messages           = DATA(lt_messages) ).

  /dmo/cl_flight_legacy28=>get_instance( )->convert_messages( EXPORTING it_messages = lt_messages
                                                            IMPORTING et_messages = et_messages ).
ENDFUNCTION.

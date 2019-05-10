"! API for Saving the Transactional Buffer of the Travel API
"!
FUNCTION /DMO/FLIGHT_TRAVEL_SAVE28.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"----------------------------------------------------------------------
  /dmo/cl_flight_legacy28=>get_instance( )->save( ).
ENDFUNCTION.

@AbapCatalog.sqlViewName: '/DMO/CURRHLP28'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Help View for Currency Conversion'
define view /DMO/CURRENCY_HELPER28
  with parameters
    amount             : /dmo/total_price28,
    source_currency    : /dmo/currency_code28,
    target_currency    : /dmo/currency_code28,
    exchange_rate_date : /dmo/booking_date28

  as select from /dmo/agency28

{
  key currency_conversion( amount             => $parameters.amount,
                           source_currency    => $parameters.source_currency,
                           target_currency    => $parameters.target_currency,
                           exchange_rate_date => $parameters.exchange_rate_date,
                           error_handling     => 'SET_TO_NULL' ) as ConvertedAmount
}

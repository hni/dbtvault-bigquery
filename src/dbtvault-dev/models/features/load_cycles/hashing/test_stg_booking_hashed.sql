{{- config(materialized='table', schema='test_vlt', enabled=true, tags='feature')                                               -}}

{%- set source_table = source('test', 'stg_booking')                                                                            -%}

{{ dbtvault.multi_hash([('BOOKING_REF', 'BOOKING_PK'),
                         ('CUSTOMER_ID', 'CUSTOMER_PK'),
                         (['CUSTOMER_ID', 'BOOKING_REF'],'CUSTOMER_BOOKING_PK'),
                         (['CUSTOMER_ID', 'NATIONALITY', 'PHONE'], 'BOOK_CUSTOMER_HASHDIFF'),
                         (['BOOKING_REF', 'BOOKING_DATE', 'DEPARTURE_DATE', 'PRICE', 'DESTINATION'], 'BOOK_BOOKING_HASHDIFF')]) -}},

{{ dbtvault.add_columns(source_table,
                        [('!STG_BOOKING', 'SOURCE'),
                         ('BOOKING_DATE', 'EFFECTIVE_FROM')])                                                                    }}

{{- dbtvault.from(source_table)                                                                                                  }}
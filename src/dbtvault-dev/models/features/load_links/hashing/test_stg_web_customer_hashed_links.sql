{{- config(materialized='table', schema='test_vlt', enabled=true, tags='feature')             -}}

{{ dbtvault.multi_hash([('CUSTOMER_REF', 'CUSTOMER_PK'),
                         ('NATION_KEY', 'NATION_PK'),
                         (['CUSTOMER_REF', 'NATION_KEY'], 'CUSTOMER_NATION_PK')])              }},

{{ dbtvault.add_columns([('CUSTOMER_REF', 'CUSTOMER_REF'),
                         ('LOADDATE', 'LOADDATE'),
                         ('SOURCE', 'SOURCE')])                                                }}

{{- dbtvault.from(source_table='DV_PROTOTYPE_DB.SRC_TEST_STG.test_stg_web_customer') }}



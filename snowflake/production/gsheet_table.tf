resource "snowflake_table" "payments" {
  database = snowflake_database.urban_route_db.name
  schema   = snowflake_schema.bronze.name
  name     = "PAYMENTS"

  column {
    name     = "PAYMENT_ID"
    type     = "VARCHAR(36)"
    nullable = false
  }

  column {
    name     = "TRIP_ID"
    type     = "VARCHAR(36)"
    nullable = false
  }

  column {
    name     = "USER_ID"
    type     = "VARCHAR(36)"
    nullable = false
  }

  column {
    name     = "PAYMENT_TIMESTAMP"
    type     = "TIMESTAMP_NTZ"
    nullable = false
  }

  column {
    name     = "SOURCE_SYSTEM"
    type     = "VARCHAR(100)"
    nullable = true
  }

  column {
    name     = "GROSS_AMOUNT_EUR"
    type     = "NUMBER(12, 2)"
    nullable = true
  }

  column {
    name     = "DISCOUNT_AMOUNT_EUR"
    type     = "NUMBER(12, 2)"
    nullable = true
  }

  column {
    name     = "REFUND_AMOUNT_EUR"
    type     = "NUMBER(12, 2)"
    nullable = true
  }

  column {
    name     = "NET_AMOUNT_EUR"
    type     = "NUMBER(12, 2)"
    nullable = true
  }

  column {
    name     = "NOTES"
    type     = "VARCHAR"
    nullable = true
  }

  column {
    name     = "LOADED_AT"
    type     = "TIMESTAMP_NTZ"
    nullable = true
  }

  comment = "Raw manual payment data ingested from Google Sheets"
}

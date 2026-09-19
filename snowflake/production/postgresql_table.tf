resource "snowflake_table" "users" {
  database = snowflake_database.urban_route_db.name
  schema   = snowflake_schema.bronze.name
  name     = "USERS"

  comment = "Bronze user data ingested from PostgreSQL."

  column {
    name = "USER_ID"
    type = "VARCHAR(36)"
  }

  column {
    name = "REGISTRATION_DATE"
    type = "DATE"
  }

  column {
    name = "USER_SEGMENT"
    type = "VARCHAR"
  }

  column {
    name = "COUNTRY_CODE"
    type = "VARCHAR(2)"
  }

  column {
    name = "IS_ACTIVE"
    type = "BOOLEAN"
  }

  column {
    name = "LOADED_AT"
    type = "TIMESTAMP_NTZ"
  }
}

resource "snowflake_table" "vehicles" {
  database = snowflake_database.urban_route_db.name
  schema   = snowflake_schema.bronze.name
  name     = "VEHICLES"

  comment = "Bronze vehicle data ingested from PostgreSQL."

  column {
    name = "VEHICLE_ID"
    type = "VARCHAR(36)"
  }

  column {
    name = "VEHICLE_TYPE"
    type = "VARCHAR"
  }

  column {
    name = "HARDWARE_VERSION"
    type = "VARCHAR"
  }

  column {
    name = "DEPLOYMENT_DATE"
    type = "DATE"
  }

  column {
    name = "CURRENT_STATUS"
    type = "VARCHAR"
  }

  column {
    name = "LOADED_AT"
    type = "TIMESTAMP_NTZ"
  }
}

resource "snowflake_table" "app_payments" {
  database = snowflake_database.urban_route_db.name
  schema   = snowflake_schema.bronze.name
  name     = "APP_PAYMENTS"

  comment = "Bronze digital payment data ingested from PostgreSQL."

  column {
    name = "PAYMENT_ID"
    type = "VARCHAR(36)"
  }

  column {
    name = "TRIP_ID"
    type = "VARCHAR(36)"
  }

  column {
    name = "USER_ID"
    type = "VARCHAR(36)"
  }

  column {
    name = "PAYMENT_TIMESTAMP"
    type = "TIMESTAMP_NTZ"
  }

  column {
    name = "SOURCE_SYSTEM"
    type = "VARCHAR"
  }

  column {
    name = "GROSS_AMOUNT_EUR"
    type = "NUMBER(12,2)"
  }

  column {
    name = "DISCOUNT_AMOUNT_EUR"
    type = "NUMBER(12,2)"
  }

  column {
    name = "REFUND_AMOUNT_EUR"
    type = "NUMBER(12,2)"
  }

  column {
    name = "NET_AMOUNT_EUR"
    type = "NUMBER(12,2)"
  }

  column {
    name = "LOADED_AT"
    type = "TIMESTAMP_NTZ"
  }
}

connection: "retail_banking"

# include all the views
include: "/views/**/*.view"

datagroup: retail_banking_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: retail_banking_default_datagroup

explore: clean_data {}

explore: training_data {}

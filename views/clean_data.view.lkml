view: clean_data {
  sql_table_name: `retail_banking.clean_data`
    ;;

  dimension: card_transactions_amount {
    type: number
    sql: ${TABLE}.card_transactions_amount ;;
  }

  dimension: card_transactions_transaction_distance {
    type: number
    sql: ${TABLE}.card_transactions_transaction_distance ;;
  }

  dimension: card_transactions_transaction_hour_of_day {
    type: number
    sql: ${TABLE}.card_transactions_transaction_hour_of_day ;;
  }

  dimension: isfraud {
    type: number
    sql: ${TABLE}.isfraud ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
